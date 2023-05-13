const express = require("express");
const TeamMember = require("../models/team_members");

const teamMemberRouter = express.Router();

teamMemberRouter.post("/api/add-teamMember", async (req, res) => {
  try {
    const { leader, fullName, college, phoneNo, email } = req.body;
    console.log(fullName);
    let teamMember = new TeamMember({
      leader,
      fullName,
      college,
      phoneNo,
      email,
    });
    teamMember = await teamMember.save();
    res.json(teamMember);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = teamMemberRouter;
