const express = require("express");
const authRouter = require("./routes/auth");
const mongoose = require("mongoose");
const app = express();

const PORT = 3000;
const DB = "mongodb+srv://vansh:vansh@club.pedomyy.mongodb.net/test";

app.use(express.json());
app.use(authRouter);

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
