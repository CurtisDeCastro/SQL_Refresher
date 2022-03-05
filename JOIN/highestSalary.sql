DROP TABLE IF EXISTS employee;

CREATE TABLE employee(
  name VARCHAR(60),
  position VARCHAR(60),
  salary BIGINT
);

INSERT INTO employee(name, position, salary)
  VALUES('John', 'Account Executive', 120000);
INSERT INTO employee(name, position, salary)
  VALUES('Steve', 'Systems Architect', 140000);
INSERT INTO employee(name, position, salary)
  VALUES('Jane', 'Sales Engineer', 110000);
INSERT INTO employee(name, position, salary)
  VALUES('Gina', 'QA Engineer', 90000);

SELECT *
FROM employee
WHERE salary = (
  SELECT MAX(salary)
  FROM employee
);