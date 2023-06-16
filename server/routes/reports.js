const express = require("express");
const DuoRegistration = require("../models/duo_registrations");

const reportsRouter = express.Router();

reportsRouter.get("/api/event-registration-count", async (req, res) => {
  const coding = await DuoRegistration.find();
  res.json(coding);
});

module.exports = reportsRouter;
