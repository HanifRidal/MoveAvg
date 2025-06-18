const axios = require('axios'); // Pastikan axios sudah diimpor

// Middleware untuk memeriksa autentikasi (sama seperti yang kita diskusikan untuk pakan)
// Anda bisa meletakkannya di file middleware terpisah dan mengimpornya.
const ensureAuthenticated = async (req, res, next) => {
    const token = req.cookies.authToken;

    if (!token) {
        return res.redirect('/admin/signin'); // Ganti dengan URL halaman login EJS Anda
    }

    try {
        // Idealnya, lakukan validasi token ke backend API di sini.
        // Misalnya, dengan memanggil endpoint /api/auth/profile.
        // Untuk contoh ini, kita sederhanakan; jika token ada, kita lanjutkan.
        // Contoh validasi (harus disesuaikan):
        // await axios.get("http://localhost:3001/Api/auth/profile", { // URL backend API Anda
        //     headers: { 'Cookie': `authToken=${token}` }
        // });
        // Jika validasi di atas berhasil, panggil next().
        // Jika gagal (masuk ke catch), tangani seperti di bawah.

        // Untuk sekarang, kita anggap token yang ada mungkin valid dan biarkan backend API yang memvalidasi sepenuhnya.
        next();
    } catch (error) {
        console.error("Error in ensureAuthenticated (token validation with backend API):", error.message);
        res.clearCookie('authToken');
        return res.redirect('/admin/signin');
    }
};