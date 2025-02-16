CREATE TABLE clients(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE projects(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id INT REFERENCES clients(id),
    project_lead_id INT
);

CREATE TABLE employees(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    project_id INT REFERENCES projects(id)
);

ALTER TABLE projects
ADD CONSTRAINT fk_projects_employees
    FOREIGN KEY (project_lead_id) REFERENCES employees(id);
