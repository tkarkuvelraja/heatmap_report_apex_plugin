DROP TABLE department_master;

CREATE TABLE department_master (dept_id NUMBER PRIMARY KEY, 
                                dept_code VARCHAR2(10), 
                                dept_name VARCHAR2(240), 
                                updated_by VARCHAR2(240), 
                                updated_on TIMESTAMP);

INSERT INTO department_master VALUES (1, 'IT', 'Information Technology','Admin',LOCALTIMESTAMP);
INSERT INTO department_master VALUES (2, 'CRM', 'Customer Relationship Managemet','Admin',LOCALTIMESTAMP);
INSERT INTO department_master VALUES (3, 'SALES', 'Sales and Booking','Admin',LOCALTIMESTAMP);
INSERT INTO department_master VALUES (4, 'MKT', 'Marketing','Admin',LOCALTIMESTAMP);
INSERT INTO department_master VALUES (5, 'DESIGN', 'Technical Design','Admin',LOCALTIMESTAMP);
INSERT INTO department_master VALUES (6, 'LEGAL', 'Case Management System','Admin',LOCALTIMESTAMP);
INSERT INTO department_master VALUES (7, 'FIN', 'Finance','Admin',LOCALTIMESTAMP);
INSERT INTO department_master VALUES (8, 'SCM', 'Procurment Management','Admin',LOCALTIMESTAMP);
INSERT INTO department_master VALUES (9, 'HR', 'Human Resources','Admin',LOCALTIMESTAMP);
INSERT INTO department_master VALUES (10, 'ADMIN', 'Administration','Admin',LOCALTIMESTAMP);

COMMIT;

--------------------------------------------------------------------------------------------------

DROP TABLE dept_tasks;

CREATE TABLE dept_tasks (task_id NUMBER  PRIMARY KEY, 
                         task_name VARCHAR2(240), 
                         dept_id NUMBER, 
                         updated_by VARCHAR2(240), 
                         updated_on TIMESTAMP,
                  CONSTRAINT fxgn_dept_tasks_fk
                      FOREIGN KEY (dept_id)
                      REFERENCES department_master(dept_id));

-- Polulate task details for the department IT
INSERT INTO dept_tasks VALUES (1, 'Task A', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (2, 'Task B', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (3, 'Task C', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (4, 'Task D', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (5, 'Task E', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (6, 'Task F', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (7, 'Task G', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (8, 'Task H', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (9, 'Task I', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (10, 'Task J', 1,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (11, 'Task K', 1,'Admin',LOCALTIMESTAMP);

-- Polulate task details for the department CRM
INSERT INTO dept_tasks VALUES (11, 'Task A', 2,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (12, 'Task B', 2,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (13, 'Task C', 2,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (14, 'Task D', 2,'Admin',LOCALTIMESTAMP);

-- Polulate task details for the department SALES
INSERT INTO dept_tasks VALUES (15, 'Task A', 3,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (16, 'Task B', 3,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (17, 'Task C', 3,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (18, 'Task D', 3,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (19, 'Task E', 3,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (20, 'Task F', 3,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (21, 'Task G', 3,'Admin',LOCALTIMESTAMP);


-- Polulate task details for the department MARKETING
INSERT INTO dept_tasks VALUES (22, 'Task A', 4,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (23, 'Task B', 4,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (24, 'Task C', 4,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (25, 'Task D', 4,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (26, 'Task E', 4,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (27, 'Task F', 4,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (28, 'Task G', 4,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (29, 'Task H', 4,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (30, 'Task I', 4,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (31, 'Task J', 4,'Admin',LOCALTIMESTAMP);

-- Polulate task details for the department DESIGN
INSERT INTO dept_tasks VALUES (32, 'Task A', 5,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (33, 'Task B', 5,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (34, 'Task C', 5,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (35, 'Task D', 5,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (36, 'Task E', 5,'Admin',LOCALTIMESTAMP);

-- Polulate task details for the department LEGAL
INSERT INTO dept_tasks VALUES (37, 'Task A', 6,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (38, 'Task B', 6,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (39, 'Task C', 6,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (40, 'Task D', 6,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (41, 'Task E', 6,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (42, 'Task F', 6,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (43, 'Task G', 6,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (44, 'Task H', 6,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (45, 'Task I', 6,'Admin',LOCALTIMESTAMP);

-- Polulate task details for the department FINANCE
INSERT INTO dept_tasks VALUES (46, 'Task A', 7,'Admin',LOCALTIMESTAMP);

-- Polulate task details for the department SCM
INSERT INTO dept_tasks VALUES (47, 'Task A', 8,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (48, 'Task B', 8,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (49, 'Task C', 8,'Admin',LOCALTIMESTAMP);

-- Polulate task details for the department HR
INSERT INTO dept_tasks VALUES (50, 'Task A', 9,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (51, 'Task B', 9,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (52, 'Task C', 9,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (53, 'Task D', 9,'Admin',LOCALTIMESTAMP);

-- Polulate task details for the department ADMIN
INSERT INTO dept_tasks VALUES (54, 'Task A', 10,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (55, 'Task B', 10,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (56, 'Task C', 10,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (57, 'Task D', 10,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (58, 'Task E', 10,'Admin',LOCALTIMESTAMP);
INSERT INTO dept_tasks VALUES (59, 'Task F', 10,'Admin',LOCALTIMESTAMP);

COMMIT;

-------------------------------------------------------------------------------------

WITH final_data AS
  (SELECT dt.dept_id,
    count(*) total_tasks
  FROM dept_tasks dt
  GROUP BY dt.dept_id
  )
SELECT dept.dept_id heat_map_id, -- Primary key of the Table
       dept.dept_name heatmap_tootltip,
       apex_string.get_initials(dept.dept_code,6) heatmap_label, -- Initials
       apex_util.prepare_url ('f?p='||:app_id||':1:'||:app_session||':::1:P1_ID:'||1) heatmap_link,
       fd.total_tasks heatmap_value -- Note: It must be a number field
  FROM department_master dept,
       final_data fd
 WHERE 1          = 1
   AND dept.dept_id = fd.dept_id
 ORDER BY fd.total_tasks DESC;
