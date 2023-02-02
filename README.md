For this assignment “SQL and R” I was tasked with:
1. Choosing six recent popular movies and creating a survey to rate each of these movies on a scale of 1 to 5. A minimum of 5 responses were necessary.
2. Taking the results from the survey and storing them in a SQL database
3. Loading the information from the SQL database into an R dataframe

To begin, I created a google form (https://forms.gle/p3yUkh2n4EBRFGz49), asking my friends and family how they would rate the 6 movies I selected. I set up the form so that it was required for the respondent to answer every question, however if they did not watch a movie there was an option to select “I did not watch this movie”. The responses are saved in a google sheet, there was a column for timestamp, name, and one column for each movie.

Next, I followed the tutorial in this video (https://youtu.be/dNqz9hCQozM), demonstrating how to set up an instance of MySQL in google cloud and connect it to my computer's MySQL workbench. I also had to do a couple network configuration steps for my home network. All of the steps I followed, both from the video and configuring my home network, are listed at the end of this README. 

Now that I was connected to the MySQL google cloud, I created a schema “movie_ratings” and made it my default schema. Next I opened “movie_ratings_setup_table.sql” and ran it to create the “movie_ratings” table.

In order to load the data from the google sheet to the “movie_ratings” table, I made use of a google sheet add-on called Coefficient. Once I had the add-on, I launched it and I selected “Export to”. Then I selected the MySQL connection to add. At this point Coefficient listed 3 IP addresses I needed to whitelist in the MySQL google cloud. I added these 3 IP addresses the same way as I added my computer's IP address (under connections > add a network). Then I followed the GUI Coefficient provided to finish setting up the connection and load the columns and rows that I wanted from the google sheet to the “movie_ratings” table. 

Now that my “movie_ratings” table was populated, I went back to MySQL Workbench on my computer and I ran the “movie_ratings_data_munging.sql” script. This script takes the data from the form it was in in the google sheet, where there was a column for name and a column for every movie name and transforms it so that there is a column for name, column for movie, and column for rating - with all of the “I did not watch this move” entries removed and the ratings converted to just the number rating without the description.

Lastly, to read my data into R from the database I made use of the “RMySQL” package and then performed a preliminary analysis on it - in “spring23_data607_hw2.Rmd”.

Steps for setting up google cloud and connecting to MySQL workbench
1. Set up a free google cloud account
2. Sign in at cloud.google.com
3. Go to the console
4. Go to the navigation menu and select SQL
5. Select create an instance
6. Name the instance and provide the root password - I named mine “movie-ratings”
7. Once there is a green check next to the instance, click on it.
8. Click “open cloud shell” and provide the username (root) and the password 
  a. You can now execute SQL commands through the command shell
9. Under connections, add a network, put in your IP address
  b. For my IP address I had to add my home routers IP address, not the IPv6 address that came up when googling my ip
10. Before moving to the step of connecting to the google cloud from MySQL workbench like the video does, I had to open port 3306 on my computer. I have Spectrum for internet so I downloaded the Spectrum app and under Services > Advanced Wifi Settings > Port Forwarding & IP Reservations 
  a. I selected my computer
  b. I set up external port 3306 and internal port 3306
11. Open MySQL Workbench on your local machine
12. Create a new connection
  a. Name the connection
  b. For the hostname use the IP address from google cloud provided in the overview tab under connect to this instance “public IP address”
  c. The user will be root by default
  d. Select test connection
  e. Enter root password
  f. The test should be successful
13. Select the connection in MySQL workbench and open it, you will need to provide the password again. 

