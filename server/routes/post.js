const express = require("express");
const Post = require("../models/post");

const postRoute = express.Router();

postRoute.post("/admin/add-post", async (req, res) => {
  try {
    const { username, type, title, description, date } = req.body;
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

postRoute.post("/delete-post", async (req, res) => {
  try {
    const { id } = req.body;
    let post = await Post.findByIdAndDelete(id);

    res.json(post);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

postRoute.post("/update/post", async (req, res) => {
  try {
    const post = await Post.findById(req.body._id);

    if (!post) {
      res.status(400).json({
        success: false,
        message: "Post not found",
      });
    }

    const updatedPost = await Post.findByIdAndUpdate(req.body._id, req.body, {
      new: true,
      runValidators: true,
    });

    res.json({ updatedPost });
  } catch (error) {
    console.log(error);
  }
});

module.exports = postRoute;
