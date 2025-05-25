document.addEventListener('DOMContentLoaded', function () {
    const canvasElement = document.getElementById('telurForecastChart');
    const loaderElement = document.getElementById('chartLoader');
    const errorElement = document.getElementById('chartError');

    if (!canvasElement) {
        console.error('Elemen canvas #telurForecastChart tidak ditemukan!');
        if(errorElement) errorElement.style.display = 'block';
        return;
    }

    let telurChartInstance = null; // Untuk menyimpan instance chart

    // --- Konfigurasi Awal (bisa dibuat dinamis) ---
    let currentWindow = 4;
    let currentPeriods = 4;

    // --- Fungsi untuk menampilkan/menyembunyikan loading/error ---
    function showLoading(isLoading) {
        if (loaderElement) loaderElement.style.display = isLoading ? 'block' : 'none';
        if (errorElement) errorElement.style.display = 'none'; // Sembunyikan error saat loading
        canvasElement.style.opacity = isLoading ? 0.5 : 1;
    }

    function showError(message) {
        if (errorElement) {
            errorElement.textContent = message || 'Gagal memuat data grafik.';
            errorElement.style.display = 'block';
        }
        if (loaderElement) loaderElement.style.display = 'none';
        canvasElement.style.opacity = 0.5; // Redupkan canvas saat error
    }

    // --- Fungsi untuk memformat label bulan/tahun ---
    const formatChartLabel = (item) => `${item.bulan}/${item.tahun}`;
    const monthNames = ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Ags", "Sep", "Okt", "Nov", "Des"];
    const formatDisplayLabel = (label) => {
        const [month, year] = label.split('/');
        return `${monthNames[parseInt(month) - 1]} ${year}`;
    };

    // --- Fungsi utama untuk mengambil data dan merender grafik ---
    async function loadAndRenderChart(windowSize, periodsToForecast) {
        showLoading(true);
        try {
            // Endpoint di Express App Anda yang akan memanggil API backend
            const adminApiEndpoint = `/admin/forecasts?window=${windowSize}&periods=${periodsToForecast}`;
            const response = await fetch(adminApiEndpoint);

            if (!response.ok) {
                throw new Error(`Gagal mengambil data: Status ${response.status}`);
            }
            const apiData = await response.json();

            if (!apiData.telur || !apiData.telur.data) {
                throw new Error('Data prediksi telur tidak ditemukan dalam respons API.');
            }

            const telurData = apiData.telur.data;
            const actuals = (telurData.actual || []).sort((a,b) => new Date(a.tahun, a.bulan -1) - new Date(b.tahun, b.bulan -1));
            const forecasts = (telurData.forecast || []).sort((a,b) => new Date(a.tahun, a.bulan -1) - new Date(b.tahun, b.bulan -1));

            // Siapkan label untuk sumbu-X (Bulan/Tahun)
            const allLabelsSet = new Set([
                ...actuals.map(formatChartLabel),
                ...forecasts.map(formatChartLabel)
            ]);
            const sortedLabels = Array.from(allLabelsSet).sort((a, b) => {
                const [monthA, yearA] = a.split('/').map(Number);
                const [monthB, yearB] = b.split('/').map(Number);
                if (yearA !== yearB) return yearA - yearB;
                return monthA - monthB;
            });
            const displayLabels = sortedLabels.map(formatDisplayLabel);


            // Data aktual untuk grafik
            const actualChartData = sortedLabels.map(label => {
                const foundActual = actuals.find(item => formatChartLabel(item) === label);
                return foundActual ? foundActual.total_telur_kg : null;
            });

            // Data prediksi untuk grafik (agar garisnya bersambung dari titik aktual terakhir)
            const forecastChartData = new Array(sortedLabels.length).fill(null);
            let lastActualIndex = -1;
            for (let i = actualChartData.length - 1; i >= 0; i--) {
                if (actualChartData[i] !== null) {
                    lastActualIndex = i;
                    break;
                }
            }

            if (lastActualIndex !== -1 && actuals.length > 0) {
                 // Mulai garis prediksi dari titik aktual terakhir
                forecastChartData[lastActualIndex] = actualChartData[lastActualIndex];
            }
            
            forecasts.forEach(forecastItem => {
                const label = formatChartLabel(forecastItem);
                const index = sortedLabels.indexOf(label);
                if (index !== -1) {
                    forecastChartData[index] = forecastItem.total_telur_kg;
                }
            });

            // Hancurkan instance chart sebelumnya jika ada (penting untuk update)
            if (telurChartInstance) {
                telurChartInstance.destroy();
            }

            const ctx = canvasElement.getContext('2d');
            telurChartInstance = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: displayLabels, // Gunakan label yang sudah diformat
                    datasets: [
                        {
                            label: 'Telur Aktual (Kg)',
                            data: actualChartData,
                            borderColor: 'rgba(78, 115, 223, 1)', // Biru
                            backgroundColor: 'rgba(78, 115, 223, 0.1)',
                            tension: 0.1,
                            fill: true,
                            pointRadius: 4,
                            pointBackgroundColor: 'rgba(78, 115, 223, 1)',
                        },
                        {
                            label: 'Prediksi Telur (Kg)',
                            data: forecastChartData,
                            borderColor: 'rgba(231, 76, 60, 1)', // Merah
                            backgroundColor: 'rgba(231, 76, 60, 0.1)',
                            tension: 0.1,
                            fill: true,
                            borderDash: [5, 5], // Garis putus-putus
                            pointRadius: 4,
                            pointStyle: 'rectRot',
                            pointBackgroundColor: 'rgba(231, 76, 60, 1)',
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: false, // Bisa diset true jika ingin mulai dari 0
                            title: {
                                display: true,
                                text: 'Total Produksi Telur (Kg)'
                            },
                            ticks: {
                                callback: function(value) {
                                    return value.toLocaleString('id-ID'); // Format angka Indonesia
                                }
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Periode (Bulan/Tahun)'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            position: 'bottom',
                        },
                        title: {
                            display: true,
                            text: `Prediksi Moving Average (Window: ${windowSize}, Periode: ${periodsToForecast}) - Produksi Telur`,
                            font: {
                                size: 16
                            }
                        },
                        tooltip: {
                            mode: 'index',
                            intersect: false,
                            callbacks: {
                                label: function(context) {
                                    let label = context.dataset.label || '';
                                    if (label) {
                                        label += ': ';
                                    }
                                    if (context.parsed.y !== null) {
                                        label += context.parsed.y.toLocaleString('id-ID') + ' Kg';
                                    }
                                    return label;
                                }
                            }
                        }
                    },
                    interaction: { // Untuk hover effect yang lebih baik
                        mode: 'index',
                        intersect: false,
                    }
                }
            });
            showLoading(false);
        } catch (error) {
            console.error('Gagal memuat atau merender grafik:', error);
            showError(error.message);
            showLoading(false);
        }
    }

    // --- Panggil fungsi untuk pertama kali ---
    loadAndRenderChart(currentWindow, currentPeriods);

    // --- Event listener untuk tombol refresh (jika Anda menambahkannya) ---
    const refreshButton = document.getElementById('refreshForecastChartButton');
    if (refreshButton) {
        refreshButton.addEventListener('click', () => {
            const newWindow = parseInt(document.getElementById('forecastWindowInput').value) || 4;
            const newPeriods = parseInt(document.getElementById('forecastPeriodsInput').value) || 4;
            currentWindow = newWindow;
            currentPeriods = newPeriods;
            loadAndRenderChart(currentWindow, currentPeriods);
        });
    }
});