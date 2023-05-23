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
  const { _id, leader, fullName, phoneNo, email } = req.body;
  const teamMember = await TeamMember.find({
    _id: _id,
    leader: leader,
  });
  const update = {
    $set: { fullName: fullName, phoneNo: phoneNo, email: email },
  };
  const updatedUser = await User.updateOne(user, update);
  res.json({ updatedUser });
});

module.exports = teamMemberRouter;
