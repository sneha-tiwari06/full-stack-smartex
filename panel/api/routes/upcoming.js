import express from "express";
import {
  addUpcoming,
  deleteUpcoming,
  getUpcoming,
  getUpcomings,
  updateUpcoming,
} from "../controllers/upcoming.js";

const router = express.Router();

router.get("/", getUpcomings);
router.get("/:id", getUpcoming);
router.post("/", addUpcoming);
router.delete("/:id", deleteUpcoming);
router.put("/:id", updateUpcoming);

export default router;
