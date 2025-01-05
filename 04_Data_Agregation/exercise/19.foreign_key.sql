CREATE TABLE IF NOT EXISTS employees_projects(
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    project_id INT REFERENCES projects(id)
);