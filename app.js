const express = require('express');
const pool = require('./db');
const app = express();



app.get('/monsters', (req, res) => {
    pool.query('SELECT * FROM monsters;', (err, res) => {
        if (err) return console.log(err);
    
        console.log(res).rows;
    });
});

const port = 3000;

app.listen(port, () => console.log('Listening on port ' + port));