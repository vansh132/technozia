const mongoose = require("mongoose");

const achievementSchema = mongoose.Schema({
  title: {
    required: true,
    type: String,
    trim: true,
  },
  category: {
    required: true,
    type: String,
    trim: true,
  },
  description: {
    required: true,
    type: String,
  },
  noOfParticipant: {
    required: true,
    type: Number,
  },
  tag: {
    required: true,

    type: String,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  //cart
});

const Achievement = mongoose.model("Achievement", achievementSchema);
module.exports = Achievement;
