const express = require("express");
const Volunteer = require("../models/volunteer");

const volunteerRouter = express.Router();

volunteerRouter.post("/api/add-volunteer", async (req, res) => {
  try {
    const { addedBy, name, phoneNo, event } = req.body;
    console.log(name);
    let volunteer = new Volunteer({
      addedBy,
      name,
      phoneNo,
      event,
    });
    volunteer = await volunteer.save();
    res.json(volunteer);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

volunteerRouter.get("/api/volunteers", async (req, res) => {
  try {
    const volunteers = await Volunteer.find();
    res.json(volunteers);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

volunteerRouter.post("/update/volunteer", async (req, res) => {
  try {
    const volunteer = await Volunteer.findById(req.body._id);

    if (!volunteer) {
      res.status(400).json({
        success: false,
        message: "Volunteer not found",
      });
    }

    const updatedVolunteer = await Volunteer.findByIdAndUpdate(
      req.body._id,
      req.body,
      {
        new: true,
        runValidators: true,
      }
    );

    res.json({ updatedVolunteer });
  } catch (error) {
    console.log(error);
  }
});

volunteerRouter.post("/delete-volunteer", async (req, res) => {
  try {
    const { id } = req.body;
    let volunteer = await Volunteer.findByIdAndDelete(id);
    res.json(volunteer);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = volunteerRouter;
