document.addEventListener('DOMContentLoaded', function () {
    const canvasElement = document.getElementById('telurForecastChart');
    const loaderElement = document.getElementById('chartLoader');
    const errorElement = document.getElementById('chartError');

    if (!canvasElement) {
        console.error('Elemen canvas #telurForecastChart tidak ditemukan!');
        if(errorElement) errorElement.style.display = 'block';
        return;
    }

    let chartInstance = null;
    let currentWindow = 4;

    // Enhanced color scheme
    const CHART_COLORS = {
        telurActual: '#4e73df',
        telurForecast: '#e83e8c', 
        pakanActual: '#2ECC71',
        pakanForecast: '#F39C12',
        background: '#f8f9fc',
        gridLines: '#ededed',
        text: '#5a5c69'
    };

    function showLoading(isLoading) {
        if (loaderElement) loaderElement.style.display = isLoading ? 'block' : 'none';
        if (errorElement) errorElement.style.display = 'none';
        canvasElement.style.opacity = isLoading ? 0.5 : 1;
    }

    function showError(message) {
        if (errorElement) {
            errorElement.textContent = message || 'Gagal memuat data grafik.';
            errorElement.style.display = 'block';
        }
        if (loaderElement) loaderElement.style.display = 'none';
        canvasElement.style.opacity = 0.5;
    }

    // Format numbers with commas
    function formatNumber(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // Helper function to process data from API
    function processData(data, field) {
        const monthNames = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
        
        // Sort actual data by date
        const actualData = (data.actual || []).sort((a, b) => {
            if (a.tahun !== b.tahun) return a.tahun - b.tahun;
            return a.bulan - b.bulan;
        });
        
        // Sort forecast data by date
        const forecastData = (data.forecast || []).sort((a, b) => {
            if (a.tahun !== b.tahun) return a.tahun - b.tahun;
            return a.bulan - b.bulan;
        });

        // Combine all data points for a complete timeline
        const combinedDataPoints = [];
        
        // Process actual data
        actualData.forEach(item => {
            combinedDataPoints.push({
                label: `${monthNames[item.bulan-1]} ${item.tahun}`,
                month: item.bulan,
                year: item.tahun,
                actual: item[field],
                forecast: null
            });
        });
        
        // Process forecast data - update existing or add new
        forecastData.forEach(item => {
            // Check if this month already exists in combined data
            const existingIndex = combinedDataPoints.findIndex(
                d => d.month === item.bulan && d.year === item.tahun
            );
            
            if (existingIndex >= 0) {
                // Update forecast value for this month/year
                combinedDataPoints[existingIndex].forecast = item[field];
            } else {
                // Add as new data point
                combinedDataPoints.push({
                    label: `${monthNames[item.bulan-1]} ${item.tahun}`,
                    month: item.bulan,
                    year: item.tahun,
                    actual: null,
                    forecast: item[field]
                });
            }
        });
        
        // Sort combined data by date
        combinedDataPoints.sort((a, b) => {
            if (a.year !== b.year) return a.year - b.year;
            return a.month - b.month;
        });

        return combinedDataPoints;
    }

    async function loadAndRenderChart(windowSize, periodsToForecast) {
        showLoading(true);
        try {
            // Fetch both telur and pakan data in parallel
            const [telurResponse, pakanResponse] = await Promise.all([
                fetch(`http://localhost:3001/api/v1/forecast/telur/total_telur_kg/${windowSize}`),
                fetch(`http://localhost:3001/api/v1/forecast/pakan/total_Pakan_kg/${windowSize}`)
            ]);

            if (!telurResponse.ok || !pakanResponse.ok) {
                throw new Error(`Gagal mengambil data: Status Telur: ${telurResponse.status}, Status Pakan: ${pakanResponse.status}`);
            }

            const telurApiData = await telurResponse.json();
            const pakanApiData = await pakanResponse.json();

            // Process both datasets
            const telurDataPoints = processData(telurApiData.data, 'total_telur_kg');
            const pakanDataPoints = processData(pakanApiData.data, 'total_Pakan_kg');

            // Create a unified timeline from both datasets
            const allMonthsYears = new Set();
            [...telurDataPoints, ...pakanDataPoints].forEach(item => {
                allMonthsYears.add(`${item.month}-${item.year}`);
            });

            // Sort the unified timeline
            const sortedMonthsYears = Array.from(allMonthsYears)
                .map(key => {
                    const [month, year] = key.split('-').map(Number);
                    return { month, year };
                })
                .sort((a, b) => {
                    if (a.year !== b.year) return a.year - b.year;
                    return a.month - b.month;
                });

            // Convert to proper label format
            const monthNames = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
            const xLabels = sortedMonthsYears.map(item => `${monthNames[item.month-1]} ${item.year}`);

            // Create datasets for chart
            const telurActualData = new Array(xLabels.length).fill(null);
            const telurForecastData = new Array(xLabels.length).fill(null);
            const pakanActualData = new Array(xLabels.length).fill(null);
            const pakanForecastData = new Array(xLabels.length).fill(null);

            // Fill in the telur data
            telurDataPoints.forEach(point => {
                const index = sortedMonthsYears.findIndex(item => 
                    item.month === point.month && item.year === point.year);
                if (index !== -1) {
                    telurActualData[index] = point.actual;
                    telurForecastData[index] = point.forecast;
                }
            });

            // Fill in the pakan data
            pakanDataPoints.forEach(point => {
                const index = sortedMonthsYears.findIndex(item => 
                    item.month === point.month && item.year === point.year);
                if (index !== -1) {
                    pakanActualData[index] = point.actual;
                    pakanForecastData[index] = point.forecast;
                }
            });

            if (chartInstance) {
                chartInstance.destroy();
            }

            // Create gradient fills for datasets
            const ctx = canvasElement.getContext('2d');
            const telurActualGradient = ctx.createLinearGradient(0, 0, 0, 400);
            telurActualGradient.addColorStop(0, 'rgba(78, 115, 223, 0.2)');
            telurActualGradient.addColorStop(1, 'rgba(78, 115, 223, 0)');
            
            const telurForecastGradient = ctx.createLinearGradient(0, 0, 0, 400);
            telurForecastGradient.addColorStop(0, 'rgba(232, 62, 140, 0.15)');
            telurForecastGradient.addColorStop(1, 'rgba(232, 62, 140, 0)');

            const pakanActualGradient = ctx.createLinearGradient(0, 0, 0, 400);
            pakanActualGradient.addColorStop(0, 'rgba(46, 204, 113, 0.15)');
            pakanActualGradient.addColorStop(1, 'rgba(46, 204, 113, 0)');
            
            const pakanForecastGradient = ctx.createLinearGradient(0, 0, 0, 400);
            pakanForecastGradient.addColorStop(0, 'rgba(243, 156, 18, 0.15)');
            pakanForecastGradient.addColorStop(1, 'rgba(243, 156, 18, 0)');

            // Calculate max Y-axis value for scaling
            const maxValue = Math.max(
                ...telurActualData.filter(val => val !== null),
                ...telurForecastData.filter(val => val !== null),
                ...pakanActualData.filter(val => val !== null),
                ...pakanForecastData.filter(val => val !== null)
            ) * 1.1;

            chartInstance = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: xLabels,
                    datasets: [
                        // Telur Actual
                        {
                            label: 'Telur Aktual',
                            data: telurActualData,
                            borderColor: CHART_COLORS.telurActual,
                            backgroundColor: telurActualGradient,
                            borderWidth: 3,
                            tension: 0.3,
                            pointRadius: 6,
                            pointBackgroundColor: CHART_COLORS.telurActual,
                            pointBorderColor: '#ffffff',
                            pointBorderWidth: 2,
                            pointHoverRadius: 8,
                            pointStyle: 'circle',
                            fill: true,
                            spanGaps: false
                        },
                        // Telur Forecast
                        {
                            label: 'Telur Prediksi',
                            data: telurForecastData,
                            borderColor: CHART_COLORS.telurForecast,
                            backgroundColor: telurForecastGradient,
                            borderWidth: 3,
                            borderDash: [6, 4],
                            tension: 0.3,
                            pointRadius: 6,
                            pointBackgroundColor: CHART_COLORS.telurForecast,
                            pointBorderColor: '#ffffff',
                            pointBorderWidth: 2,
                            pointHoverRadius: 8,
                            pointStyle: 'rectRot',
                            fill: true,
                            spanGaps: false
                        },
                        // Pakan Actual
                        {
                            label: 'Pakan Aktual',
                            data: pakanActualData,
                            borderColor: CHART_COLORS.pakanActual,
                            backgroundColor: pakanActualGradient,
                            borderWidth: 3,
                            tension: 0.3,
                            pointRadius: 6,
                            pointBackgroundColor: CHART_COLORS.pakanActual,
                            pointBorderColor: '#ffffff',
                            pointBorderWidth: 2,
                            pointHoverRadius: 8,
                            pointStyle: 'triangle',
                            fill: true,
                            spanGaps: false
                        },
                        // Pakan Forecast
                        {
                            label: 'Pakan Prediksi',
                            data: pakanForecastData,
                            borderColor: CHART_COLORS.pakanForecast,
                            backgroundColor: pakanForecastGradient,
                            borderWidth: 3,
                            borderDash: [6, 4],
                            tension: 0.3,
                            pointRadius: 6,
                            pointBackgroundColor: CHART_COLORS.pakanForecast,
                            pointBorderColor: '#ffffff',
                            pointBorderWidth: 2,
                            pointHoverRadius: 8,
                            pointStyle: 'rect',
                            fill: true,
                            spanGaps: false
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    aspectRatio: 2,
                    animation: {
                        duration: 1500,
                        easing: 'easeOutQuart'
                    },
                    interaction: {
                        mode: 'index',
                        intersect: false
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Periode',
                                color: CHART_COLORS.text,
                                font: {
                                    size: 14,
                                    weight: 'bold'
                                },
                                padding: {top: 10}
                            },
                            ticks: {
                                font: {
                                    size: 11
                                },
                                color: CHART_COLORS.text,
                                maxRotation: 45,
                                minRotation: 45
                            },
                            grid: {
                                display: false,
                                drawBorder: true
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Jumlah (kg)',
                                color: CHART_COLORS.text,
                                font: {
                                    size: 14,
                                    weight: 'bold'
                                },
                                padding: {bottom: 10}
                            },
                            ticks: {
                                font: {
                                    size: 12
                                },
                                color: CHART_COLORS.text,
                                callback: function(value) {
                                    return formatNumber(value);
                                }
                            },
                            grid: {
                                color: CHART_COLORS.gridLines,
                                drawBorder: true,
                                lineWidth: 0.5
                            },
                            beginAtZero: true,
                            suggestedMax: maxValue
                        }
                    },
                    plugins: {
                        legend: {
                            position: 'top',
                            align: 'center',
                            labels: {
                                usePointStyle: true,
                                boxWidth: 10,
                                padding: 20,
                                font: {
                                    size: 12,
                                    weight: 'bold'
                                },
                                color: CHART_COLORS.text
                            }
                        },
                        title: {
                            display: true,
                            text: 'Prediksi Produksi Telur dan Pakan dengan Moving Average',
                            font: {
                                size: 18,
                                weight: 'bold'
                            },
                            color: CHART_COLORS.text,
                            padding: {
                                bottom: 30
                            }
                        },
                        tooltip: {
                            backgroundColor: 'rgba(255, 255, 255, 0.95)',
                            titleColor: '#333',
                            bodyColor: '#333',
                            borderColor: '#ddd',
                            borderWidth: 1,
                            cornerRadius: 8,
                            padding: 12,
                            boxPadding: 6,
                            usePointStyle: true,
                            callbacks: {
                                title: function(tooltipItems) {
                                    return tooltipItems[0].label || '';
                                },
                                label: function(context) {
                                    let label = context.dataset.label || '';
                                    if (context.parsed.y !== null) {
                                        return `${label}: ${formatNumber(context.parsed.y)} kg`;
                                    }
                                    return null;
                                },
                                labelPointStyle: function(context) {
                                    return {
                                        pointStyle: context.dataset.pointStyle,
                                        rotation: 0
                                    };
                                }
                            }
                        }
                    },
                    elements: {
                        line: {
                            tension: 0.3
                        }
                    },
                    layout: {
                        padding: {
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: 20
                        }
                    }
                }
            });
            
            // Update the legend colors in the HTML to match the chart
            document.querySelectorAll('.mt-2.text-center.small span i.fas.fa-circle').forEach(icon => {
                if (icon.parentElement.textContent.includes('Telur Aktual')) {
                    icon.style.color = CHART_COLORS.telurActual;
                } else if (icon.parentElement.textContent.includes('Telur Prediksi')) {
                    icon.style.color = CHART_COLORS.telurForecast;
                } else if (icon.parentElement.textContent.includes('Pakan Aktual')) {
                    icon.style.color = CHART_COLORS.pakanActual;
                } else if (icon.parentElement.textContent.includes('Pakan Prediksi')) {
                    icon.style.color = CHART_COLORS.pakanForecast;
                }
            });
            
            showLoading(false);
            
        } catch (error) {
            console.error('Gagal memuat atau merender grafik:', error);
            showError(error.message);
            showLoading(false);
        }
    }

    // Add window resize handler for responsive chart
    window.addEventListener('resize', function() {
        if (chartInstance) {
            chartInstance.resize();
        }
    });
    
    loadAndRenderChart(currentWindow);

    // Add event listeners for refresh button
    const refreshButton = document.getElementById('refreshForecastChartButton');
    if (refreshButton) {
        refreshButton.addEventListener('click', () => {
            const newWindow = parseInt(document.getElementById('forecastWindowInput').value) || 4;
            const newPeriods = parseInt(document.getElementById('forecastPeriodsInput').value) || 4;
            currentWindow = newWindow;
            
            loadAndRenderChart(currentWindow);
        });
    }
    
    // Add download button functionality
    const downloadButton = document.getElementById('downloadChartButton');
    if (downloadButton) {
        downloadButton.addEventListener('click', () => {
            // Create temporary link
            const link = document.createElement('a');
            link.download = 'prediksi-telur-pakan.png';
            link.href = canvasElement.toDataURL('image/png');
            link.click();
        });
    }
});