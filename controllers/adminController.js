const axios = require("axios");
const { ensureAuthenticated } = require("../middleware/TokenServices");

module.exports = {
  viewSignIn: function (req, res) {
    try {
      res.render("index", {
        title: "Dafa Farm | Login",
      });
      res.redirect("admin/dashboard");
    } catch (error) {
      res.redirect("admin/signin");
    }
  },
  // Add this to the module.exports object
  viewUser: async function (req, res) {
    try {
      // Mock user data for development - REPLACE THIS WITH YOUR ACTUAL API CALL
      // const userData = {
      //   fullname: "User Example",
      //   username: "user_example",
      //   email: "user@example.com"
      // };
      let userData;
      const userAuthToken = req.cookies.authToken;
      const response = await axios.get(
        "http://localhost:3001/api/auth/profile",
        {
          headers: { Cookie: `authToken=${userAuthToken}` },
          withCredentials: true,
        }
      );
      userData = response.data.data; // This is where your user object is located

      // Render the view and pass the user data
      res.render("admin/user/view_user", {
        title: "Dafa Farm | User Profile",
        user: userData, // THIS IS CRITICAL - pass user data to the view
        error: null,
      });
    } catch (error) {
      console.error("Error in viewUser:", error);

      res.render("admin/user/view_user", {
        title: "Dafa Farm | User Profile",
        user: null, // Still send user as null when there's an error
        error: "Error fetching profile data: " + error.message,
      });
    }
  },

  changePassword: async function (req, res) {
    try {
      const { currentPassword, newPassword } = req.body;

      // Basic validation
      if (!currentPassword || !newPassword) {
        return res.status(400).json({
          success: false,
          message: "Current password and new password are required",
        });
      }

      if (newPassword.length < 8) {
        return res.status(400).json({
          success: false,
          message: "New password must be at least 8 characters long",
        });
      }

      const userAuthToken = req.cookies.authToken;
      const axiosConfig = {
        headers: {
          "Content-Type": "application/json",
        },
      };

      if (userAuthToken) {
        axiosConfig.headers.Cookie = `authToken=${userAuthToken}`;
      }

      // Call the backend API to change password
      const response = await axios.put(
        "http://localhost:3001/api/auth/change_password",
        { currentPassword, newPassword },
        axiosConfig
      );
      return res.json({
        success: true,
        message: "Password updated successfully",
      });
    } catch (error) {
      console.error(
        "Error changing password:",
        error.response?.data || error.message
      );

      // Handle specific error cases
      if (error.response?.status === 401) {
        return res.status(401).json({
          success: false,
          message: "Current password is incorrect",
        });
      } else if (error.response?.status === 400) {
        return res.status(400).json({
          success: false,
          message: error.response?.data?.message || "Invalid password format",
        });
      }

      // General error case
      return res.status(error.response?.status || 500).json({
        success: false,
        message: error.response?.data?.message || "Failed to update password",
      });
    }
  },
  //#region Dashboard Function
  viewDashboard: function (req, res) {
    res.render("admin/dashboard/view_dashboard", {
      title: "Dafa Farm | Dashboard",
      //   user: req.user,
      //   message: req.flash("message"),
    });
  },
  //#endregion Dashboard Function

  //#region Telur Fucntion
  viewTelur: async function (req, res) {
    try {
      const userAuthToken = req.cookies.authToken;
      const axiosConfig = {};

      if (userAuthToken) {
        axiosConfig.headers = {
          Cookie: `authToken=${userAuthToken}`, // Meneruskan cookie ke backend API
        };
      }

      // Get telur data from API
      const response = await axios.get(
        "http://localhost:3001/api/produksi/telur",
        axiosConfig
      );

      // Extract the array from the response
      let telurArray;

      if (Array.isArray(response.data)) {
        // If response.data is already an array
        telurArray = response.data;
      } else if (typeof response.data === "object") {
        // If response.data is an object, look for common array properties
        // Log all keys to help find where the array might be
        console.log("Response keys:", Object.keys(response.data));

        // Check common array properties
        telurArray =
          response.data.data ||
          response.data.telur ||
          response.data.results ||
          response.data.items ||
          response.data.records;

        // If still not found, check if any property is an array
        if (!telurArray) {
          for (const key in response.data) {
            if (Array.isArray(response.data[key])) {
              telurArray = response.data[key];
              console.log("Found array in property:", key);
              break;
            }
          }
        }
      }

      // Default to empty array if nothing found
      telurArray = telurArray || [];

      res.render("admin/telur/view_telur", {
        title: "Dafa Farm | Telur",
        telur: telurArray,
      });
    } catch (error) {
      console.error("Error fetching telur data:", error);
      res.render("admin/telur/view_telur", {
        title: "Dafa Farm | Telur",
        error: "Failed to load data",
      });
    }
  },

  viewTelurByWeek: async function (req, res) {
  try {
    const userAuthToken = req.cookies.authToken;
    const axiosConfig = {};
    if (userAuthToken) {
      axiosConfig.headers = {
        Cookie: `authToken=${userAuthToken}`
      };
      axiosConfig.withCredentials = true;
    }

    console.log("Fetching weekly telur data...");
    
    // Fixed URL - the endpoint is "Week" not "weekly"
    const response = await axios.get(
      "http://localhost:3001/api/Produksi/telur/Week", 
      axiosConfig
    );
    
    console.log("Weekly telur response received:", response.status);
    
    // The data is in response.data.data according to your backend structure
    const telurWeeklyArray = response.data.data || [];
    
    console.log(`Found ${telurWeeklyArray.length} weekly records`);
    
    // Send the weekly data back as JSON
    res.json({
      telurWeekly: telurWeeklyArray
    });
    
  } catch (error) {
    console.error("Error fetching weekly telur data:", error.response?.data || error.message);
    res.status(500).json({
      error: "Failed to load weekly data: " + (error.response?.data?.message || error.message)
    });
  }
},

// Add this function to your adminController.js file
viewTelurByMonth: async function (req, res) {
  try {
    const userAuthToken = req.cookies.authToken;
    const axiosConfig = {};
    if (userAuthToken) {
      axiosConfig.headers = {
        Cookie: `authToken=${userAuthToken}`
      };
      axiosConfig.withCredentials = true;
    }

    console.log("Fetching monthly telur data...");
    
    const response = await axios.get(
      "http://localhost:3001/api/Produksi/telur/bulan", 
      axiosConfig
    );
    
    console.log("Monthly telur response received:", response.status);
    
    // The data is in response.data.data according to your backend structure
    const telurMonthlyArray = response.data.data || [];
    
    console.log(`Found ${telurMonthlyArray.length} monthly records`);
    
    // Send the monthly data back as JSON
    res.json({
      telurMonthly: telurMonthlyArray
    });
    
  } catch (error) {
    console.error("Error fetching monthly telur data:", error.response?.data || error.message);
    res.status(500).json({
      error: "Failed to load monthly data: " + (error.response?.data?.message || error.message)
    });
  }
},


// Add this function to your adminController.js file
viewTelurByQuarter: async function (req, res) {
  try {
    const userAuthToken = req.cookies.authToken;
    const axiosConfig = {};
    if (userAuthToken) {
      axiosConfig.headers = {
        Cookie: `authToken=${userAuthToken}`
      };
      axiosConfig.withCredentials = true;
    }

    console.log("Fetching quarterly telur data...");
    
    const response = await axios.get(
      "http://localhost:3001/api/Produksi/telur/quarter", 
      axiosConfig
    );
    
    console.log("Quarterly telur response received:", response.status);
    
    // The data is in response.data.data according to your backend structure
    const telurQuarterlyArray = response.data.data || [];
    
    console.log(`Found ${telurQuarterlyArray.length} quarterly records`);
    
    // Send the quarterly data back as JSON
    res.json({
      telurQuarterly: telurQuarterlyArray
    });
    
  } catch (error) {
    console.error("Error fetching quarterly telur data:", error.response?.data || error.message);
    res.status(500).json({
      error: "Failed to load quarterly data: " + (error.response?.data?.message || error.message)
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
        Tanggal: tanggal,
        Telur_kg: jumlah,
      };

      // Send POST request to API
      const response = await axios.post(
        "http://localhost:3001/api/produksi/telur/add",
        telurData
      );

      console.log("API response:", response.data);

      // Redirect back to telur page
      // Set success message (if using flash messages)
      req.flash("success", "Telur data added successfully");
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
      const response = await axios.get(
        `http://localhost:3001/api/produksi/telur/find/${id}`
      );

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
        Tanggal: tanggal,
        Telur_kg: jumlah,
      };

      // Send PUT request to API
      const response = await axios.put(
        `http://localhost:3001/api/produksi/telur/edit/${id}`,
        telurData
      );

      console.log("API response:", response.data);

      // Redirect back to telur page
      // Set success message (if using flash messages)
      req.flash("success", "Telur data updated successfully");
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
      const userAuthToken = req.cookies.authToken;
      const axiosConfig = {};

      if (userAuthToken) {
        axiosConfig.headers = {
          Cookie: `authToken=${userAuthToken}`, // Meneruskan cookie ke backend API
        };
      }
      // Get telur data from API
      const response = await axios.get(
        "http://localhost:3001/api/pakan",
        axiosConfig
      );

      // Extract the array from the response
      let pakanArray;

      if (Array.isArray(response.data)) {
        // If response.data is already an array
        pakanArray = response.data;
      } else if (typeof response.data === "object") {
        // If response.data is an object, look for common array properties
        // Log all keys to help find where the array might be
        console.log("Response keys:", Object.keys(response.data));

        // Check common array properties
        pakanArray =
          response.data.data ||
          response.data.pakan ||
          response.data.results ||
          response.data.items ||
          response.data.records;

        // If still not found, check if any property is an array
        if (!pakanArray) {
          for (const key in response.data) {
            if (Array.isArray(response.data[key])) {
              pakanArray = response.data[key];
              console.log("Found array in property:", key);
              break;
            }
          }
        }
      }

      // Default to empty array if nothing found
      pakanArray = pakanArray || [];

      res.render("admin/pakan/view_pakan", {
        title: "Dafa Farm | Pakan",
        pakan: pakanArray,
      });
    } catch (error) {
      console.error("Error fetching pakan data:", error);
      res.render("admin/pakan/view_pakan", {
        title: "Dafa Farm | Pakan",
        error: "Failed to load data",
      });
    }
  },
  addPakan: async (req, res) => {
    try {
      const { jumlah, tanggal } = req.body;

      // Log the received data
      console.log("Received form data:", { jumlah, tanggal });

      // Prepare the data in the required format
      const pakanData = {
        Tanggal: tanggal,
        Pakan_kg: jumlah,
      };

      // Send POST request to API
      const response = await axios.post(
        "http://localhost:3001/api/pakan/add",
        pakanData
      );

      console.log("API response:", response.data);

      // Redirect back to pakan page
      // Set success message (if using flash messages)
      req.flash("success", "pakan data added successfully");
      res.redirect("/admin/pakan");
    } catch (error) {
      console.error("Error adding pakan data:", error.message);
      // You could add flash messages here if you have that middleware set up

      res.status(500).redirect("/admin/pakan");
    }
  },

  updatePakan: async (req, res) => {
    try {
      const id = req.params.id;
      const { jumlah, tanggal } = req.body;

      // Log the received data
      console.log("Updating pakan data:", { id, jumlah, tanggal });

      // Prepare the data in the required format
      const pakanData = {
        Tanggal: tanggal,
        Pakan_kg: jumlah,
      };

      // Send PUT request to API
      const response = await axios.put(
        `http://localhost:3001/api/pakan/update/${id}`,
        pakanData
      );

      console.log("API response:", response.data);

      // Redirect back to pakan page
      // Set success message (if using flash messages)
      req.flash("success", "pakan data updated successfully");
      res.redirect("/admin/pakan");
    } catch (error) {
      console.error("Error updating pakan data:", error.message);
      res.status(500).redirect("/admin/pakan");
    }
  },

  getPakanById: async (req, res) => {
    try {
      const id = req.params.id;
      const response = await axios.get(
        `http://localhost:3001/api/produksi/pakan/find/${id}`
      );

      res.json(response.data);
    } catch (error) {
      console.error("Error fetching pakan data:", error.message);
      res.status(500).json({ error: "Failed to fetch pakan data" });
    }
  },

  viewPendapatan: async function (req, res) {
    try {
      // Get telur data from API
      const response = await axios.get("http://localhost:3001/api/pendapatan");

      // Extract the array from the response
      let pendapatanArray;

      if (Array.isArray(response.data)) {
        // If response.data is already an array
        pendapatanArray = response.data;
      } else if (typeof response.data === "object") {
        // If response.data is an object, look for common array properties
        // Log all keys to help find where the array might be
        console.log("Response keys:", Object.keys(response.data));

        // Check common array properties
        pendapatanArray =
          response.data.data ||
          response.data.pendapatan ||
          response.data.results ||
          response.data.items ||
          response.data.records;

        // If still not found, check if any property is an array
        if (!pendapatanArray) {
          for (const key in response.data) {
            if (Array.isArray(response.data[key])) {
              pendapatanArray = response.data[key];
              console.log("Found array in property:", key);
              break;
            }
          }
        }
      }

      // Default to empty array if nothing found
      pendapatanArray = pendapatanArray || [];

      res.render("admin/pendapatan/view_pendapatan", {
        title: "pendapatan",
        pendapatan: pendapatanArray,
      });
    } catch (error) {
      console.error("Error fetching pendapatan data:", error);
      res.render("admin/pendapatan/view_pendapatan", {
        title: "pendapatan",
        error: "Failed to load data",
      });
    }
  },
  //#endregion Pakan Function

  //#region Moving Average Function
  viewMoveAvg: async function (req, res) {
    try {
      res.render("admin/moveavg/view_moveavg", {
        title: "Dafa Farm | Moving Average Forecast",
        window: req.query.window || 2,
        periods: req.query.periods || 1,
      });
    } catch (error) {
      console.error("Error rendering moving average page:", error);
      res.status(500).send("Error loading moving average forecast page");
    }
  },

  // API endpoint to get forecast data
  getForecasts: async function (req, res) {
    try {
      // Get the window and periods parameters, default to 4 and 6 if not provided
      const window = req.query.window || 2; // Mengambil dari query string
      const periods = req.query.periods || 1; // Mengambil dari query string

      // Fetch telur forecast data
      const telurResponse = await axios.get(
        `http://localhost:3001/api/v1/forecast/telur/total_telur_kg/${window}/${periods}`
      );

      // Fetch pakan forecast data (jika diperlukan juga)
      const pakanResponse = await axios.get(
        `http://localhost:3001/api/v1/forecast/pakan/total_Pakan_kg/${window}/${periods}`
      );

      // Return the combined forecast data
      res.json({
        telur: telurResponse.data,
        pakan: pakanResponse.data, // Anda bisa juga hanya mengirim data telur jika hanya itu yang dibutuhkan
      });
      console.log(
        "Forecast data fetched successfully for window:",
        window,
        "periods:",
        periods
      );
    } catch (error) {
      console.error("Error fetching forecast data:", error.message);
      res.status(500).json({
        error: "Failed to fetch forecast data",
        message: error.message,
      });
    }
  },
  //#endregion Moving Average Function

  //#region User Function

  //#endregion User Function
};
