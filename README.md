The challenge consists of two parts, make sure to complete both before submitting. Good luck!

🦕 Challenge 1: You're applying for a summer internship at the National Museum of Natural History. 
The museum recently created a database containing all dinosaur records of past field campaigns. 
Your job is to dive into the fossil records to find interesting insights and advise the museum on the data quality.

1. How many different dinosaur names are present in the data?

Table contains 1042 unique dinosaur names
```SQL
SELECT
    COUNT(DISTINCT name) AS uniq_dino
FROM
    dinosaurs;
```

2. Which was the largest dinosaur? What about missing data in the dataset?

The column with the dinosaur sizes contains VARCHAR(50) data, although it would be correct if the data type was DOUBLE.
The column contains 4951 records, including 1383 records whose value is ʼnullʼ, and 0 records whose value is NULL.
To do this, I created a new column called length_m_new in which I converted all values to DOUBLE and replaced ʼnullʼ with NULL.

Displaying the description (structure) of a table in the database.
```SQL
DESC dinosaurs;
```
Creating a new column:
```SQL
ALTER TABLE dinosaurs
ADD COLUMN length_m_new DOUBLE;
```
Update the string from 'null' to NULL:
```SQL
UPDATE dinosaurs
SET length_m_new = NULL
WHERE length_m = 'null';
```
Processing strings that cannot be converted to DOUBLE:
```SQL
UPDATE dinosaurs
SET length_m_new = 0
WHERE length_m IS NULL OR NOT length_m REGEXP '^-?[0-9]+(\.[0-9]+)?$'
```
Update the remaining values:
```SQL
UPDATE dinosaurs
SET length_m_new = CAST(length_m AS DOUBLE);
```
Which was the largest dinosaur?
```SQL
SELECT
    name,
    MAX(length_m_new) AS biggest_dino
FROM 
    dinosaurs
WHERE
    length_m_new IS NOT NULL
GROUP BY
    name
ORDER BY
    biggest_dino DESC
LIMIT 1;
```

3. What dinosaur type has the most occurrences in this dataset? Create a visualization (table, bar chart, or equivalent) to display the number of dinosaurs per type. Use the AI assistant to tweak your visualization (colors, labels, title...).
4. Did dinosaurs get bigger over time? Show the relation between the dinosaur length and their age to illustrate this.
5. Use the AI assitant to create an interactive map showing each record. 
6. Any other insights you found during your analysis?
