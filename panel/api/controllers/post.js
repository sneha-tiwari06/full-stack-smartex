import { db } from "../db.js";
import jwt from "jsonwebtoken";

export const getPosts = (req, res) => {
  const showAll = req.query.showAll;
  const query = showAll
    ? "SELECT * FROM posts ORDER BY date DESC"
    : "SELECT * FROM posts WHERE active = 1 ORDER BY date DESC LIMIT 5";

  db.query(query, (err, data) => {
    if (err) return res.status(500).send(err);
    return res.status(200).json(data);
  });
};




export const getPost = (req, res) => {
  const q =
    "SELECT p.id, `username`, `title`, `desc`, p.img, u.img AS userImg, `cat`,`date`, `meta_title`, `meta_keywords`, `meta_desc`, `blog_by`, `blog_date`, `blog_image_title` FROM users u JOIN posts p ON u.id = p.uid WHERE p.id = ? ";

  db.query(q, [req.params.id], (err, data) => {
    if (err) return res.status(500).json(err);

    return res.status(200).json(data[0]);
  });
};

export const addPost = async (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    const userInfo = await jwt.verify(token, "jwtkey");
    if (!userInfo) return res.status(403).json("Token is not valid!");

    const q =
      "INSERT INTO posts(`title`, `desc`, `img`, `cat`, `date`, `uid`, `meta_title`, `meta_keywords`, `meta_desc`, `blog_by`, `blog_date`, `blog_image_title`) VALUES (?)";

    const values = [
      req.body.title,
      req.body.desc,
      req.body.img,
      req.body.cat,
      req.body.date,
      userInfo.id,
      req.body.meta_title,
      req.body.meta_keywords,
      req.body.meta_desc,
      req.body.blog_by,
      req.body.blog_date,
      req.body.blog_image_title
    ];

    db.query(q, [values], (err, data) => {
     
      if (err) return res.status(500).json(err);
      return res.json("Post has been created.");
    });
  } catch (error) {
    return res.status(400).json(error.message);
  }
};


export const deletePost = (req, res) => {
  const token = req.cookies.access_token;
  if (!token) return res.status(401).json("Not authenticated!");

  jwt.verify(token, "jwtkey", (err, userInfo) => {
    if (err) return res.status(403).json("Token is not valid!");

    const postId = req.params.id;
    const q = "DELETE FROM posts WHERE `id` = ? AND `uid` = ?";

    db.query(q, [postId, userInfo.id], (err, data) => {
      if (err) return res.status(403).json("You can delete only your post!");

      return res.json("Post has been deleted!");
    });
  });
};
export const updatePost = (req, res) => {
  try {
    const token = req.cookies.access_token;
    if (!token) return res.status(401).json("Not authenticated!");

    jwt.verify(token, "jwtkey", (err, userInfo) => {
      if (err) return res.status(403).json("Token is not valid!");

      const postId = req.params.id;
      const {
        title,
        desc,
        img,
        cat,
        meta_title,
        meta_keywords,
        meta_desc,
        blog_by,
        blog_date,
        blog_image_title,
        active
      } = req.body;

      let q;
      let values;

      if (active === false) {
        q = "UPDATE posts SET active = ? WHERE id = ? AND uid = ?";
        values = [false, postId, userInfo.id];
      } else if (active === true) {
        q = "UPDATE posts SET active = ? WHERE id = ? AND uid = ?";
        values = [true, postId, userInfo.id];
      } else {
        q = "UPDATE posts SET `title`=?, `desc`=?, `img`=?, `cat`=?, `meta_title`=?, `meta_keywords`=?, `meta_desc`=?, `blog_by`=?, `blog_date`=?, `blog_image_title`=?, `active`=? WHERE `id` = ? AND `uid` = ?";
        values = [
          title,
          desc,
          img,
          cat,
          meta_title,
          meta_keywords,
          meta_desc,
          blog_by,
          blog_date,
          blog_image_title,
          true, // default to true if active is not explicitly set to true or false
          postId,
          userInfo.id
        ];
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
