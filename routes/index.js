var express = require("express");
var router = express.Router();
const axios = require("axios");

/* GET login page. */
router.get("/", function (req, res) {
  res.render("index", {
    title: "Dafa Farm | Login",
  });
});

/* POST login form */
router.post("/admin/signin", async function (req, res) {
  try {
    // Send login credentials to backend API
    const apiRes = await axios.post(
      "http://localhost:3001/api/auth/login",
      {
        username: req.body.username,
        password: req.body.password,
      },
      {
        // Allow cookies to be included in the response
        withCredentials: true,
      }
    );

    // If login is successful, forward the cookie to the browser
    const setCookie = apiRes.headers["set-cookie"];
    if (setCookie) {
      // Forward the cookie(s) to the client
      res.setHeader("Set-Cookie", setCookie);
    }

    // Redirect to dashboard
    res.redirect("/admin/dashboard");
  } catch (error) {
    // If login fails, redirect back to login page
    res.redirect("/error");
  }
});

router.get("/admin/logout", async function (req, res) {
  try {
    // Call the backend API to clear the session
    await axios.get("http://localhost:3001/api/auth/logout", {
      withCredentials: true,
      headers: {
        Cookie: req.headers.cookie, // Forward the cookie to the backend API
      },
    });

    // Clear the cookie in the browser
    res.clearCookie("authToken"); // Use your actual cookie name

    // Redirect to login page
    res.redirect("/admin/signin");
  } catch (error) {
    // On error, still redirect to login
    res.clearCookie("authToken");
    res.redirect("/admin/signin");
  }
});

module.exports = router;