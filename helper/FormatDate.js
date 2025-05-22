/**
 * Format a date string to "Day, YYYY-MM-DD" format
 * @param {string} dateString - Date string to format
 * @returns {string} Formatted date string or 'N/A' if invalid
 */
exports.formatDate = function(dateString) {
  if (!dateString) return 'N/A';
  
  try {
    const date = new Date(dateString);
    // Check if date is valid
    if (isNaN(date.getTime())) return dateString || 'N/A';
    
    // Array of day names
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    
    // Get day name
    const dayName = days[date.getDay()];
    
    // Format as "Day, YYYY-MM-DD"
    const dateOnlyPart = date.toISOString().split('T')[0];
    return `${dayName}, ${dateOnlyPart}`;
  } catch (e) {
    return dateString || 'N/A';
  }
};

/**
 * Format date for HTML date input (YYYY-MM-DD)
 * @param {string} dateString - Date string to format
 * @returns {string} Formatted date string or empty string if invalid
 */
exports.formatDateForInput = function(dateString) {
  if (!dateString) return '';
  
  try {
    const date = new Date(dateString);
    // Check if date is valid
    if (isNaN(date.getTime())) return '';
    
    // Format as YYYY-MM-DD for input type="date"
    return date.toISOString().split('T')[0];
  } catch (e) {
    return '';
  }
};

/**
 * Format a date string to "DD Month YYYY" format (e.g., 21 May 2025)
 * @param {string} dateString - Date string to format
 * @returns {string} Formatted date string or 'N/A' if invalid
 */
exports.formatDateLong = function(dateString) {
  if (!dateString) return 'N/A';
  
  try {
    const date = new Date(dateString);
    // Check if date is valid
    if (isNaN(date.getTime())) return dateString || 'N/A';
    
    // Array of month names
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 
                   'July', 'August', 'September', 'October', 'November', 'December'];
    
    const day = date.getDate();
    const month = months[date.getMonth()];
    const year = date.getFullYear();
    
    return `${day} ${month} ${year}`;
  } catch (e) {
    return dateString || 'N/A';
  }
};

/**
 * Format a date string to Indonesian format (e.g., Senin, 21 Mei 2025)
 * @param {string} dateString - Date string to format
 * @returns {string} Formatted date string or 'N/A' if invalid
 */
exports.formatDateIndonesian = function(dateString) {
  if (!dateString) return 'N/A';
  
  try {
    const date = new Date(dateString);
    // Check if date is valid
    if (isNaN(date.getTime())) return dateString || 'N/A';
    
    // Array of Indonesian day names
    const days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
    
    // Array of Indonesian month names
    const months = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 
                   'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
    
    const dayName = days[date.getDay()];
    const day = date.getDate();
    const month = months[date.getMonth()];
    const year = date.getFullYear();
    
    return `${dayName}, ${day} ${month} ${year}`;
  } catch (e) {
    return dateString || 'N/A';
  }
};