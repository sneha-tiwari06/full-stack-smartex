import express from "express";
import {
  addPartner,
  deletePartner,
  getPartner,
  getPartners,
  updatePartner,
  // activatePartner,
  // deactivatePartner
} from "../controllers/partners.js";

const router = express.Router();

router.get("/", getPartners);
router.get("/:id", getPartner);
router.post("/", addPartner);
router.delete("/:id", deletePartner);
router.put("/:id", updatePartner);
// router.put("/:id", activatePartner);
// router.put("/:id", deactivatePartner);

export default router;
