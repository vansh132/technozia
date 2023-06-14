const mongoose = require("mongoose");

const postSchema = mongoose.Schema({
  username: {
    required: true,
    type: String,
    trim: true,
  },
  type: {
    required: true,
    type: String,
    trim: true,
  },
  title: {
    required: true,
    type: String,
    trim: true,
  },
  description: {
    required: true,
    type: String,
  },
  date: {
    required: true,
    type: Date,
  },
});

const Post = mongoose.model("post", postSchema);
module.exports = Post;
