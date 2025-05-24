const axios = require("axios");

module.exports = {
  //#region Dashboard Function
  viewDashboard: function (req, res) {
    res.render("admin/dashboard/view_dashboard", {
      title: "Dashboard",
      //   user: req.user,
      //   message: req.flash("message"),
    });
  },
  //#endregion Dashboard Function

  //#region Telur Fucntion
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
  addTelur: async (req, res) => {
    try {
      const { jumlah, tanggal } = req.body;

      // Log the received data
      console.log("Received form data:", { jumlah, tanggal });

      // Prepare the data in the required format
      const telurData = {
        "Tanggal": tanggal,
        "Telur_kg": jumlah
      };

      // Send POST request to API
      const response = await axios.post('http://localhost:3001/api/produksi/telur/add', telurData);

      console.log("API response:", response.data);

      // Redirect back to telur page
      // Set success message (if using flash messages)
      req.flash('success', 'Telur data added successfully');
      res.redirect("/admin/telur");
    } catch (error) {
      console.error("Error adding telur data:", error.message);
      // You could add flash messages here if you have that middleware set up
      
      res.status(500).redirect("/admin/telur");
    }
  },
  // Get telur data by ID for edit form
  getTelurById: async (req, res) => {
    try {
      const id = req.params.id;
      const response = await axios.get(`http://localhost:3001/api/produksi/telur/find/${id}`);
      
      res.json(response.data);
    } catch (error) {
      console.error("Error fetching telur data:", error.message);
      res.status(500).json({ error: "Failed to fetch telur data" });
    }
  },
  
  // Update telur data
  updateTelur: async (req, res) => {
    try {
      const id = req.params.id;
      const { jumlah, tanggal } = req.body;
      
      // Log the received data
      console.log("Updating telur data:", { id, jumlah, tanggal });
      
      // Prepare the data in the required format
      const telurData = {
        "Tanggal": tanggal,
        "Telur_kg": jumlah
      };
      
      // Send PUT request to API
      const response = await axios.put(`http://localhost:3001/api/produksi/telur/edit/${id}`, telurData);
      
      console.log("API response:", response.data);
      
      // Redirect back to telur page
      // Set success message (if using flash messages)
      req.flash('success', 'Telur data updated successfully');
      res.redirect("/admin/telur");
    } catch (error) {
      console.error("Error updating telur data:", error.message);
      res.status(500).redirect("/admin/telur");
    }
  },
  //#endregion Telur Function
  
  //#region Pakan Function

  viewPakan: async function (req, res) {
   try {
      // Get telur data from API
      const response = await axios.get('http://localhost:3001/api/pakan');

      // Extract the array from the response
      let pakanArray;

      if (Array.isArray(response.data)) {
        // If response.data is already an array
        pakanArray = response.data;
      } else if (typeof response.data === 'object') {
        // If response.data is an object, look for common array properties
        // Log all keys to help find where the array might be
        console.log('Response keys:', Object.keys(response.data));

        // Check common array properties
        pakanArray = response.data.data ||
          response.data.pakan ||
          response.data.results ||
          response.data.items ||
          response.data.records;

        // If still not found, check if any property is an array
        if (!pakanArray) {
          for (const key in response.data) {
            if (Array.isArray(response.data[key])) {
              pakanArray = response.data[key];
              console.log('Found array in property:', key);
              break;
            }
          }
        }
      }

      // Default to empty array if nothing found
      pakanArray = pakanArray || [];

      res.render("admin/pakan/view_pakan", {
        title: "pakan",
        pakan: pakanArray,
      });
    } catch (error) {
      console.error('Error fetching pakan data:', error);
      res.render("admin/pakan/view_pakan", {
        title: "pakan",
        error: "Failed to load data",
      });
    }
  },
  addPakan: async(req, res) => {
    try {
      const { jumlah, tanggal } = req.body;

      // Log the received data
      console.log("Received form data:", { jumlah, tanggal });

      // Prepare the data in the required format
      const pakanData = {
        "Tanggal": tanggal,
        "Pakan_kg": jumlah
      };

      // Send POST request to API
      const response = await axios.post('http://localhost:3001/api/pakan/add', pakanData);

      console.log("API response:", response.data);

      // Redirect back to pakan page
      // Set success message (if using flash messages)
      req.flash('success', 'pakan data added successfully');
      res.redirect("/admin/pakan");
    } catch (error) {
      console.error("Error adding pakan data:", error.message);
      // You could add flash messages here if you have that middleware set up
      
      res.status(500).redirect("/admin/pakan");
    }
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
  //#endregion Pakan Function
};
