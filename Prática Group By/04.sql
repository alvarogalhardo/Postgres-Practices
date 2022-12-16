SELECT MAX(jobs.salary) AS maximumSalary, roles.name AS role FROM jobs JOIN roles ON jobs."roleId"=roles.id WHERE jobs.active=true GROUP BY role ORDER BY maximumSalary ASC;
