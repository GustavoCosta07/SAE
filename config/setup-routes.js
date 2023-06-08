const psicologiaRouter = require('../controllers/Psicologia/router');
// const LoginRouter = require('../controllers/Login/router');
// const { auth } = require('../middlewares/auth-middleware');


module.exports = async (app) => {
  // app.use(LoginRouter);
  app.use('/psicologia', psicologiaRouter);

};