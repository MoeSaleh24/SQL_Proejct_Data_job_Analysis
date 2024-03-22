SELECT 
    skills_dim.skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary

FROM job_postings_fact 
JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY 
      skills
ORDER BY 
      avg_salary DESC
LIMIT 30;

/*
  High-Paying Skills: Technologies like "SVN", "Solidity", and "Couchbase" command higher average salaries, 
  indicating their value in the job market.

  High-Paying Skills: Technologies like "SVN", "Solidity", and "Couchbase" command higher average salaries, 
  indicating their value in the job market.

  Demand for Automation and Data Science: Skills related to DevOps ("Ansible", "Terraform") and 
  data science ("PyTorch", "TensorFlow") reflect the ongoing demand for 
  professionals skilled in automation and machine learning technologies.
*/

/*
  "skills","avg_salary"
"svn","400000.00"
"solidity","179000.00"
"couchbase","160515.00"
"datarobot","155485.50"
"golang","155000.00"
"mxnet","149000.00"
"dplyr","147633.33"
"vmware","147500.00"
"terraform","146733.83"
"twilio","138500.00"
"gitlab","134126.00"
"kafka","129999.16"
"puppet","129820.00"
"keras","127013.33"
"pytorch","125226.20"
"perl","124685.75"
"ansible","124370.00"
"hugging face","123950.00"
"tensorflow","120646.83"
"cassandra","118406.68"
"notion","118091.67"
"atlassian","117965.60"
"bitbucket","116711.75"
"airflow","116387.26"
"scala","115479.53"
"linux","114883.20"
"confluence","114153.12"
"pyspark","114057.87"
"mongodb","113607.71"
"aurora","113393.90"
*/