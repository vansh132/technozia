const express = require("express");
const Post = require("../models/post");

const postRoute = express.Router();

postRoute.post("/admin/add-post", async (req, res) => {
  try {
    const { username, type , title, description, date } = req.body;
    let post = new Post({
      username,
      type,
      title,
      description,
      date,
    });
    post = await post.save();
    res.json(post);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

postRoute.get("/api/post", async (req, res) => {
  try {
    const post = await Post.find({});
    res.json(post);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = postRoute;
