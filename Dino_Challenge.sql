
-- Chalenge 1
/*
| occurence_no | The original occurrence number from the Paleobiology Database.
| name         | The accepted name of the dinosaur (usually the genus name, or the name of the footprint/egg fossil).
| diet         | The main diet (omnivorous, carnivorous, herbivorous).
| type         | The dinosaur type (small theropod, large theropod, sauropod, ornithopod, ceratopsian, armored dinosaur).
| length_m     | The maximum length, from head to tail, in meters.
| max_ma       | The age in which the first fossil records of the dinosaur where found, in million years.
| min_ma       | The age in which the last fossil records of the dinosaur where found, in million years.
| region       | The current region where the fossil record was found.
| lng          | The longitude where the fossil record was found.
| lat          | The latitude where the fossil record was found.
| class        | The taxonomical class of the dinosaur (Saurischia or Ornithischia).
| family       | The taxonomical family of the dinosaur (if known).
*/

/*
1. How many different dinosaur names are present in the data?
*/
-- Uniq Dino in name column

SELECT
    COUNT(DISTINCT name) AS uniq_dino
FROM
    dinosaurs;

-- 1042 Uniq dinosaurs in table

-- Missing values in name column
SELECT
    COUNT(name) AS missing_dino
FROM
    dinosaurs
WHERE
    name IS NULL 
    OR name = 'null';

/*
2. Which was the largest dinosaur? What about missing data in the dataset?
*/

-- Displaying the description (structure) of a table in the database.
DESC dinosaurs;

-- Creating a new column:
ALTER TABLE dinosaurs
ADD COLUMN length_m_new DOUBLE;

-- Update the string from 'null' to NULL:
UPDATE dinosaurs
SET length_m_new = NULL
WHERE length_m = 'null';

-- Processing strings that cannot be converted to DOUBLE:
UPDATE dinosaurs
SET length_m_new = 0
WHERE length_m IS NULL OR NOT length_m REGEXP '^-?[0-9]+(\.[0-9]+)?$';

-- Update the remaining values:
UPDATE dinosaurs
SET length_m_new = CAST(length_m AS DOUBLE);

-- Which was the largest dinosaur?
-- Supersaurus 35 meters
SELECT
    name,
    MAX(length_m_new) AS biggest_dino
FROM 
    dinosaurs
WHERE
    length_m_new IS NOT NULL
    OR length_m_new != 'null'
GROUP BY
    name
ORDER BY
    biggest_dino DESC
LIMIT 1;

/*
3. What dinosaur type has the most occurrences in this dataset? Create a visualization (table, bar chart, or equivalent) to display the number of dinosaurs per type. 
Use the AI assistant to tweak your visualization (colors, labels, title...)
*/

SELECT
    type,
    COUNT(*) AS "Number of Dinosaurs"
FROM
    dinosaurs
WHERE
    type != 'null'
GROUP BY
    type 
ORDER BY
    2 DESC;
-- type column contains 1355 missing values

/*
4. Did dinosaurs get bigger over time? Show the relation between the dinosaur length and their age to illustrate this.
*/

SELECT
    type,
    ROUND((max_ma + min_ma) / 2) AS time_interval,
    ROUND(AVG(length_m_new), 2) AS average_dinosaur_length
FROM
    dinosaurs
WHERE
    length_m_new IS NOT NULL
    AND type = 'armored dinosaur'
GROUP BY
    type, time_interval
ORDER BY
    type, time_interval;


/*
5. Use the AI assitant to create an interactive map showing each record.
*/

/*
6. Any other insights you found during your analysis?
*/



SELECT
    *
FROM
    dinosaurs
LIMIT 10;
