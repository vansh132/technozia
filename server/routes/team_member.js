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

teamMemberRouter.get("/api/teamMembers", async (req, res) => {
  try {
    const leader = req.header("leader");

    const teamMembers = await TeamMember.find({ leader });
    res.json(teamMembers);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

teamMemberRouter.post("/update/team-member", async (req, res) => {
  try {
    const teamMember = await TeamMember.findById(req.body._id);

    if (!teamMember) {
      res.status(400).json({
        success: false,
        message: "Team member not found",
      });
    }

    const updatedTeamMember = await TeamMember.findByIdAndUpdate(
      req.body._id,
      req.body,
      {
        new: true,
        runValidators: true,
      }
    );

    res.json({ updatedTeamMember });
  } catch (error) {
    console.log(error);
  }
});

teamMemberRouter.post("/delete-team-member", async (req, res) => {
  try {
    const { id } = req.body;
    let teamMember = await TeamMember.findByIdAndDelete(id);
    res.json(teamMember);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = teamMemberRouter;
