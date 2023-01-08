const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const authRoute = require('./routes/auth');

const app = express();
app.use(bodyParser.json());
app.use(authRoute);

mongoose.connect(`YOURAPPLINK`, {autoIndex : false}).then(() => {
    app.listen(5000);
    console.log('Bağlantı Başarılı!')
}).catch(err => {
    console.log(err)
})





















