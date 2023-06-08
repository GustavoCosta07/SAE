require('dotenv').config();
const {
  USUARIO,
  SENHA,
  DATABASE,
  SERVER,
  HOST,
  PASS,
  EMAILTEST,
  SESSION_SECRET,
  ENVIRONMENT,
  SECRET,
  PORT,
  DOMAIN,
  EMAIL,
  EMAILDP,
  PATHNF,
  PATHCMP,
  SESSION_CACHE_HOST,
  SESSION_CACHE_PORT,
  SESSION_CACHE_PASSWORD
} = process.env;

const port = parseInt(PORT || 3000)
const isProd = ENVIRONMENT !== 'dev'

const mysql = require('mysql');
const util = require('util');

if (isProd && !DOMAIN) {
  throw new Error('O domínio deve ser informado!');
}

const domain = DOMAIN || (port !== 80 ? `http://localhost:${port}` : 'http://localhost');

const oneDaySession = 24 * 60 * 60 * 1000
const oneWeekSession = 7 * oneDaySession

const db = mysql.createPool({
  connectionLimit: 10,
  host: HOST,
  user: USUARIO,
  password: SENHA,
  database: DATABASE
});

db.query = util.promisify(db.query);

module.exports = {
  enviroment: ENVIRONMENT,
  isProd,
  port,
  emailDP: EMAILDP,
  pathNf: PATHNF,
  pathCmP: PATHCMP,
  domain,
  db,
  emailProvider: {
    user: EMAIL,
    pass: PASS,
    fakeEmail: EMAILTEST
  },
  session: {
    key: SESSION_SECRET,
    age: isProd ? oneDaySession : oneWeekSession,
    service: ENVIRONMENT === 'dev' ? {
      host: SESSION_CACHE_HOST || null,
      port: SESSION_CACHE_PORT || null,
      password: SESSION_CACHE_PASSWORD || null,
      prefix: 'itone'
    } : null
  },
  Keytoken: {
    secret: SECRET
  }
};