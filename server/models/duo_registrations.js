const mongoose = require("mongoose");

const duoRegistrationSchema = mongoose.Schema({
  leader: {
    required: true,
    type: String,
    trim: true,
  },
  participantOne: {
    required: true,
    type: String,
    trim: true,
  },
  participantTwo: {
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
  eventName: {
    required: true,
    type: String,
    trim: true,
  },
  amount: {
    required: true,
    type: Number,
    trim: true,
  },
  paymentMode: {
    required: true,
    type: String,
    trim: true,
  },
  paymentId: {
    required: false,
    type: String,
  },
  date: {
    required: true,
    type: String,
  },
});

const DuoRegistration = mongoose.model(
  "duoRegistration",
  duoRegistrationSchema
);
module.exports = DuoRegistration;
