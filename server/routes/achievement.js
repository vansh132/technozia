const express = require("express");
const admin = require("../middlewares/admin");
const Achievement = require("../models/achievement");

const achievementRouter = express.Router();

achievementRouter.post("/admin/add-achievement", async (req, res) => {
  try {
    const { title, category, description, noOfParticipant, tag, images } =
      req.body;
    let achievement = new Achievement({
      title,
      category,
      description,
      noOfParticipant,
      tag,
      images,
    });
    achievement = await achievement.save();
    res.json(achievement);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = achievementRouter;
