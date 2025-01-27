const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'AuthDatabase',
  password: 'enbraun',
  port: 5432,
});

module.exports = pool;
