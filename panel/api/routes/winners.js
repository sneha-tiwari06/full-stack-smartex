import express from "express";
import {
  addWinners,
  deleteWinners,
  getWinner,
  getWinners,
  updateWinners,
} from "../controllers/winners.js";

const router = express.Router();

router.get("/", getWinners);
router.get("/:id", getWinner);
router.post("/", addWinners);
router.delete("/:id", deleteWinners);
router.put("/:id", updateWinners);

export default router;
