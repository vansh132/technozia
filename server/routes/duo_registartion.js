const express = require("express");
const duoRegistration = require("../models/duo_registrations");
const DuoRegistration = require("../models/duo_registrations");
const generatePdf = require("../generatePdf");

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

duoRegistrationRouter.get("/api/all/registrations/pdf", async (req, res) => {
  try {
    // const duoRegistrations = await duoRegistration
    //   .findById("649027af5412c48d97a98ed6")
    //   .select("-__v");
    // console.log(duoRegistrations);
    // console.log(duoRegistration.toObject());
    // const file = generatePdf(duoRegistrations);

    const obj = {
      leader: "6454ef824f2b1d4f198d3d7b",
      participantOne: "monali",
      participantTwo: "ritika",
      participantThree: "vansh shah",
      participantFour: "aqsa",
      participantFive: "paras",
      phoneNo: 7777711111,
      email: "hh@gmail.comsjsj",
      eventName: "Treasure Hunt",
      amount: 500,
      paymentMode: "PaymentMode.online",
      paymentId: "jsjsjdjdjssj",
      date: "2023-06-19 15:32:22.963002",
    };

    const file = generatePdf(obj);
    res.json(file);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = duoRegistrationRouter;
