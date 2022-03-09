USE sqlRefresher;

DROP TABLE IF EXISTS projects;

CREATE TABLE projects(
  id INT,
  title CHAR(80),
  start_date DATE,
  end_date DATE,
  budget INT
);

INSERT INTO projects VALUES(1, 'Ray-Gun', '2002-04-16', '2003-08-27', 45000);
INSERT INTO projects VALUES(2, 'Lazer Tank', '2005-04-20', '2008-09-17', 1000000);
INSERT INTO projects VALUES(3, 'Invisible Drone Build', '2001-09-16', '2006-05-21', 425000);
INSERT INTO projects VALUES(4, 'Super Armor build', '2003-11-16', '2004-03-30', 7000);
INSERT INTO projects VALUES(5, '40mm Grenade Launcher', '2001-09-11', '2021-09-11', 7000);
INSERT INTO projects VALUES(6, 'Sharks With Frickin Lazer Beams On Top Of Their Heads', '2000-01-30', '2015-03-04', 1000000000);

SELECT * FROM projects;

/* 1. Please write a SQL query to return the id, title and the number of words in each project title */

SELECT id, title, (
    LENGTH(
      RTRIM(
        LTRIM(
          REPLACE(title,'  ', ' ')
        )
      )
    ) - LENGTH(
      REPLACE(
        RTRIM(
          LTRIM(
            REPLACE(title, '  ', ' ')
          )
        ), ' ', ''
      )
    ) + 1
  ) AS number_of_words
FROM projects;



/* 2. Please write a SQL query to return
the total # of projects AND
the # of projects where the project name contains the word 'build',
in a single SQL statement and without using a WHERE clause */

SELECT COUNT(id)
  AS total_project_count,
  COUNT(matches)
  AS build_keyword_count
FROM projects
  LEFT JOIN REGEXP_MATCHES(projects.title, ('(?i)(build)'), 'g')
  AS matches
  ON TRUE;



/* 3. Please write a SQL query, using mySQL’s regular expression functions, that will return all rows from projects and show 2 columns
 - title
 - title where any numeric digit is replaced with a X (use regex ). Example - ‘Design 234 Widgets’ becomes ‘Design XXX widgets' */

SELECT title, REGEXP_REPLACE(title, '[%0-9%]', 'X', 'g')
FROM projects;



/*4. This question is not related to the schema above. This tests for the ability to reference or expand a json object in SQL. Continue the statement below and replace the `select *` section with the appropriate mysql json extracting functions in order to yield the following results:

+-----------+-------------+---------+--------+----------+---------------+
| arr       | boolean_col | is_null | number | object_a | string        |
+-----------+-------------+---------+--------+----------+---------------+
| [1, 2, 3] | true        | null    | 123    | "b"      | "Hello World" |
+-----------+-------------+---------+--------+----------+---------------+
*/

WITH json_blob as (select '{
  "array": [
    1,
    2,
    3
  ],
  "boolean": true,
  "null": null,
  "number": 123,
  "object": {
    "a": "b",
    "c": "d",
    "e": "f"
  },
  "string": "Hello World"
}' as json)

select * from json_blob;