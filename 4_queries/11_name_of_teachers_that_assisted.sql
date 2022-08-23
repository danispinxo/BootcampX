SELECT DISTINCT teachers.name as name, cohorts.name as cohorts
  FROM assistance_requests
  JOIN teachers ON assistance_requests.teacher_id = teachers.id
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts.name = 'JUL02'
  ORDER BY name;