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
    // const { id, leader, fullName, phoneNo, email } = req.body;
    // console.log(id);
    // const teamMember = await TeamMember.findOne({
    //   _id: id,
    //   leader: leader,
    // });
    // const update = {
    //   $set: { fullName: fullName, phoneNo: phoneNo, email: email },
    // };
    // const updatedTeamMember = await TeamMember.updateOne(teamMember, update);
    // if (_id.match(/^[0-9a-fA-F]{24}$/)) {
    // }
    // const updatedTeamMember = await TeamMember.findByIdAndUpdate(
    //   _id,
    //   update,
    //   {
    //     new: true,
    //     runValidators: true,
    //   }
    // );

    // console.log(updatedTeamMember);

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

module.exports = teamMemberRouter;
