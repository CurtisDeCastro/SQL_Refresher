DROP TABLE IF EXISTS testData;

CREATE TABLE testData(
  date VARCHAR(24)
);

INSERT INTO testData
VALUES (
  'AB-2022-03-04_xx'
);

SELECT DATE(LEFT(RIGHT(testData.date, -3), -3))
AS "DATE"
FROM testData;