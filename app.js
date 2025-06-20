var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
const dateHelper = require("./helper/FormatDate");
var indexRouter = require("./routes/index");
var usersRouter = require("./routes/users");
//router for admin
const adminRouter = require("./routes/admin");

var app = express();

app.locals.dateHelper = dateHelper.formatDate;  // Keep this as dateHelper since you're using it in templates
app.locals.dateHelperForInput = dateHelper.formatDateForInput;
app.locals.formatDateLong = dateHelper.formatDateLong; // Add this new format
app.locals.formatDateIndonesian = dateHelper.formatDateIndonesian; // Add this for Indonesian format
// view engine setup
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
// app.use(express.static(path.join(__dirname, "public")));
app.get('/', (req, res) => {
  res.redirect('/admin/signin');
});
app.use(express.static(path.join(__dirname, "public")));

app.use(
  "/sb-admin",
  express.static(path.join(__dirname, "node_modules/startbootstrap-sb-admin-2"))
);

app.use("/auth", indexRouter);

app.use("/users", usersRouter);
// use admin router
app.use("/admin", adminRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});


// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
