const mysql = require('mysql');
const connection = mysql.createConnection({
    host     : 'localhost',
    port     : '3306',
    user     : 'teste',
    password : '1234',
    database : 'DevBand'
});

connection.connect(function(err) {
    if (err) throw err;
    console.log('Conectado com sucesso!')
});

module.exports = connection;