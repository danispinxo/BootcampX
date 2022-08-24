const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
  SELECT DISTINCT teachers.name as name, cohorts.name as cohort
    FROM assistance_requests
    JOIN teachers ON assistance_requests.teacher_id = teachers.id
    JOIN students ON assistance_requests.student_id = students.id
    JOIN cohorts ON students.cohort_id = cohorts.id
    WHERE cohorts.name = $1
    ORDER BY name
    LIMIT $2;
  `;

const cohortName = process.argv[2];
const limit = process.argv[3] || 20;
const values = [`${cohortName}`, limit];

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.name}`);
  })
});