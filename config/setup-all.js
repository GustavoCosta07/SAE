const setupRoutes = require('./setup-routes');
// const setupCors = require('./setup-cors');
const setupViews = require('./setup-views');
const setupPublic = require('./setup-public');
const setupBodyParser = require('./setup-bodyParser')
// const setupSession = require('./setup-session');
// const setupGlobal = require('./setup-global');

module.exports = async (app) => {
    // await setupGlobal(app),
    await setupBodyParser(app),
    // await setupSession(app),
    await setupViews(app),
    await setupPublic(app),
    await setupRoutes(app)
}