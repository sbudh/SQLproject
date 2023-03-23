--1. Profile the data by finding the total number of records for each of the tables below:
Select count(*) from business;
select count(*) from hours;
select count(*) from checkin;
select count(*) from photo;
select count(*) from tip;
select count(*) from review;
select count(*) from attribute;
select count(*) from category;
select count(*) from elite_years;
select count(*) from friend;
select count(*) from user;
--all have 10000 records

--2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.
select count(distinct id), count(distinct business_id) from business;
select count(distinct business_id) from hours;
select count(distinct business_id) from checkin;
select count(distinct id),count(distinct business_id) from photo;
select count(distinct user_id), count(distinct business_id) from tip;
select count(distinct id),count(distinct business_id), count (distinct user_id) from review;
select count(distinct business_id) from attribute;
select count(distinct business_id) from category;
select count(distinct user_id) from elite_years;
select count(distinct user_id), count(distinct friend_id) from friend;
select count(distinct id) from user;

--i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000
vi. Checkin = 493
vii. Photo = 10000
viii. Tip = 537
ix. User = 10000 
x. Friend = 11, 9415
xi. Elite_years = 2780

--3. Are there any columns with null values in the Users table? Indicate "yes," or "no."
Select * from users
where id IS NULL;

select id
, name, review_count, yelping_since, useful, funny, cool, fans, average_stars
, compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos

from user
where id = NULL or name = NULL or review_count = NULL or yelping_since = NULL or useful = NULL or funny = NULL or cool = NULL or fans= NULL or average_stars= NULL or compliment_hot= NULL or compliment_more= NULL or compliment_profile= NULL or compliment_cute= NULL or compliment_list= NULL or compliment_note= NULL or compliment_plain = NULL or compliment_cool= NULL or compliment_funny= NULL or compliment_writer= NULL or compliment_photos= NULL;
--zero rows


--4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:
select max(Stars), min(Stars), avg(Stars) from review;
select max(Stars), min(Stars), avg(Stars) from Business;
select max(Likes), min(Likes), avg(Likes) from tip;
select max(count), min(count), avg(count) from Checkin;
select max(review_count), min(review_count), avg(review_count) from User;

--i. Table: Review, Column: Stars
	
		min: 1		max:	5	avg: 3.7082
		
--ii. Table: Business, Column: Stars
	
	min: 1		max:5		avg: 3.6549
		
--iii. Table: Tip, Column: Likes
	
	min:0		max:2		avg:0.0144
		
--iv. Table: Checkin, Column: Count
	
	min:1		max:53		avg:1.9414
		
	
--v. Table: User, Column: Review_count
	
		min:0		max:	2000	avg:24.2995

--5. List the cities with the most reviews in descending order:
select city, sum(review_count) from business
group by city
order by sum(review_count) desc;
--the city with the highest number of reviews is Las Vegas with 82854

--6. Find the distribution of star ratings to the business in the following cities:
select stars, review_count from business 
where city = "Avon"
group by stars;

 name                                          | city | stars | review_count |
+-----------------------------------------------+------+-------+--------------+
| Portrait Innovations                          | Avon |   1.5 |           10 |
| Helen & Kal's                                 | Avon |   2.5 |            3 |
| Mr. Handyman of Cleveland's Northwest Suburbs | Avon |   2.5 |            3 |
| Light Salon & Spa                             | Avon |   3.5 |            7 |
| Winking Lizard Tavern                         | Avon |   3.5 |           31 |
| Mulligans Pub and Grill                       | Avon |   3.5 |           50 |
| Marc's                                        | Avon |   4.0 |            4 |
| Cambria hotel & suites Avon - Cleveland       | Avon |   4.0 |           17 |
| Dervish Mediterranean & Turkish Grill         | Avon |   4.5 |           31 |
| Hoban Pest Control                            | Avon |   5.0 |            3 |
+-----------------------------------------------+------+-------+--------------+

select city, stars,review_count from business
where city = "Beachwood"
group by stars;

name                            | city      | stars | review_count |
+---------------------------------+-----------+-------+--------------+
| Charley's Grilled Subs          | Beachwood |   3.0 |            3 |
| Origins                         | Beachwood |   4.5 |            3 |
| Lucky Brand Jeans               | Beachwood |   3.5 |            3 |
| American Eagle Outfitters       | Beachwood |   3.5 |            3 |
| Avis Rent A Car                 | Beachwood |   2.5 |            3 |
| Cleveland Acupuncture           | Beachwood |   5.0 |            3 |
| Fyodor Bridal Atelier           | Beachwood |   5.0 |            4 |
| Studio Mz                       | Beachwood |   5.0 |            4 |
| Beechmont Country Club          | Beachwood |   5.0 |            6 |
| Shaker Women's Wellness         | Beachwood |   5.0 |            6 |
| Maltz Museum of Jewish Heritage | Beachwood |   3.0 |            8 |
| College Planning Network        | Beachwood |   2.0 |            8 |
| Sixth & Pine                    | Beachwood |   4.5 |           14 |
| Hyde Park Prime Steakhouse      | Beachwood |   4.0 |           69 

--7. Find the top 3 users based on their total number of reviews:
select id, name, review_count from users
order by review_count desc;
------------------------+-----------+--------------+
| id                     | name      | review_count |
+------------------------+-----------+--------------+
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |         2000 |
| -3s52C4zL_DHRK0ULG6qtg | Sara      |         1629 |
| -8lbUNlXVSoXqaRRiHiSNg | Yuri      |         1339 
 
--8. Does posing more reviews correlate with more fans?
SELECT id, review_count, fans from user
order by review_count desc;
+------------------------+--------------+------+
| id                     | review_count | fans |
+------------------------+--------------+------+
| -G7Zkl1wIWBBmD0KRy_sCw |         2000 |  253 |
| -3s52C4zL_DHRK0ULG6qtg |         1629 |   50 |
| -8lbUNlXVSoXqaRRiHiSNg |         1339 |   76 |
| -K2Tcgh2EKX6e6HqqIrBIQ |         1246 |  101 |
| -FZBTkAZEXoP7CYvRV2ZwQ |         1215 |  126 |
| --2vR0DIsmQ6WfcSzKWigw |         1153 |  311 |
| -gokwePdbXjfS0iF7NsUGA |         1116 |   16 |
| -DFCC64NXgqrxlO8aLU5rg |         1039 |  104 |
| -8EnCioUmDygAbsYZmTeRQ |          968 |  497 |
| -0IiMAZI2SsQ7VmyzJjokQ |          930 |  173 |
| -fUARDNuXAfrOn4WLSZLgA |          904 |   38 |
| -hKniZN2OdshWLHYuj21jQ |          864 |   43 |
| -9da1xk7zgnnfO1uTVYGkA |          862 |  124 |
| -B-QEUESGWHPE_889WJaeg |          861 |  115 |
| -kLVfaJytOJY2-QdQoCcNQ |          842 |   85 |
| -kO6984fXByyZm3_6z2JYg |          836 |   37 |
| -lh59ko3dxChBSZ9U7LfUw |          834 |  120 |
| -g3XIcCb2b-BD0QBCcq2Sw |          813 |  159 |
| -l9giG8TSDBG1jnUBUXp5w |          775 |   61 |
| -dw8f7FLaUmWR7bfJ_Yf0w |          754 |   78 |
| -AaBjWJYiQxXkCMDlXfPGw |          702 |   35 |
| -jt1ACMiZljnBFvS6RRvnA |          696 |   10 |
| -IgKkE8JvYNWeGu8ze4P8Q |          694 |  101 |
| -hxUwfo3cMnLTv-CAaP69A |          676 |   25 |
| -H6cTbVxeIRYR-atxdielQ |          675 |   45 |
+------------------------+--------------+------+
(Output limit exceeded, 25 of 10000 total rows shown)
--No, posing more reviews is not correlate with the fans as the id with the most fans have less review than the id with less fans having more reviews.

--9. Are there more reviews with the word "love" or with the word "hate" in them?
select count(*) from review
where text like "%love%";
----------+
| count(*) |
+----------+
|     1780 |
+----------+

select count(*) from review
where text like "%hate%";
+----------+
| count(*) |
+----------+
|      232 |
+----------+
--their are more reviews with the word love than the hate

--10. Find the top 10 users with the most fans:
select id, distinct name, fans from user
order by fans desc;
id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |


--part2
--1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

--i. Do the two groups you chose to analyze have a different distribution of hours?
--yes, they do have different distribution of hours, the most of the 4 and 5 stars rating have saturday hours and 2 and 3 stars come from saturday and monday.


select name, city, c.category, stars, hours, review_count, postal_code from business b,category c, hours h 
where b.id = c.business_id and c.business_id = h.business_id
and stars between 2 and 3 and city = "Toronto" and category = "Restaurants"
group by stars;

+---------------+---------+-------------+-------+----------------------+--------------+-------------+
| name          | city    | category    | stars | hours                | review_count | postal_code |
+---------------+---------+-------------+-------+----------------------+--------------+-------------+
| 99 Cent Sushi | Toronto | Restaurants |   2.0 | Saturday|11:00-23:00 |            5 | M5B 2E5     |
| Pizzaiolo     | Toronto | Restaurants |   3.0 | Saturday|10:00-4:00  |           34 | M5H 1X6     |
+---------------+---------+-------------+-------+----------------------+--------------+-------------+

select name, city, c.category, stars, hours, review_count, postal_code from business b,category c, hours h 
where b.id = c.business_id and c.business_id = h.business_id
and stars between 4 and 5 and city = "Toronto" and category = "Restaurants"
group by stars;

+-------------+---------+-------------+-------+----------------------+--------------+-------------+
| name        | city    | category    | stars | hours                | review_count | postal_code |
+-------------+---------+-------------+-------+----------------------+--------------+-------------+
| Edulis      | Toronto | Restaurants |   4.0 | Saturday|18:00-23:00 |           89 | M5V         |
| Sushi Osaka | Toronto | Restaurants |   4.5 | Saturday|11:00-23:00 |            8 | M9A 1C2     |
+-------------+---------+-------------+-------+----------------------+--------------+-------------+

--ii. Do the two groups you chose to analyze have a different number of reviews?   
yes they do have different number of reviews.  
--iii. Are you able to infer anything from the location data provided between these two groups? Explain.
yes, the review and stars of the restaurants depends on the area of the city ie.e., postal_code.

--2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.

select name, is_open, review_count, stars, category from business b, category c
where b.id = c.business_id
group by is_open;

select name, is_open, sum(review_count), avg(stars), category from business b, category c
where b.id = c.business_id
group by is_open;

+-------------+---------+-------------------+---------------+-------------+
| name        | is_open | sum(review_count) |    avg(stars) | category    |
+-------------+---------+-------------------+---------------+-------------+
| Hibachi-San |       0 |              4503 | 3.66393442623 | Japanese    |
| Edulis      |       1 |             32527 | 3.89982578397 | Restaurants |
+-------------+---------+-------------------+---------------+-------------+
 Difference:
 a) the business which is open have higher review than the closed one.
 b) the open business have higher ratings than the closed one i.e., business with low ratings are closed.
 c) There are more open restaurants than the closed one.
 
 
 
 
 --3.3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
i. Indicate the type of analysis you chose to do:
-- I want to know how the words on text or comment affect the ratings of the business.

ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:             
-- I choose the review, tips table to correlate the stars, likes and the text on the review. The rating of the business depends mainly upon the types of comment on the text if its positive than the stars is higher.    
           
iii. Output of your finished dataset:

select t.likes, stars, r.text
from review r, tip t on r.user_id = t.user_id
where r.text like "%love%"
order by t.likes desc;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+-------+-------+
| likes | stars |
+-------+-------+
|     2 |     5 |
|     1 |     5 |
|     1 |     5 |
|     1 |     5 |
|     1 |     5 |
|     1 |     5 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |
|     0 |     3 |

