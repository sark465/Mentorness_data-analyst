SELECT`* FROM corona.`hotel aggregator`;
use corona;
show tables;
-- Geographical Insights:
-- Query to get the distribution of listings by neighborhood
SELECT neighbourhood, COUNT(*) AS listing_count
FROM `hotel aggregator`
GROUP BY neighbourhood;
-- Query to get the geographical concentration of listings and host locations
SELECT neighbourhood, latitude, longitude, COUNT(*) AS listing_count
FROM `hotel aggregator`
GROUP BY neighbourhood, latitude, longitude;
-- Pricing and Availability Analysis:
-- Query to analyze pricing trends based on property types, room types, and accommodation capacity
SELECT property_type, room_type, AVG(price) AS avg_price
FROM `hotel aggregator`
GROUP BY property_type, room_type;
-- Query to investigate the availability of listings over time
SELECT calendar_last_scraped, COUNT(*) AS listing_count
FROM `hotel aggregator`
GROUP BY calendar_last_scraped;
-- Host Performance:
-- Query to evaluate host characteristics
SELECT host_id, host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost
FROM `hotel aggregator`
GROUP BY host_id, host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost;
-- Query to explore correlations between host attributes and listing performance
SELECT host_is_superhost, AVG(review_scores_rating) AS avg_rating
FROM `hotel aggregator`
GROUP BY host_is_superhost;
-- Review Scores and Guest Satisfaction:
-- Query to examine review scores and their impact on overall listing performance
SELECT review_scores_rating, COUNT(*) AS rating_count
FROM `hotel aggregator`
GROUP BY review_scores_rating;
-- Query to identify areas for improvement based on specific review categories
SELECT review_scores_accuracy, review_scores_cleanliness, review_scores_checkin, review_scores_communication, review_scores_location, review_scores_value
FROM `hotel aggregator`;
-- Property Type and Room Analysis:
-- Query to analyze the distribution of property types and room types
SELECT property_type, COUNT(*) AS property_count
FROM `hotel aggregator`
GROUP BY property_type;
-- Query to explore trends in the popularity of specific accommodation setups
SELECT room_type, COUNT(*) AS room_count
FROM `hotel aggregator`
GROUP BY room_type;
-- Factors Influencing Guest Satisfaction:
-- Query to analyze factors influencing guest satisfaction
SELECT host_is_superhost, AVG(review_scores_rating) AS avg_rating,
       AVG(review_scores_accuracy) AS avg_accuracy,
       AVG(review_scores_cleanliness) AS avg_cleanliness,
       AVG(review_scores_checkin) AS avg_checkin,
       AVG(review_scores_communication) AS avg_communication,
       AVG(review_scores_location) AS avg_location,
       AVG(review_scores_value) AS avg_value
FROM `hotel aggregator`
GROUP BY host_is_superhost;
-- Availability Patterns:
-- Query to investigate the availability of listings over time
SELECT calendar_last_scraped, COUNT(*) AS listing_count
FROM `hotel aggregator`
GROUP BY calendar_last_scraped;