import express from "express";
import {
  addEvent,
  deleteEvent,
  getEvent,
  getEvents,
  updateEvent,
} from "../controllers/events.js";

const router = express.Router();

router.get("/", getEvents);
router.get("/:id", getEvent);
router.post("/", addEvent);
router.delete("/:id", deleteEvent);
router.put("/:id", updateEvent);

export default router;
