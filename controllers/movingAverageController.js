/**
 * Client-side Moving Average Controller
 * Handles fetching, processing, and displaying forecast data
 */
const MovingAverageController = {
    // Configuration
    config: {
        apiEndpoint: '/admin/forecasts', // This points to your Express route
        chartColors: {
            telurActual: 'rgba(78, 115, 223, 0.9)',
            telurForecast: 'rgba(78, 115, 223, 0.5)',
            pakanActual: 'rgba(28, 200, 138, 0.9)',
            pakanForecast: 'rgba(28, 200, 138, 0.5)'
        }
    },

    // Data storage
    data: {
        telur: null,
        pakan: null
    },

    /**
     * Initialize the controller
     */
    init: function() {
        console.log("MovingAverageController initialized");
        this.fetchData();
        this.setupEventListeners();
    },

    /**
     * Set up event listeners for interactive elements
     */
    setupEventListeners: function() {
        // Chart dropdown actions
        const toggleTelurBtn = document.getElementById('toggleDatasetsTelur');
        if (toggleTelurBtn) {
            toggleTelurBtn.addEventListener('click', (e) => {
                e.preventDefault();
                this.toggleDatasets('telur');
            });
        }

        const togglePakanBtn = document.getElementById('toggleDatasetsPakan');
        if (togglePakanBtn) {
            togglePakanBtn.addEventListener('click', (e) => {
                e.preventDefault();
                this.toggleDatasets('pakan');
            });
        }

        const showActualBtn = document.getElementById('showActualOnly');
        if (showActualBtn) {
            showActualBtn.addEventListener('click', (e) => {
                e.preventDefault();
                this.showActualOnly();
            });
        }

        const showForecastBtn = document.getElementById('showForecastOnly');
        if (showForecastBtn) {
            showForecastBtn.addEventListener('click', (e) => {
                e.preventDefault();
                this.showForecastOnly();
            });
        }

        const showAllBtn = document.getElementById('showAllDatasets');
        if (showAllBtn) {
            showAllBtn.addEventListener('click', (e) => {
                e.preventDefault();
                this.showAllDatasets();
            });
        }

        // Download chart images
        const downloadChartBtn = document.getElementById('downloadChartImage');
        if (downloadChartBtn) {
            downloadChartBtn.addEventListener('click', (e) => {
                e.preventDefault();
                this.downloadChartAsImage('myAreaChart', 'forecast-chart.png');
            });
        }

        const downloadPieBtn = document.getElementById('downloadPieChartImage');
        if (downloadPieBtn) {
            downloadPieBtn.addEventListener('click', (e) => {
                e.preventDefault();
                this.downloadChartAsImage('myPieChart', 'fcr-chart.png');
            });
        }
    },

    /**
     * Fetch data from API
     */
    fetchData: async function() {
        try {
            // Show loading state
            this.showLoading();

            console.log("Fetching forecast data from:", this.config.apiEndpoint);

            // Fetch forecast data from backend API
            const response = await fetch(this.config.apiEndpoint);
            if (!response.ok) {
                throw new Error(`API returned ${response.status}: ${response.statusText}`);
            }

            const data = await response.json();
            
            // Store the data
            this.data = data;
            
            console.log('Forecast data received:', data);

            // Update UI with the data
            this.updateCards();
            this.updateCharts();
            this.updateTable();
            
            // Hide loading indicators
            this.hideLoading();
        } catch (error) {
            console.error('Error fetching forecast data:', error);
            this.showError('Failed to load forecast data: ' + error.message);
            this.hideLoading();
        }
    },

    /**
     * Update forecast cards with the latest data
     */
    updateCards: function() {
        if (!this.data?.telur?.data?.forecast || !this.data?.pakan?.data?.forecast) {
            console.warn("Missing forecast data for cards");
            return;
        }

        // Get next month forecasts (first item in the forecast array)
        const nextTelurForecast = this.data.telur.data.forecast[0];
        const nextPakanForecast = this.data.pakan.data.forecast[0];

        // Update telur forecast card
        const telurForecastEl = document.getElementById('nextMonthTelurForecast');
        const telurDateEl = document.getElementById('nextMonthTelurDate');

        if (telurForecastEl && nextTelurForecast) {
            // Format the date
            const monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
            const monthName = monthNames[nextTelurForecast.bulan - 1];
            
            telurForecastEl.textContent = `${Number(nextTelurForecast.total_telur_kg).toLocaleString()} kg`;
            
            if (telurDateEl) {
                telurDateEl.textContent = `${monthName} ${nextTelurForecast.tahun}`;
            }
        }

        // Update pakan forecast card
        const pakanForecastEl = document.getElementById('nextMonthPakanForecast');
        const pakanDateEl = document.getElementById('nextMonthPakanDate');

        if (pakanForecastEl && nextPakanForecast) {
            // Format the date
            const monthNames = ["January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"];
            const monthName = monthNames[nextPakanForecast.bulan - 1];
            
            pakanForecastEl.textContent = `${Number(nextPakanForecast.total_pakan_kg).toLocaleString()} kg`;
            
            if (pakanDateEl) {
                pakanDateEl.textContent = `${monthName} ${nextPakanForecast.tahun}`;
            }
        }

        // Calculate and update FCR if we have both forecasts
        const fcrEl = document.getElementById('forecastFCR');
        const fcrProgressEl = document.getElementById('fcrProgress');

        if (fcrEl && fcrProgressEl && nextTelurForecast && nextPakanForecast) {
            const fcr = nextPakanForecast.total_pakan_kg / nextTelurForecast.total_telur_kg;
            fcrEl.textContent = fcr.toFixed(3);
            
            // Update progress bar (assuming 2.0 is a good maximum FCR)
            const percentage = Math.min(fcr / 2.0 * 100, 100);
            fcrProgressEl.style.width = `${percentage}%`;
            fcrProgressEl.setAttribute('aria-valuenow', percentage);
        }
    },

    /**
     * Update the charts with forecast data
     */
    updateCharts: function() {
        if (!this.data?.telur?.data || !this.data?.pakan?.data) {
            console.warn("Missing data for charts");
            return;
        }

        this.updateAreaChart();
        this.updatePieChart();
    },

    /**
     * Update the area chart with both telur and pakan data
     */
    updateAreaChart: function() {
        // Get the canvas context
        const canvas = document.getElementById('myAreaChart');
        if (!canvas) {
            console.warn("Area chart canvas not found");
            return;
        }
        
        const ctx = canvas.getContext('2d');
        
        // Process data for charts
        const telurActual = this.data.telur.data.actual || [];
        const telurForecast = this.data.telur.data.forecast || [];
        const pakanActual = this.data.pakan.data.actual || [];
        const pakanForecast = this.data.pakan.data.forecast || [];
        
        // Create labels for all data points
        const allLabels = [...new Set([
            ...telurActual.map(item => `${item.bulan}/${item.tahun}`),
            ...telurForecast.map(item => `${item.bulan}/${item.tahun}`),
            ...pakanActual.map(item => `${item.bulan}/${item.tahun}`),
            ...pakanForecast.map(item => `${item.bulan}/${item.tahun}`)
        ])].sort((a, b) => {
            // Sort by year/month
            const [monthA, yearA] = a.split('/').map(Number);
            const [monthB, yearB] = b.split('/').map(Number);
            
            if (yearA !== yearB) return yearA - yearB;
            return monthA - monthB;
        });
        
        // Destroy existing chart if it exists
        if (window.forecastChart) {
            window.forecastChart.destroy();
        }
        
        // Map data to labels
        const telurActualData = this.mapDataToLabels(
            telurActual.map(item => item.total_telur_kg), 
            telurActual.map(item => `${item.bulan}/${item.tahun}`),
            allLabels
        );
        
        const telurForecastData = this.mapDataToLabels(
            telurForecast.map(item => item.total_telur_kg),
            telurForecast.map(item => `${item.bulan}/${item.tahun}`),
            allLabels
        );
        
        const pakanActualData = this.mapDataToLabels(
            pakanActual.map(item => item.total_pakan_kg),
            pakanActual.map(item => `${item.bulan}/${item.tahun}`),
            allLabels
        );
        
        const pakanForecastData = this.mapDataToLabels(
            pakanForecast.map(item => item.total_pakan_kg),
            pakanForecast.map(item => `${item.bulan}/${item.tahun}`),
            allLabels
        );
        
        // Create new chart
        window.forecastChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: allLabels,
                datasets: [
                    {
                        label: 'Actual Telur (kg)',
                        lineTension: 0.3,
                        backgroundColor: 'rgba(78, 115, 223, 0.05)',
                        borderColor: this.config.chartColors.telurActual,
                        pointRadius: 3,
                        pointBackgroundColor: this.config.chartColors.telurActual,
                        pointBorderColor: this.config.chartColors.telurActual,
                        pointHoverRadius: 3,
                        pointHoverBackgroundColor: this.config.chartColors.telurActual,
                        pointHoverBorderColor: this.config.chartColors.telurActual,
                        pointHitRadius: 10,
                        pointBorderWidth: 2,
                        data: telurActualData
                    },
                    {
                        label: 'Forecast Telur (kg)',
                        lineTension: 0.3,
                        backgroundColor: 'rgba(78, 115, 223, 0.05)',
                        borderColor: this.config.chartColors.telurForecast,
                        borderDash: [5, 5],
                        pointRadius: 3,
                        pointBackgroundColor: this.config.chartColors.telurForecast,
                        pointBorderColor: this.config.chartColors.telurForecast,
                        pointHoverRadius: 3,
                        pointHoverBackgroundColor: this.config.chartColors.telurForecast,
                        pointHoverBorderColor: this.config.chartColors.telurForecast,
                        pointHitRadius: 10,
                        pointBorderWidth: 2,
                        data: telurForecastData
                    },
                    {
                        label: 'Actual Pakan (kg)',
                        lineTension: 0.3,
                        backgroundColor: 'rgba(28, 200, 138, 0.05)',
                        borderColor: this.config.chartColors.pakanActual,
                        pointRadius: 3,
                        pointBackgroundColor: this.config.chartColors.pakanActual,
                        pointBorderColor: this.config.chartColors.pakanActual,
                        pointHoverRadius: 3,
                        pointHoverBackgroundColor: this.config.chartColors.pakanActual,
                        pointHoverBorderColor: this.config.chartColors.pakanActual,
                        pointHitRadius: 10,
                        pointBorderWidth: 2,
                        data: pakanActualData
                    },
                    {
                        label: 'Forecast Pakan (kg)',
                        lineTension: 0.3,
                        backgroundColor: 'rgba(28, 200, 138, 0.05)',
                        borderColor: this.config.chartColors.pakanForecast,
                        borderDash: [5, 5],
                        pointRadius: 3,
                        pointBackgroundColor: this.config.chartColors.pakanForecast,
                        pointBorderColor: this.config.chartColors.pakanForecast,
                        pointHoverRadius: 3,
                        pointHoverBackgroundColor: this.config.chartColors.pakanForecast,
                        pointHoverBorderColor: this.config.chartColors.pakanForecast,
                        pointHitRadius: 10,
                        pointBorderWidth: 2,
                        data: pakanForecastData
                    }
                ],
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'date'
                        },
                        gridLines: {
                            display: false,
                            drawBorder: false
                        },
                        ticks: {
                            maxTicksLimit: 12
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            maxTicksLimit: 5,
                            padding: 10,
                            callback: function(value) {
                                return value.toLocaleString() + ' kg';
                            }
                        },
                        gridLines: {
                            color: "rgb(234, 236, 244)",
                            zeroLineColor: "rgb(234, 236, 244)",
                            drawBorder: false,
                            borderDash: [2],
                            zeroLineBorderDash: [2]
                        }
                    }],
                },
                legend: {
                    display: true,
                    position: 'bottom'
                },
                tooltips: {
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    titleMarginBottom: 10,
                    titleFontColor: '#6e707e',
                    titleFontSize: 14,
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    intersect: false,
                    mode: 'index',
                    caretPadding: 10,
                    callbacks: {
                        label: function(tooltipItem, chart) {
                            const datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                            return `${datasetLabel}: ${Number(tooltipItem.yLabel).toLocaleString()} kg`;
                        }
                    }
                }
            }
        });
    },

    /**
     * Update the FCR pie chart
     */
    updatePieChart: function() {
        // Get the canvas context
        const canvas = document.getElementById('myPieChart');
        if (!canvas) {
            console.warn("Pie chart canvas not found");
            return;
        }
        
        const ctx = canvas.getContext('2d');
        
        if (!this.data?.telur?.data?.actual || !this.data?.telur?.data?.forecast || 
            !this.data?.pakan?.data?.actual || !this.data?.pakan?.data?.forecast) {
            console.warn("Missing data for pie chart");
            return;
        }

        // Calculate total actual and forecast values
        const telurActualTotal = this.data.telur.data.actual.reduce((sum, item) => sum + Number(item.total_telur_kg || 0), 0);
        const telurForecastTotal = this.data.telur.data.forecast.reduce((sum, item) => sum + Number(item.total_telur_kg || 0), 0);
        const pakanActualTotal = this.data.pakan.data.actual.reduce((sum, item) => sum + Number(item.total_pakan_kg || 0), 0);
        const pakanForecastTotal = this.data.pakan.data.forecast.reduce((sum, item) => sum + Number(item.total_pakan_kg || 0), 0);

        // Calculate FCR values (Feed Conversion Ratio)
        const actualFCR = pakanActualTotal / (telurActualTotal || 1);  // Avoid division by zero
        const forecastFCR = pakanForecastTotal / (telurForecastTotal || 1);  // Avoid division by zero
        
        // Destroy existing chart if it exists
        if (window.fcrChart) {
            window.fcrChart.destroy();
        }
        
        // Create new chart
        window.fcrChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Actual FCR', 'Forecast FCR'],
                datasets: [{
                    data: [actualFCR, forecastFCR],
                    backgroundColor: ['#4e73df', '#1cc88a'],
                    hoverBackgroundColor: ['#2e59d9', '#17a673'],
                    hoverBorderColor: "rgba(234, 236, 244, 1)",
                }],
            },
            options: {
                maintainAspectRatio: false,
                tooltips: {
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                    callbacks: {
                        label: function(tooltipItem, data) {
                            return data.labels[tooltipItem.index] + ': ' + 
                                data.datasets[0].data[tooltipItem.index].toFixed(3) + ' kg feed / kg eggs';
                        }
                    }
                },
                legend: {
                    display: true,
                    position: 'bottom'
                },
                cutoutPercentage: 70,
            },
        });

        // Update the FCR metrics text
        const fcrDiff = forecastFCR - actualFCR;
        const metricsContainer = document.querySelector('.mt-4.text-center.small');
        if (metricsContainer) {
            const fcrTrendIcon = fcrDiff > 0 ? 
                '<i class="fas fa-arrow-up text-danger"></i>' : 
                '<i class="fas fa-arrow-down text-success"></i>';
            
            metricsContainer.innerHTML = `
                <span class="mr-2">
                    <i class="fas fa-circle text-primary"></i> Actual FCR: ${actualFCR.toFixed(3)}
                </span>
                <span class="mr-2">
                    <i class="fas fa-circle text-success"></i> Forecast FCR: ${forecastFCR.toFixed(3)}
                </span>
                <span class="mr-2">
                    <i class="fas fa-circle text-info"></i> Difference: ${fcrDiff.toFixed(3)} ${fcrTrendIcon}
                </span>
            `;
        }
    },

    /**
     * Update the forecast details table
     */
    updateTable: function() {
        const tableBody = document.getElementById('forecastTableBody');
        if (!tableBody) {
            console.warn("Forecast table not found");
            return;
        }

        if (!this.data?.telur?.data?.forecast || !this.data?.pakan?.data?.forecast) {
            console.warn("Missing forecast data for table");
            tableBody.innerHTML = '<tr><td colspan="4" class="text-center">No forecast data available</td></tr>';
            return;
        }

        // Clear existing rows
        tableBody.innerHTML = '';

        // Combine telur and pakan forecasts by month/year
        const telurForecasts = this.data.telur.data.forecast;
        const pakanForecasts = this.data.pakan.data.forecast;
        
        // Map to store combined data by month/year
        const combinedForecasts = new Map();
        
        // Process telur forecasts
        telurForecasts.forEach(forecast => {
            const key = `${forecast.bulan}-${forecast.tahun}`;
            combinedForecasts.set(key, { 
                ...combinedForecasts.get(key) || {},
                bulan: forecast.bulan,
                tahun: forecast.tahun,
                telur: forecast.total_telur_kg
            });
        });
        
        // Process pakan forecasts
        pakanForecasts.forEach(forecast => {
            const key = `${forecast.bulan}-${forecast.tahun}`;
            combinedForecasts.set(key, { 
                ...combinedForecasts.get(key) || {},
                bulan: forecast.bulan,
                tahun: forecast.tahun,
                pakan: forecast.total_pakan_kg
            });
        });
        
        // Sort by date
        const sortedForecasts = Array.from(combinedForecasts.values())
            .sort((a, b) => {
                if (a.tahun !== b.tahun) return a.tahun - b.tahun;
                return a.bulan - b.bulan;
            });
            
        // Generate table rows
        const monthNames = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"];
            
        sortedForecasts.forEach(forecast => {
            const fcr = forecast.pakan && forecast.telur ? 
                (forecast.pakan / forecast.telur).toFixed(3) : 'N/A';
                
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${monthNames[forecast.bulan - 1]} ${forecast.tahun}</td>
                <td>${forecast.telur ? Number(forecast.telur).toLocaleString() : 'N/A'}</td>
                <td>${forecast.pakan ? Number(forecast.pakan).toLocaleString() : 'N/A'}</td>
                <td>${fcr}</td>
            `;
            tableBody.appendChild(row);
        });
    },

    /**
     * Map data values to labels array
     * @param {Array} values - The data values
     * @param {Array} sourceLabels - The original labels for the values
     * @param {Array} targetLabels - The target labels to map to
     * @returns {Array} - Values mapped to target labels with null for missing values
     */
    mapDataToLabels: function(values, sourceLabels, targetLabels) {
        return targetLabels.map(label => {
            const index = sourceLabels.indexOf(label);
            return index >= 0 ? values[index] : null;
        });
    },

    /**
     * Toggle chart datasets visibility
     */
    toggleDatasets: function(dataType) {
        if (!window.forecastChart) return;
        
        const chart = window.forecastChart;
        
        if (dataType === 'telur') {
            // Toggle telur datasets
            chart.data.datasets[0].hidden = !chart.data.datasets[0].hidden;
            chart.data.datasets[1].hidden = !chart.data.datasets[1].hidden;
        } else if (dataType === 'pakan') {
            // Toggle pakan datasets
            chart.data.datasets[2].hidden = !chart.data.datasets[2].hidden;
            chart.data.datasets[3].hidden = !chart.data.datasets[3].hidden;
        }
        
        chart.update();
    },

    /**
     * Show only actual data
     */
    showActualOnly: function() {
        if (!window.forecastChart) return;
        
        const chart = window.forecastChart;
        
        // Show actual, hide forecast
        chart.data.datasets[0].hidden = false; // Actual telur
        chart.data.datasets[1].hidden = true;  // Forecast telur
        chart.data.datasets[2].hidden = false; // Actual pakan
        chart.data.datasets[3].hidden = true;  // Forecast pakan
        
        chart.update();
    },

    /**
     * Show only forecast data
     */
    showForecastOnly: function() {
        if (!window.forecastChart) return;
        
        const chart = window.forecastChart;
        
        // Hide actual, show forecast
        chart.data.datasets[0].hidden = true;  // Actual telur
        chart.data.datasets[1].hidden = false; // Forecast telur
        chart.data.datasets[2].hidden = true;  // Actual pakan
        chart.data.datasets[3].hidden = false; // Forecast pakan
        
        chart.update();
    },

    /**
     * Show all datasets
     */
    showAllDatasets: function() {
        if (!window.forecastChart) return;
        
        const chart = window.forecastChart;
        
        // Show all datasets
        chart.data.datasets.forEach(dataset => {
            dataset.hidden = false;
        });
        
        chart.update();
    },

    /**
     * Download chart as an image
     */
    downloadChartAsImage: function(chartId, filename) {
        const canvas = document.getElementById(chartId);
        if (!canvas) return;
        
        // Create temporary link and trigger download
        const link = document.createElement('a');
        link.href = canvas.toDataURL('image/png');
        link.download = filename;
        link.click();
    },

    /**
     * Show loading indicators
     */
    showLoading: function() {
        // Show loading in chart areas
        const chartAreas = document.querySelectorAll('.chart-area, .chart-pie');
        chartAreas.forEach(area => {
            // Check if loading indicator already exists
            if (area.querySelector('.chart-loader')) return;
            
            const loader = document.createElement('div');
            loader.className = 'chart-loader';
            loader.innerHTML = '<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div>';
            area.appendChild(loader);
        });
        
        // Show loading in forecast cards
        const telurForecast = document.getElementById('nextMonthTelurForecast');
        if (telurForecast) telurForecast.textContent = 'Loading...';
        
        const pakanForecast = document.getElementById('nextMonthPakanForecast');
        if (pakanForecast) pakanForecast.textContent = 'Loading...';
        
        const forecastFCR = document.getElementById('forecastFCR');
        if (forecastFCR) forecastFCR.textContent = 'Loading...';
        
        // Show loading in the table
        const tableBody = document.getElementById('forecastTableBody');
        if (tableBody) {
            tableBody.innerHTML = '<tr><td colspan="4" class="text-center">Loading forecast data...</td></tr>';
        }
    },

    /**
     * Hide loading indicators
     */
    hideLoading: function() {
        const loaders = document.querySelectorAll('.chart-loader');
        loaders.forEach(loader => loader.remove());
    },

    /**
     * Show error message
     */
    showError: function(message) {
        console.error("Error:", message);
        
        // Show error in chart areas
        const chartAreas = document.querySelectorAll('.chart-area, .chart-pie');
        chartAreas.forEach(area => {
            // Remove existing error messages
            const existingError = area.querySelector('.chart-error');
            if (existingError) existingError.remove();
            
            const errorDiv = document.createElement('div');
            errorDiv.className = 'chart-error alert alert-danger';
            errorDiv.textContent = message;
            area.appendChild(errorDiv);
        });
        
        // Show error in forecast cards
        const telurForecast = document.getElementById('nextMonthTelurForecast');
        if (telurForecast) telurForecast.textContent = 'Error';
        
        const pakanForecast = document.getElementById('nextMonthPakanForecast');
        if (pakanForecast) pakanForecast.textContent = 'Error';
        
        const forecastFCR = document.getElementById('forecastFCR');
        if (forecastFCR) forecastFCR.textContent = 'Error';
        
        // Show error in the table
        const tableBody = document.getElementById('forecastTableBody');
        if (tableBody) {
            tableBody.innerHTML = `<tr><td colspan="4" class="text-center text-danger">${message}</td></tr>`;
        }
    }
};

// Initialize the controller when the document is ready
document.addEventListener('DOMContentLoaded', function() {
    MovingAverageController.init();
});