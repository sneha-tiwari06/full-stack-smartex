import { db } from "../db.js";
import jwt from "jsonwebtoken";

export const getPartners = (req, res) => {
  const q = "SELECT * FROM partners order by created_at DESC";

  db.query(q, (err, data) => {
    if (err) return res.status(500).send(err);

    return res.status(200).json(data);
  });
};


export const getPartner = (req, res) => {
  const q = "SELECT p.id, `alt`, `image_url` FROM partners WHERE id = ?";

  db.query(q, [req.params.id], (err, data) => {
    if (err) return res.status(500).json(err);

    return res.status(200).json(data[0]);
  });
};
export const addPartner = async (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    const userInfo = await jwt.verify(token, "jwtkey");
    if (!userInfo) return res.status(403).json("Token is not valid!");

    const { alt, image_urls } = req.body; // Modify to receive an array of image URLs

    if (!alt.trim() || !image_urls || !image_urls.length) {
      return res.status(400).json("Alternate text and at least one image are required!");
    }

    const values = image_urls.map(image_url => [alt, image_url]);
    const q = "INSERT INTO partners(`alt`, `image_url`) VALUES ?";

    db.query(q, [values], (err, data) => {
      if (err) return res.status(500).json(err);
      return res.json("Posts have been created.");
    });
  } catch (error) {
    return res.status(400).json(error.message);
  }
};


export const deletePartner = (req, res) => {
  const token = req.cookies.access_token;
  if (!token) return res.status(401).json("Not authenticated!");

  jwt.verify(token, "jwtkey", (err, userInfo) => {
    if (err) return res.status(403).json("Token is not valid!");

    const postId = req.params.id;
    const q = "DELETE FROM partners WHERE `id` = ? ";

    db.query(q, [postId, userInfo.id], (err, data) => {
      if (err) return res.status(403).json("You can delete only your post!");

      return res.json("Post has been deleted!");
    });
  });
};
export const updatePartner = (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    jwt.verify(token, "jwtkey", (err, userInfo) => {
      if (err) return res.status(403).json("Token is not valid!");

      const { alt_tag, image_urls, active } = req.body;
      const postId = req.params.id;

      let q;
      let values = [];

      if (typeof active !== 'undefined') {
        q = "UPDATE partners SET `active` = ? WHERE `id` = ?";
        values = [active, postId];
      } else {
        q = "UPDATE partners SET `alt_tag` = ?, `image_urls` = ? WHERE `id` = ?";
        values = [alt_tag || null, image_urls || null, postId];
      }

      db.query(q, values, (err, data) => {
        if (err) return res.status(500).json(err);
        return res.json("Post has been updated.");
      });
    });
  } catch (error) {
    return res.status(400).json(error.message);
  }
};

