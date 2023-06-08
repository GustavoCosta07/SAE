const bodyParser = require('body-parser');

module.exports = async (app) => {
    app.use(bodyParser());
};