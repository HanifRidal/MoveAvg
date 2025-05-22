const axios = require("axios");

module.exports = {
  viewDashboard: function (req, res) {
    res.render("admin/dashboard/view_dashboard", {
      title: "Dashboard",
      //   user: req.user,
      //   message: req.flash("message"),
    });
  },
  viewTelur: async function (req, res) {
  try {
    // Get telur data from API
    const response = await axios.get('http://localhost:3001/api/produksi/telur');

    // Extract the array from the response
    let telurArray;
    
    if (Array.isArray(response.data)) {
      // If response.data is already an array
      telurArray = response.data;
    } else if (typeof response.data === 'object') {
      // If response.data is an object, look for common array properties
      // Log all keys to help find where the array might be
      console.log('Response keys:', Object.keys(response.data));
      
      // Check common array properties
      telurArray = response.data.data || 
                   response.data.telur || 
                   response.data.results || 
                   response.data.items || 
                   response.data.records;
                   
      // If still not found, check if any property is an array
      if (!telurArray) {
        for (const key in response.data) {
          if (Array.isArray(response.data[key])) {
            telurArray = response.data[key];
            console.log('Found array in property:', key);
            break;
          }
        }
      }
    }
    
    // Default to empty array if nothing found
    telurArray = telurArray || [];
 
    res.render("admin/telur/view_telur", {
      title: "Telur",
      telur: telurArray,
    });
  } catch (error) {
    console.error('Error fetching telur data:', error);
    res.render("admin/telur/view_telur", {
      title: "Telur",
      error: "Failed to load data",
    });
  }
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
  viewMoveAvg: function (req, res) {
    res.render("admin/moveavg/view_moveavg", {
      title: "Moving Average",
      //   user: req.user,
      //   message: req.flash("message"),
    });
  },
};
