const express = require("express");
const DuoRegistration = require("../models/duo_registrations");
const User = require("../models/user");
const Post = require("../models/post");
const TeamMember = require("../models/team_members");
const Achievement = require("../models/achievement");

const reportsRouter = express.Router();

// reportsRouter.get("/api/event-registration-count", async (req, res) => {
//   const coding = DuoRegistration.find({});
//   res.json(coding);
// }
// );

reportsRouter.get("/api/report/event-registration-count", async (req, res) => {
  const coding = await DuoRegistration.find({ eventName: "Coding Wars" });
  const codingCount = coding.length;
  const ITManager = await DuoRegistration.find({ eventName: "IT Manager" });
  const ITManagerCount = ITManager.length;
  const ITQuiz = await DuoRegistration.find({ eventName: "IT Quiz" });
  const ITQuizCount = ITQuiz.length;
  const Web = await DuoRegistration.find({ eventName: "Web Weavers" });
  const WebCount = Web.length;
  const fastTyping = await DuoRegistration.find({ eventName: "Fast Typing" });
  const fastTypingCount = fastTyping.length;
  const Gaming = await DuoRegistration.find({ eventName: "COD Mobile" });
  const GamingCount = Gaming.length;
  const TreasureHunt = await DuoRegistration.find({
    eventName: "Treasure Hunt",
  });
  const TreasureHuntCount = TreasureHunt.length;
  const events = await DuoRegistration.find({});
  const eventsCount = events.length;

  res.json([
    codingCount,
    WebCount,
    ITManagerCount,
    fastTypingCount,
    ITQuizCount,
    GamingCount,
    TreasureHuntCount,
    eventsCount,
  ]);
});

reportsRouter.get("/api/report/payment-count", async (req, res) => {
  const online = await DuoRegistration.find({
    paymentMode: "PaymentMode.online",
  });
  const offline = await DuoRegistration.find({
    paymentMode: "PaymentMode.offline",
  });
  const onlineCount = online.length;
  const offlineCount = offline.length;

  res.json([onlineCount, offlineCount]);
});

reportsRouter.get("/api/report/user-count", async (req, res) => {
  const users = await User.find({});
  const userCount = users.length;
  const achievement = await Achievement.find({});
  const achievementCount = achievement.length;
  const posts = await Post.find({});
  const postCount = posts.length;
  res.json([userCount, postCount, achievementCount]);
});

module.exports = reportsRouter;
