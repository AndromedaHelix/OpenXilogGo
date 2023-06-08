// Written by Juan Pablo Gutiérrez

require('dotenv').config({
    path: ".env"
});

const API_KEY = process.env.API_KEY;

const path = "https://xilogdataapi.atriumiot.com/";

/**
 * @param {String} url The url from which to fetch JSON Data
 */
async function getJSONData(url) {
    const response = await fetch(url);
    const jsonData = await response.json();
    return jsonData;
}

/**
 * Returns array of loggers for the access token
 */
function getAllData() {
    const relativePath = `${path}Logger/All/${API_KEY}`;

    return getJSONData(relativePath);
}

/**
 * Returns a collection of the raw channel data for the specified Xilog NG logger. (Max 8 days)
 * 
 * @param {String} serialNumber Serial number as displayed on device
 * @param {String} startDate Date at which to start querying loggers channel data (yyyy-MM-dd HH:mm)
 * @param {String} endDate Date at which to finish querying loggers channel data. (No more than 8 days after start date) (yyyy-MM-dd HH:mm)
 * @returns 
 */
function getLoggerData(serialNumber, startDate, endDate) {
    const relativePath = `${path}/Data/All/${serialNumber}/${startDate}/${endDate}/${API_KEY}`;

    return getJSONData(relativePath);
}

getAllData().then(out => console.log(out));
