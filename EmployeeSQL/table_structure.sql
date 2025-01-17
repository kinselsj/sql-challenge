DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE dept_no;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/oUplSD
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE departments (
    Dept_no varchar(100)   NOT NULL,
    Dept_name varchar(100)   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        Dept_no
     )
);

CREATE TABLE dept_emp (
    Emp_no int   NOT NULL,
    Dept_no varchar(100)   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL
);

CREATE TABLE dept_manager (
    Dept_no varchar(100)   NOT NULL,
    Emp_no int   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        Dept_no,Emp_no,From_date
     )
);

CREATE TABLE employees (
    Emp_no int   NOT NULL,
    Birth_date date   NOT NULL,
    First_name varchar(100)   NOT NULL,
    Last_name varchar(100)   NOT NULL,
    Gender varchar(1)   NOT NULL,
    Hire_date date   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE salaries (
    Emp_no int   NOT NULL,
    Salary int   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        Emp_no,Salary,From_date
     )
);

CREATE TABLE titles (
    Emp_no int   NOT NULL,
    Title varchar   NOT NULL,
    From_date date   NOT NULL,
    To_date date   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        Emp_no,Title,From_date
     )
);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_Emp_no FOREIGN KEY(Emp_no)
REFERENCES employees (Emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_Dept_no FOREIGN KEY(Dept_no)
REFERENCES departments (Dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_Dept_no FOREIGN KEY(Dept_no)
REFERENCES departments (Dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_Emp_no FOREIGN KEY(Emp_no)
REFERENCES employees (Emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_Emp_no FOREIGN KEY(Emp_no)
REFERENCES employees (Emp_no);

ALTER TABLE titles ADD CONSTRAINT fk_titles_Emp_no FOREIGN KEY(Emp_no)
REFERENCES employees (Emp_no);
