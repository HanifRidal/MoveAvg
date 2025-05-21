module.exports = {
  viewDashboard: function (req, res) {
    res.render("admin/dashboard/view_dashboard", {
      title: "Dashboard",
      //   user: req.user,
      //   message: req.flash("message"),
    });
  },
  viewTelur: function (req, res) {
    res.render("admin/telur/view_telur", {
      title: "Telur",
      //   user: req.user,
      //   message: req.flash("message"),
    });
  },
  addTelur: (req, res) => {
    const { jumlah, tanggal } = req.body;
    console.log(jumlah, tanggal);
    res.redirect("/admin/telur");
  },
  viewPakan: function (req, res) {
    res.render("admin/pakan/view_pakan", {
      title: "pakan",
      //   user: req.user,
      //   message: req.flash("message"),
    });
  },
  addPakan: (req, res) => {
    const { jumlah, harga, tanggal } = req.body;
    console.log(jumlah, harga, tanggal);
    res.redirect("/admin/pakan");
  },
  viewPendapatan: function (req, res) {
    res.render("admin/pendapatan/view_pendapatan", {
      title: "Pendapatan",
      //   user: req.user,
      //   message: req.flash("message"),
    });
  },
};
