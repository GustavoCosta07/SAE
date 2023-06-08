const nodemailer = require('nodemailer');
const {emailProvider} = require('../config/env')

let transporter = nodemailer.createTransport({
    service: 'gmail',
    user: "smtp.gmail.com",
    port: 465,
    secure: true,
    auth: {
        type: "login",
        user: emailProvider.user,
        pass: emailProvider.pass,
    }
});

module.exports = transporter;