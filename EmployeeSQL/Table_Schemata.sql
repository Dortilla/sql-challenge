

CREATE TABLE "Employees" (
    "emp_no" INT PRIMARY KEY NOT NULL,
	"title_id" VARCHAR(40),
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(35)   NOT NULL,
    "last_name" VARCHAR(35)   NOT NULL,
    "gender" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
	 foreign key ("title_id") references "Titles" ("title_id")
 );

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(8) PRIMARY KEY  NOT NULL,
    "dept_name" VARCHAR(40)   NOT NULL
    
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(40) PRIMARY KEY  NOT NULL,
    "title" VARCHAR(40)   NOT NULL
);

CREATE TABLE "DeptEmp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(8)   NOT NULL,
   foreign key ("emp_no") references "Employees" ("emp_no"),
   foreign key ("dept_no") references "Departments" ("dept_no")
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
 	foreign key ("emp_no") references "Employees" ("emp_no")
);

CREATE TABLE "DeptManager" (
    "dept_no" VARCHAR(8)   NOT NULL,
    "emp_no" INT   NOT NULL,
	foreign key ("emp_no") references "Employees" ("emp_no"),
	foreign key ("dept_no") references "Departments" ("dept_no")
);


