const mysql = require('mysql2');

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'databaserrs',
    password: ''
});



module.exports = con;