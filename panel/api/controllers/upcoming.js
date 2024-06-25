import { db } from "../db.js";
import jwt from "jsonwebtoken";

export const getUpcomings = (req, res) => {
  const q = "SELECT * FROM upcoming_events order by created_at DESC";

  db.query(q, (err, data) => {
    if (err) return res.status(500).send(err);

    return res.status(200).json(data);
  });
};


export const getUpcoming = (req, res) => {
  const q = "SELECT p.id, `title`, `alt`, `image_url` FROM upcoming_events WHERE id = ?";

  db.query(q, [req.params.id], (err, data) => {
    if (err) return res.status(500).json(err);

    return res.status(200).json(data[0]);
  });
};

export const addUpcoming = async (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    const userInfo = await jwt.verify(token, "jwtkey");
    if (!userInfo) return res.status(403).json("Token is not valid!");

    const { title, alt, img} = req.body;

    // if (!title || !alt) {
    //   return res.status(400).json("All fields are required!");
    // }

    const q = "INSERT INTO upcoming_events(`title`, `alt`, `image_url`) VALUES (?)";
    const values = [title, alt, img];

    db.query(q, [values], (err, data) => {
      if (err) return res.status(500).json(err);
      return res.json("Post has been created.");
    });
  } catch (error) {
    return res.status(400).json(error.message);
  }
};



export const deleteUpcoming = (req, res) => {
  const token = req.cookies.access_token;
  if (!token) return res.status(401).json("Not authenticated!");

  jwt.verify(token, "jwtkey", (err, userInfo) => {
    if (err) return res.status(403).json("Token is not valid!");

    const postId = req.params.id;
    const q = "DELETE FROM upcoming_events WHERE `id` = ? ";

    db.query(q, [postId, userInfo.id], (err, data) => {
      if (err) return res.status(403).json("You can delete only your post!");

      return res.json("Post has been deleted!");
    });
  });
};export const updateUpcoming = (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    jwt.verify(token, "jwtkey", (err, userInfo) => {
      if (err) return res.status(403).json("Token is not valid!");

      const { title, alt, img, active } = req.body;
      const postId = req.params.id;

      let q;
      let values;

      if (active === false || active === true) {
        q = "UPDATE upcoming_events SET active = ? WHERE id = ?";
        values = [active, postId];
      } else {
        q = "UPDATE upcoming_events SET title=?, alt=?, active=? ";
        values = [
          title,
          alt,
          true, 
        ];
        if (img) {
          q += ", image_url=?"; 
          values.push(img); 
        }
        q += " WHERE id = ?";
        values.push(postId); 
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
