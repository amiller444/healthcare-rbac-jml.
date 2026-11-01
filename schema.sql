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
