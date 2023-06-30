const mongoose = require("mongoose");

const volunteerSchema = mongoose.Schema({
  addedBy: {
    required: true,
    type: String,
  },
  modifiedBy: {
    required: false,
    type: String,
  },
  name: {
    required: true,
    type: String,
  },

  phoneNo: {
    required: true,
    type: Number,
  },
  event: {
    required: true,
    type: String,
  },
});

const Volunteer = mongoose.model("volunteer", volunteerSchema);
module.exports = Volunteer;
