WITH top_paying_jobs AS (
    SELECT
        job_id,
        name AS company_name,    
        job_title,
        salary_year_avg AS avg_salary_year 
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
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC; 
