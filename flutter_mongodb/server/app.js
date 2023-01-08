const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const authRoute = require('./routes/auth');

const app = express();
app.use(bodyParser.json());
app.use(authRoute);

mongoose.connect(`mongodb+srv://admin:admin123@cluster0.lzqiefj.mongodb.net/?retryWrites=true&w=majority`, {autoIndex : false}).then(() => {
    app.listen(5000);
    console.log('Bağlantı Başarılı!')
}).catch(err => {
    console.log(err)
})





















