import { db } from "../db.js";
import jwt from "jsonwebtoken";

export const getWinners = (req, res) => {
  const q = "SELECT * FROM winners order by created_at DESC";

  db.query(q, (err, data) => {
    if (err) return res.status(500).send(err);

    return res.status(200).json(data);
  });
};


export const getWinner = (req, res) => {
  const q = "SELECT p.id, `title`, `date`, `img`, `alt_tag`,  FROM winners WHERE id = ?";

  db.query(q, [req.params.id], (err, data) => {
    if (err) return res.status(500).json(err);

    return res.status(200).json(data[0]);
  });
};

export const addWinners = async (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    const userInfo = await jwt.verify(token, "jwtkey");
    if (!userInfo) return res.status(403).json("Token is not valid!");

    const { title, date, img, alt_tag} = req.body;

    // if (!title || !date || !img || !alt_tag ) {
    //   return res.status(400).json("All fields are required!");
    // }

    const q = "INSERT INTO winners(`title`, `date`, `img`, `alt_tag`) VALUES (?)";
    const values = [title, date, img, alt_tag];

    db.query(q, [values], (err, data) => {
      if (err) return res.status(500).json(err);
      return res.json("Post has been created.");
    });
  } catch (error) {
    return res.status(400).json(error.message);
  }
};



export const deleteWinners = (req, res) => {
  const token = req.cookies.access_token;
  if (!token) return res.status(401).json("Not authenticated!");

  jwt.verify(token, "jwtkey", (err, userInfo) => {
    if (err) return res.status(403).json("Token is not valid!");

    const postId = req.params.id;
    const q = "DELETE FROM winners WHERE `id` = ? ";

    db.query(q, [postId, userInfo.id], (err, data) => {
      if (err) return res.status(403).json("You can delete only your post!");

      return res.json("Post has been deleted!");
    });
  });
};
export const updateWinners = (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    jwt.verify(token, "jwtkey", (err, userInfo) => {
      if (err) return res.status(403).json("Token is not valid!");

      const { title, date, img, alt_tag, active } = req.body;
      const postId = req.params.id;

      let q;
      let values;

      if (active === false) {
        q = "UPDATE winners SET active = ? WHERE id = ?";
        values = [false, postId];
      } else if (active === true) {
        q = "UPDATE winners SET active = ? WHERE id = ?";
        values = [true, postId];
      } else {
        q = "UPDATE winners SET `title`=?, `date`=?, `img`=?, `alt_tag`=?, `active`=? WHERE `id` = ?";
        values = [
          title,
          date,
          img,
          alt_tag,
          true, 
          postId
        ].filter(value => value !== undefined && value !== null && value !== '');
      }

      db.query(q, values, (err, data) => {
        if (err) return res.status(500).json(err);
        return res.json("Winner has been updated.");
      });
    });
  } catch (error) {
    return res.status(400).json(error.message);
  }
};
