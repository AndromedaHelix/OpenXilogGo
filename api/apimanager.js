// Written by Juan Pablo Gutiérrez
// Manages all server side fetching

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
 * 
 * @returns An array of loggers containing serial number and name.
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
 * 
 * @returns An object which contains an array of channels each containing an array of the channel data:
 */
function getLoggerData(serialNumber, startDate, endDate) {
    const relativePath = `${path}Data/All/${serialNumber}/${startDate}/${endDate}/${API_KEY}`;

    return getJSONData(relativePath);
}

/**
 * Returns a collection of the raw data for the specified Xilog NG logger and channel name. (Max 8 days)
 * 
 * @param {Number} serialNumber Serial number as displayed on device
 * @param {String} startDate Date at which to start querying loggers channel data (yyyy-MM-dd HH:mm)
 * @param {String} endDate Date at which to finish querying loggers channel data (No more than 8 days after start date) (yyyy-MM-dd HH:mm)
 * @param {String} channelName Name of the channel to retrieve data from.
 * 
 * @returns An object which contains an array of the loggers channel data: 
 */
function getChannelData(serialNumber, startDate, endDate, channelName) {
    const relativePath = `${path}Data/Channel/${serialNumber}/${channelName}/${startDate}/${endDate}/${API_KEY}`;

    return getJSONData(relativePath);
}

function getDailyData(serialNumber, startDate, endDate) {
    const relativePath = `${path}Data/DailyStats/${serialNumber}/${startDate}/${endDate}/${API_KEY}`;

    console.log(relativePath);
    return getJSONData(relativePath);
}

/* getDailyData(2304420, "2023-06-02", "2023-06-05").then(out => console.log(out)) */
