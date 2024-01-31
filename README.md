The challenge consists of two parts, make sure to complete both parts before submitting. Good luck!

🦕 Challenge 1: You're applying for a summer internship at the National Museum of Natural History. 
The museum recently created a database containing all dinosaur records of past field campaigns. 
Your job is to dive into the fossil records to find interesting insights and advise the museum on the data quality.

1. How many different dinosaur names are present in the data? 

- There are 1042 unique dinosaurs in the table.

2. Which was the largest dinosaur? What about missing data in the dataset?

- The column with the dinosaur sizes contains VARCHAR(50) data, although it would be correct if the data type was DOUBLE.
The column contains 4951 records, including 1383 records whose value is ʼnullʼ, and 0 records whose value is NULL.
To do this, I created a new column called length_m_new in which I converted all values to DOUBLE and replaced ʼnullʼ with NULL

3. What dinosaur type has the most occurrences in this dataset? Create a visualization (table, bar chart, or equivalent) to display the number of dinosaurs per type. Use the AI assistant to tweak your visualization (colors, labels, title...).
4. Did dinosaurs get bigger over time? Show the relation between the dinosaur length and their age to illustrate this.
5. Use the AI assistant to create an interactive map showing each record. 
6. Any other insights you found during your analysis?


🎥 Challenge 2: You have just been hired by a large movie studio to perform data analysis. 
Your manager, an executive at the company, wants to make new movies that 'recapture the magic of old Hollywood.' 
So you've decided to look at the most successful films to help generate ideas that could turn into future successful films.
