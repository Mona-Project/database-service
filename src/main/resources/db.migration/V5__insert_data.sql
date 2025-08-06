-- Insert Teams
INSERT INTO teams (id, name)
VALUES ('00000000-0000-0000-0000-000000000001', 'Alpha Team'),
       ('00000000-0000-0000-0000-000000000002', 'Beta Team');

-- Insert Users
INSERT INTO users (id, username, email, password, role, team_id)
VALUES ('10000000-0000-0000-0000-000000000001', 'admin1', 'admin@example.com', 'admin123', 'ADMIN', null),
       ('10000000-0000-0000-0000-000000000002', 'manager1', 'manager@example.com', 'manager123', 'MANAGER',
        '00000000-0000-0000-0000-000000000001'),
       ('10000000-0000-0000-0000-000000000003', 'employee1', 'employee1@example.com', 'employee123', 'EMPLOYEE',
        '00000000-0000-0000-0000-000000000001');

-- Insert Tasks
INSERT INTO tasks (id, title, description, status, assigned_user_id, team_id, created_by)
VALUES ('20000000-0000-0000-0000-000000000001', 'Build Frontend', 'Create UI for dashboard', 'TODO',
        '10000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000001',
        '10000000-0000-0000-0000-000000000002'),
       ('20000000-0000-0000-0000-000000000002', 'Setup Backend', 'Create REST API with JWT', 'IN_PROGRESS', null,
        '00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002');

-- Insert Time Logs
INSERT INTO timelogs (id, user_id, task_id, hours_worked)
VALUES ('30000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000003',
        '20000000-0000-0000-0000-000000000001', 4),
       ('30000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000003',
        '20000000-0000-0000-0000-000000000001', 3);
