// Written by Juan Pablo Gutiérrez

require('dotenv').config({
    path: ".env"
})

console.log("API VALUE: " + process.env.API_KEY)

const path = "https://xilogdataapi.atriumiot.com/"
