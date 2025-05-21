const router = require("express").Router();
const adminController = require("../controllers/adminController");

router.get("/dashboard", adminController.viewDashboard);
router.get("/telur", adminController.viewTelur);
router.post("/telur", adminController.addTelur);
router.get("/pakan", adminController.viewPakan);
router.post("/pakan", adminController.addPakan);
router.get("/pendapatan", adminController.viewPendapatan);

module.exports = router;
