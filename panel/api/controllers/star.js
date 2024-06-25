import { db } from "../db.js";
import jwt from "jsonwebtoken";

export const getSpeakers = (req, res) => {
  const q = "SELECT * FROM speakers ORDER BY created_at DESC";

  db.query(q, (err, data) => {
    if (err) return res.status(500).send(err);
    return res.status(200).json(data);
  });
};

export const getSpeaker = (req, res) => {
  const q = "SELECT p.id, `speaker_name`, `designation`, `speaker_order`, `speaker_img`, `description` FROM speakers WHERE id = ?";

  db.query(q, [req.params.id], (err, data) => {
    if (err) return res.status(500).json(err);
    return res.status(200).json(data[0]);
  });
};

export const addSpeaker = async (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    const userInfo = await jwt.verify(token, "jwtkey");
    if (!userInfo) return res.status(403).json("Token is not valid!");

    const { speaker_name, designation, speaker_order, speaker_img, description } = req.body;
console.log(req.body, "insertion")
    const q = "INSERT INTO speakers(`speaker_name`, `designation`, `speaker_order`, `speaker_img`, `description`) VALUES (?)";
    const values = [speaker_name, designation, speaker_order, speaker_img, description];

    db.query(q, [values], (err, data) => {
      if (err) return res.status(500).json(err);
      return res.json("Post has been created.");
    });
  } catch (error) {
    return res.status(400).json(error.message);
  }
};

export const deleteSpeaker = (req, res) => {
  const token = req.cookies.access_token;
  if (!token) return res.status(401).json("Not authenticated!");

  jwt.verify(token, "jwtkey", (err, userInfo) => {
    if (err) return res.status(403).json("Token is not valid!");

    const postId = req.params.id;
    const q = "DELETE FROM speakers WHERE `id` = ?";

    db.query(q, [postId, userInfo.id], (err, data) => {
      if (err) return res.status(403).json("You can delete only your post!");
      return res.json("Post has been deleted!");
    });
  });
};
export const updateSpeaker = (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    jwt.verify(token, "jwtkey", (err, userInfo) => {
      if (err) return res.status(403).json("Token is not valid!");

      const { speaker_name, designation, speaker_order, speaker_img, description, active } = req.body;
      console.log(req.body)
      const postId = req.params.id;

      let q;
      let values;

      if (active === false || active === true) {
        q = "UPDATE speakers SET active = ? WHERE id = ?";
        values = [active, postId];
      } else {
        q = "UPDATE speakers SET speaker_name=?, designation=?, speaker_order=?, speaker_img=?, description=?, active=? WHERE id=?";
        values = [
          speaker_name,
          designation,
          speaker_order,
          speaker_img,
          description,
          true,
          postId
        ].filter(value => value !== undefined && value !== null && value !== '');
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
