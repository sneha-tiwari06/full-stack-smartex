import express from "express";
import {
  addSpeaker,
  deleteSpeaker,
  getSpeaker,
  getSpeakers,
  updateSpeaker,
} from "../controllers/star.js";

const router = express.Router();

router.get("/", getSpeakers);
router.get("/:id", getSpeaker);
router.post("/", addSpeaker);
router.delete("/:id", deleteSpeaker);
router.put("/:id", updateSpeaker);

export default router;
