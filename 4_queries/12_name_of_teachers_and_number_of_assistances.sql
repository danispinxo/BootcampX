SELECT DISTINCT teachers.name as name, cohorts.name as cohorts, COUNT(assistance_requests.*) as total_assistances
  FROM assistance_requests
  JOIN teachers ON assistance_requests.teacher_id = teachers.id
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
  WHERE cohorts.name = 'JUL02'
  GROUP BY teachers.name, cohorts.name
  ORDER BY teachers.name;