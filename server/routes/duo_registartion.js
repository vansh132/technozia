const express = require("express");
const duoRegistration = require("../models/duo_registrations");
const DuoRegistration = require("../models/duo_registrations");

const duoRegistrationRouter = express.Router();

duoRegistrationRouter.post("/api/register", async (req, res) => {
  try {
    const {
      leader,
      participantOne,
      participantTwo,
      participantThree,
      participantFour,
      participantFive,
      phoneNo,
      email,
      eventName,
      amount,
      paymentMode,
      paymentId,
      date,
    } = req.body;
    let duoRegistration = new DuoRegistration({
      leader,
      participantOne,
      participantTwo,
      participantThree,
      participantFour,
      participantFive,
      phoneNo,
      email,
      eventName,
      amount,
      paymentMode,
      paymentId,
      date,
    });
    duoRegistration = await duoRegistration.save();
    res.json(duoRegistration);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

duoRegistrationRouter.get("/api/registrations", async (req, res) => {
  try {
    const leader = req.header("leader");

    const duoRegistrations = await duoRegistration.find({ leader });
    res.json(duoRegistrations);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

duoRegistrationRouter.get("/api/all/registrations", async (req, res) => {
  try {
    const duoRegistrations = await duoRegistration.find();
    res.json(duoRegistrations);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = duoRegistrationRouter;
