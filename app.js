const express = require('express');

const monsters = require('./routes/monsters');

const app = express();

app.use('/monsters', monsters);

// Error handling
app.use((err, req, res, next) => {
    res.json(err);
})

module.exports = app;