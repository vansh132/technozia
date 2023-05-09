const mongoose = require("mongoose");

const postSchema = mongoose.Schema({
  userId: {
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

const Achievement = mongoose.model("post", postSchema);
module.exports = Achievement;
