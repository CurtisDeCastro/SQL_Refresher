DROP TABLE IF EXISTS employee;

CREATE TABLE employee(
  name VARCHAR(60),
  position VARCHAR(60),
  salary BIGINT
);

INSERT INTO employee(name, position, salary)
  VALUES('Ariel', 'Account Executive', 120000);
INSERT INTO employee(name, position, salary)
  VALUES('Quinn', 'Systems Architect', 140000);
INSERT INTO employee(name, position, salary)
  VALUES('Morgan', 'Sales Engineer', 110000);
INSERT INTO employee(name, position, salary)
  VALUES('Alex', 'QA Engineer', 90000);

SELECT *
FROM employee
WHERE salary = (
  SELECT MAX(salary)
  FROM employee
);