Create database Netflix;
Use Netflix;

SELECT * FROM Netflix_data
where country = "India";

# Most common rating category:
SELECT rating, COUNT(*) AS total
FROM Netflix_data
GROUP BY rating
ORDER BY total DESC;

# total movies vs tv shows:
SELECT type, COUNT(*) AS total
FROM Netflix_data
GROUP BY type;

# Top 10 countries with most content:
SELECT country, COUNT(*) AS total_content
FROM Netflix_data
GROUP BY country
ORDER BY total_content DESC
LIMIT 10;

# Top 10 geners on netflix:
SELECT listed_in, COUNT(*) AS total
FROM Netflix_data
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;

# Year with Highest Content Release:
SELECT release_year, COUNT(*) AS total_titles
FROM Netflix_data
GROUP BY release_year
ORDER BY total_titles DESC;

# Top Directors by Number of Titles
SELECT director, COUNT(*) AS total_titles
FROM Netflix_data
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;


# Movies Added Each Year:
SELECT YEAR(STR_TO_DATE(date_added,'%M %d, %Y')) AS year_added,
COUNT(*) AS total_added
FROM Netflix_data
GROUP BY year_added
ORDER BY year_added;

# Longest Movie Duration:
SELECT title, duration
FROM Netflix_data
WHERE type='Movie'
ORDER BY CAST(SUBSTRING_INDEX(duration,' ',1) AS UNSIGNED) DESC
LIMIT 1;

# Content Count by Type and Rating:
SELECT type, rating, COUNT(*) AS total
FROM Netflix_data
GROUP BY type, rating
ORDER BY total DESC;

# Most Featured Actors:
SELECT cast, COUNT(*) AS appearances
FROM Netflix_data
WHERE cast IS NOT NULL
GROUP BY cast
ORDER BY appearances DESC
LIMIT 10;