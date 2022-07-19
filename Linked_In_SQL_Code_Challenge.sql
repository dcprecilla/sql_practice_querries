SELECT *
FROM information_schema.columns

SHOW search_path;

-- Checking the tables of the database.
Select * from public."Athletes";
Select * from public."CountryRegions";
Select * from public."CountryStats";

-- Challenge1: Extract information about post insights, ordered by most recent date
Select created_time, engaged_fans, post_clicks, reach, impressions
from "PostInsights"
Order by "created_time" DESC;

--Challenge2: Extract the top 10 countries w/ their coutry code of fans from FansPerCountry table for the lastest date
-- SUBQUERY
Select "CountryCode", "NumberOfFans" from "FansPerCountry"
Where "Date" = (Select MAX("Date") from "FansPerCountry")
Order by "NumberOfFans" DESC
LIMIT 10;

--Challenge3: Get the number of new likes per day table, no duplicate dates: GlobalPage
Select DISTINCT("date"), "new_likes" from "GlobalPage"
Order by "new_likes";

--Challenge4: Group the data by gender and determine the percentage of fans by gender, using the LATEST date
--table: FansPerGenderAge
Select * from "FansPerGenderAge";
Select "gender", SUM("number_of_fans") as "Total_per_gender",
ROUND((SUM("number_of_fans")/(Select SUM("number_of_fans") from "FansPerGenderAge"
							 WHERE "date" = (Select MAX("date") from "FansPerGenderAge"))*100),2) as "Percent_Per_Gender"
from "FansPerGenderAge"
where "date" = (Select MAX(date) from "FansPerGenderAge")
Group by gender
Order by "Percent_Per_Gender" DESC;
