SELECT
    job_id AS job_id,    
    name AS company_name,
    job_title AS job_title,
    job_location AS job_location,
    job_schedule_type AS job_type,
    salary_year_avg AS avg_salary_year,
    job_posted_date AS job_posted_date
FROM 
  job_postings_fact AS job_postings
LEFT JOIN company_dim 
ON job_postings.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
      salary_year_avg DESC
LIMIT 10;


-- Created a veiw here, just in case I wanted to use this query again later
CREATE VIEW top_paying_jobs AS (
SELECT
    job_id AS job_id,    
    name AS company_name,
    job_title AS job_title,
    job_location AS job_location,
    job_schedule_type AS job_type,
    salary_year_avg AS avg_salary_year,
    job_posted_date AS job_posted_date
FROM 
  job_postings_fact AS job_postings
LEFT JOIN company_dim 
ON job_postings.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
      salary_year_avg DESC
LIMIT 10
);