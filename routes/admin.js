const router = require("express").Router();
const adminController = require("../controllers/adminController");

router.get("/signin", adminController.viewSignIn);
//#region Dashboard Function
router.get("/dashboard", adminController.viewDashboard);
//#endregion Dashboard Function

//#region Telur Function
router.get("/telur", adminController.viewTelur);
router.get("/telur/:id", adminController.getTelurById);
router.post("/telur/update/:id", adminController.updateTelur);
router.post("/telur", adminController.addTelur);
//#region Telur Function

//#region Pakan Function
router.get("/pakan", adminController.viewPakan);
router.post("/pakan", adminController.addPakan);
router.get("/pakan/:id", adminController.getPakanById);
router.post("/pakan/update/:id", adminController.updatePakan);
//#endregion Pakan Function

//#region Pakan&MoveAvg Function
router.get("/pendapatan", adminController.viewPendapatan);
router.get("/moveavg", adminController.viewMoveAvg);
router.get("/forecasts", adminController.getForecasts);

//#endregion Pakan&MoveAvg Function

//#region Pakan&MoveAvg Function
router.get("/user", adminController.viewUser);
router.post('/user/change_password', adminController.changePassword);
// router.get("/moveavg", adminController.viewMoveAvg);
// router.get("/forecasts", adminController.getForecasts);

//#endregion Pakan&MoveAvg Function
module.exports = router;
