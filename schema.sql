-- Healthcare RBAC project (fake data only)
-- Defines the roles, permissions, and the role-to-permission matrix

CREATE TABLE roles (
  role_id INTEGER PRIMARY KEY,
  role_name TEXT NOT NULL
);

CREATE TABLE permissions (
  permission_id INTEGER PRIMARY KEY,
  permission_name TEXT NOT NULL
);

CREATE TABLE role_permissions (
  role_id INTEGER NOT NULL,
  permission_id INTEGER NOT NULL,
  PRIMARY KEY (role_id, permission_id),
  FOREIGN KEY (role_id) REFERENCES roles(role_id),
  FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)
);

INSERT INTO roles (role_id, role_name) VALUES
  (1, 'Front Desk'),
  (2, 'Billing'),
  (3, 'Hygienist'),
  (4, 'Office Manager');

INSERT INTO permissions (permission_id, permission_name) VALUES
  (1, 'Schedule Appointments'),
  (2, 'Post Payments'),
  (3, 'Edit Ledger'),
  (4, 'View Clinical Notes'),
  (5, 'Run Reports'),
  (6, 'Manage User Access');

INSERT INTO role_permissions (role_id, permission_id) VALUES
  (1, 1), (1, 2),
  (2, 2), (2, 3), (2, 5),
  (3, 1), (3, 4),
  (4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6);


CREATE TABLE employees (
  employee_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  role_id INTEGER NOT NULL,
  status TEXT NOT NULL,
  hire_date TEXT NOT NULL,
  termination_date TEXT,
  FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE user_access (
  employee_id INTEGER NOT NULL,
  permission_id INTEGER NOT NULL,
  PRIMARY KEY (employee_id, permission_id),
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
  FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)
);

INSERT INTO employees (employee_id, first_name, last_name, role_id, status, hire_date, termination_date) VALUES
  (1, 'Maria', 'Lopez', 4, 'Active', '2019-02-04', NULL),
  (2, 'James', 'Carter', 1, 'Active', '2022-06-13', NULL),
  (3, 'Priya', 'Shah', 2, 'Active', '2021-09-20', NULL),
  (4, 'Devon', 'Brooks', 3, 'Active', '2023-01-09', NULL),
  (5, 'Tasha', 'Green', 1, 'Terminated', '2020-03-16', '2024-08-30'),
  (6, 'Marcus', 'Reed', 2, 'Terminated', '2018-11-05', '2025-02-14'),
  (7, 'Elena', 'Ruiz', 3, 'Active', '2024-04-22', NULL),
  (8, 'Chris', 'Nolan', 1, 'Active', '2025-05-12', NULL);

INSERT INTO user_access (employee_id, permission_id) VALUES
  (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6),
  (2, 1), (2, 2), (2, 3),
  (3, 2), (3, 3), (3, 5),
  (4, 1), (4, 4), (4, 5),
  (5, 1), (5, 2),
  (6, 2), (6, 3), (6, 5),
  (7, 1), (7, 4),
  (8, 1), (8, 2);
