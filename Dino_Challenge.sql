/*
Chalenge 1
1. How many different dinosaur names are present in the data?
2. Which was the largest dinosaur? What about missing data in the dataset?
3. What dinosaur type has the most occurrences in this dataset? Create a visualization (table, bar chart, or equivalent) to display the number of dinosaurs per type. Use the AI assistant to tweak your visualization (colors, labels, title...).
4. Did dinosaurs get bigger over time? Show the relation between the dinosaur length and their age to illustrate this.
5. Use the AI assitant to create an interactive map showing each record. 
6. Any other insights you found during your analysis?
*/

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

SELECT
    *
FROM
    dinosaurs
LIMIT 10;

-- Missing values in name column
SELECT
    COUNT(name) AS missing_dino
FROM
    dinosaurs
WHERE
    name IS NULL;

-- Uniq Dino in name column
-- (How many different dinosaur names are present in the data?)
-- 1042 Uniq dinosaurs in table

SELECT
    COUNT(DISTINCT name) AS uniq_dino
FROM
    dinosaurs;

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

DESC dinosaurs;
--------------------

/*
What dinosaur type has the most occurrences in this dataset?
Create a visualization (table, bar chart, or equivalent) to display the number of dinosaurs per type. 
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
