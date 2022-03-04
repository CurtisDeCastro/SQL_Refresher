-- Given a table with a column of text entries composed of strings with both numbers and letters, return a table with 2 columns, one representing all of the numbers in the string and another representing all of the letters
DROP TABLE IF EXISTS words;

CREATE TABLE words (
  word TEXT
);

INSERT INTO words(word)
VALUES
  ('123ABC'),
  ('12A3BC'),
  ('987DEF'),
  ('9DE87F'),
  ('AAA111'),
  ('AAAZZZ'),
  ('000111');

SELECT * FROM words;

-- https://stackoverflow.com/questions/38153062/create-a-function-to-return-a-table-sql
-- -- Transact-SQL Scalar Function Syntax
-- CREATE FUNCTION getNumbers(word TEXT)
-- RETURNS @res TEXT()
-- AS
-- BEGIN
--   DECLARE @strEnrollmentNumber0 NVARCHAR(MAX) = word;
--   DECLARE @intNumber0 INT;

--   SET @intNumber0 = PATINDEX('%[^A-Za-z]%', @strEnrollmentNumber0);

--   WHILE @intNumber0 > 0
--     BEGIN
--       SET @strEnrollmentNumber0 = STUFF(@strEnrollmentNumber0, @intNumber0, 1, '' )
--       SET @intNumber0 = PATINDEX('%[^A-Za-z]%', @strEnrollmentNumber0 )
--       SET @res = @intNumber0
--       RETURN @res;
--     END;
-- END;

-- CREATE FUNCTION getLetters(word TEXT)
-- RETURNS TEXT
--   DECLARE @strEnrollmentNumber NVARCHAR(MAX) = word;
--   DECLARE @intNumber INT

--   SET @intNumber = PATINDEX('%[^A-Za-z]%', @strEnrollmentNumber)

--   WHILE @intNumber > 0
--     BEGIN
--       SET @strEnrollmentNumber = STUFF(@strEnrollmentNumber, @intNumber, 1, '' )
--       SET @intNumber = PATINDEX('%[^A-Za-z]%', @strEnrollmentNumber )
--       RETURN @strEnrollmentNumber
--   END;

SELECT getNumbers(word), getLetters(word)
AS "Numbers", "Letters"
FROM words;
