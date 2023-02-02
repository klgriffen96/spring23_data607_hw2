# Get rid of table if it exists
DROP TABLE IF EXISTS movie_ratings;

# Create the table
CREATE TABLE movie_ratings(
    s_name char(255) primary key, 
    avatar char(255),
    inception char(255),
    rodents char(255),
    harry_potter char(255),
    top_gun_maverick char(255),
    causeway char(255)
    )
; 