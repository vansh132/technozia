const express = require("express");
const User = require("../models/user");

const userRouter = express();

userRouter.post("/update/user", async (req, res) => {
  const { _id, fullName, phoneNo, email } = req.body;
  const user = await User.findById({ _id });
  const update = {
    $set: { fullName: fullName, phoneNo: phoneNo, email: email },
  };
  const updatedUser = await User.updateOne(user, update);
  res.json({ updatedUser });
});

module.exports = userRouter;
