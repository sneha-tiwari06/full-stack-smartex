import express from "express";
import {
  addCeremony,
  deleteCeremony,
  getCeremony,
  getCeremonys,
  updateCeremony,
} from "../controllers/ceremony.js";

const router = express.Router();

router.get("/", getCeremonys);
router.get("/:id", getCeremony);
router.post("/", addCeremony);
router.delete("/:id", deleteCeremony);
router.put("/:id", updateCeremony);

export default router;
