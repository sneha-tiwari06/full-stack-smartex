import { db } from "../db.js";
import jwt from "jsonwebtoken";

export const getCeremonys = (req, res) => {
  const q = "SELECT * FROM ceremony order by created_at DESC";

  db.query(q, (err, data) => {
    if (err) return res.status(500).send(err);

    return res.status(200).json(data);
  });
};


export const getCeremony = (req, res) => {
  const q = "SELECT p.id, `ceremony_name`, `ceremony_date`, `ceremony_link`, `image_url` FROM ceremony WHERE id = ?";

  db.query(q, [req.params.id], (err, data) => {
    if (err) return res.status(500).json(err);

    return res.status(200).json(data[0]);
  });
};

export const addCeremony = async (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    const userInfo = await jwt.verify(token, "jwtkey");
    if (!userInfo) return res.status(403).json("Token is not valid!");

    const { ceremony_name, ceremony_date, ceremony_link, img } = req.body;

    // if (!ceremony_name || !ceremony_date || !ceremony_link  ) {
    //   return res.status(400).json("All fields are required!");
    // }
    console.log(req.body)
    const q = "INSERT INTO ceremony(`ceremony_name`, `ceremony_date`, `ceremony_link`, `image_url`) VALUES (?)";
    const values = [ceremony_name, ceremony_date, ceremony_link, img];

    db.query(q, [values], (err, data) => {
      if (err) return res.status(500).json(err);
      return res.json("Post has been created.");
    });
  } catch (error) {
    return res.status(400).json(error.message);
  }
};



export const deleteCeremony = (req, res) => {
  const token = req.cookies.access_token;
  if (!token) return res.status(401).json("Not authenticated!");

  jwt.verify(token, "jwtkey", (err, userInfo) => {
    if (err) return res.status(403).json("Token is not valid!");

    const postId = req.params.id;
    const q = "DELETE FROM ceremony WHERE `id` = ?";

    db.query(q, [postId, userInfo.id], (err, data) => {
      if (err) return res.status(403).json("You can delete only your post!");

      return res.json("Post has been deleted!");
    });
  });
};export const updateCeremony = (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    jwt.verify(token, "jwtkey", (err, userInfo) => {
      if (err) return res.status(403).json("Token is not valid!");

      const { ceremony_name, ceremony_date, ceremony_link, img, active } = req.body;
      const postId = req.params.id;

      let q = "UPDATE ceremony SET ";
      let values = [];
      let setClauses = [];

      if (active === false || active === true) {
        setClauses.push("active = ?");
        values.push(active ? 1 : 0);
      }

      if (ceremony_name !== undefined && ceremony_name !== null) {
        setClauses.push("ceremony_name = ?");
        values.push(ceremony_name);
      }

      if (ceremony_date !== undefined && ceremony_date !== null) {
        setClauses.push("ceremony_date = ?");
        values.push(ceremony_date);
      }

      if (ceremony_link !== undefined && ceremony_link !== null) {
        setClauses.push("ceremony_link = ?");
        values.push(ceremony_link);
      }

      if (img !== undefined && img !== null && img !== '') {
        setClauses.push("image_url = ?");
        values.push(img);
      }

      if (setClauses.length === 0) {
        return res.json("No changes to update."); 
      }

      q += setClauses.join(", ");
      q += " WHERE id = ?";
      values.push(postId);

      db.query(q, values, (err, data) => {
        if (err) return res.status(500).json(err);
        return res.json("Post has been updated.");
      });
    });
  } catch (error) {
    return res.status(400).json(error.message);
  }
};
