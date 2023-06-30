const express = require("express");
const authRouter = require("./routes/auth");
const mongoose = require("mongoose");
const achievementRouter = require("./routes/achievement");
const postRoute = require("./routes/post");
const teamMemberRouter = require("./routes/team_member");
const duoRegistrationRouter = require("./routes/duo_registartion");
const userRouter = require("./routes/user");
const reportsRouter = require("./routes/reports");
const volunteerRouter = require("./routes/volunteer");
const app = express();

const PORT = 3000;
const DB = "mongodb://0.0.0.0:27017";

app.use(express.json());
app.use(express.static("public"));
app.use(authRouter);
app.use(achievementRouter);
app.use(postRoute);
app.use(teamMemberRouter);
app.use(duoRegistrationRouter);
app.use(userRouter);
app.use(reportsRouter);
app.use(volunteerRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful...");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log("Connected at port " + PORT);
});
