const mongoose = require("mongoose");

const teamMembersSchema = mongoose.Schema({
  leader: {
    required: true,
    type: Object,
  },
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
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
});

const TeamMember = mongoose.model("team_members", teamMembersSchema);
module.exports = TeamMember;
