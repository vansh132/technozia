const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  fullName: {
    required: true,
    type: String,
    trim: true,
  },
  college: {
    required: true,
    type: String,
    trim: true,
  },
  phoneNo: {
    required: true,
    type: Number,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match();
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    required: true,
    type: String,
  },
  type: {
    type: String,
    default: "participant",
  },
  //cart
});

const User = mongoose.model("User", userSchema);
module.exports = User;
