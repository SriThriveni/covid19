CREATE TABLE country (
    country_id INTEGER PRIMARY KEY AUTOINCREMENT,
    country TEXT,
    continent TEXT,
    population INTEGER
);
CREATE TABLE cases (
    case_id INTEGER PRIMARY KEY AUTOINCREMENT,
    country_id INTEGER,
    date TEXT,
    total_cases INTEGER,
    new_cases INTEGER,
    total_deaths INTEGER,
    new_deaths INTEGER,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
INSERT INTO country (country, continent, population) VALUES
('India', 'Asia', 1380000000),
('USA', 'North America', 331000000);
INSERT INTO cases (country_id, date, total_cases, new_cases, total_deaths, new_deaths) VALUES
(1, '2020-03-01', 3, 3, 0, 0),
(1, '2020-03-02', 5, 2, 0, 0),
(1, '2020-03-03', 28, 23, 0, 0),
(1, '2020-03-04', 30, 2, 1, 1),

(2, '2020-03-01', 75, 75, 1, 1),
(2, '2020-03-02', 100, 25, 3, 2),
(2, '2020-03-03', 125, 25, 4, 1),
(2, '2020-03-04', 150, 25, 5, 1);
SELECT c.country, cs.total_cases
FROM country c
JOIN cases cs ON cs.country_id = c.country_id
WHERE cs.date = (SELECT MAX(date) FROM cases WHERE country_id = c.country_id)
ORDER BY cs.total_cases DESC;

SELECT date, new_cases
FROM cases
WHERE country_id = 1
ORDER BY date;

SELECT a.date,
       a.new_cases,
       (SELECT AVG(b.new_cases)
        FROM cases b
        WHERE b.country_id = a.country_id
        AND b.date BETWEEN date(a.date, '-6 days') AND a.date
       ) AS moving_avg_7d
FROM cases a
WHERE a.country_id = 1
ORDER BY a.date;

SELECT date, new_cases
FROM cases
WHERE country_id = 1
ORDER BY new_cases DESC
LIMIT 1;

SELECT substr(date, 1, 7) AS month,
       SUM(new_cases) AS month_cases,
       SUM(new_deaths) AS month_deaths
FROM cases
WHERE country_id = 1
GROUP BY month
ORDER BY month;

SELECT c.country,
       cs.total_cases,
       c.population,
       ROUND((CAST(cs.total_cases AS REAL) / c.population) * 1000000, 2) AS cases_per_million
FROM country c
JOIN cases cs ON cs.country_id = c.country_id
WHERE cs.date = (SELECT MAX(date) FROM cases WHERE country_id = c.country_id)
ORDER BY cases_per_million DESC;

CREATE VIEW country_summary AS
SELECT 
    c.country,
    c.continent,
    c.population,
    (SELECT total_cases FROM cases WHERE country_id=c.country_id ORDER BY date DESC LIMIT 1) AS latest_cases,
    (SELECT total_deaths FROM cases WHERE country_id=c.country_id ORDER BY date DESC LIMIT 1) AS latest_deaths
FROM country c;


