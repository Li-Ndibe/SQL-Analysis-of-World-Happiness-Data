/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [WorldHappinessData].[dbo].[WorldHappiness]
  --OVERVIEW OF THE DATASET

--To seea column of the data
  SELECT Economy_GDP
  FROM WorldHappiness;

 ---To see top five of a column
  SELECT TOP (5) Happiness_Score,
  Country
  FROM WorldHappiness; 
  --SWITZERLAND SCORE HIGHEST, FOLLOWED BY ICELAND, DENMARK, NORWAY AND CANADA

--selction of 3 columns 
 SELECT Country,
		 Generosity,
		 Year
FROM  WorldHappiness;

--To see Health_LifeExpectancy values for Canada 
SELECT Health_LifeExpectancy,
			Year,
			Country
FROM WorldHappiness 
WHERE Country = 'Canada';
--THIS SHOW CANADA'S ENTIRE Health_LifeExpectancy FOR THE YEARS UNDER REVIEW. IN THE YEAR 2015, LIFE EXPECTANCY WAS 0.90563 WHILE 0.783 WAS THE LOWEST IN 2022

--happiness score for selected 3 regions
SELECT Region,Happiness_Score,Year
FROM WorldHappiness
WHERE Region IN ('Eastern Asia','Western Europe','Sub-Saharan Africa');
 
---countries that happiness scores are between 5.5 to 7.5
 SELECT Country, Happiness_Score,Economy_GDP 
 FROM WorldHappiness
 WHERE Happiness_Score BETWEEN 5.5 AND 7.5

 ---to see how many countries in the data ()
 select distinct Country 
From dbo.WorldHappiness
--THERE ARE 194 COUNTRIES IN ALL

--to see how many regions under review
select distinct Region
From dbo.WorldHappiness
--THERE ARE 17 REGIONS IN ALL

--to change the variable names
--select Happiness Score as [Happiness_Score]
--from WorldHappiness

--to see the first few rows
select top(2)* 
from WorldHappiness
--SWITZERLAND AND ICELAND ARE THE TOP 2 HAPPINESS SCORE AND IT WAS IN WAS IN 2015

--all information for countries in the Middle East and Northern Africa regions
select * 
from WorldHappiness where Region = 'Middle East and Northern Africa'

---all data for North american regions
select * 
from WorldHappiness where Region = 'North America'
--ONLY 2 COUNTRIES FALL UNDER THIE CATEGORY WHICH ARE CANADA AND USA


/*to see the regions not equal (<> or !=) to western europe*/
select * 
from WorldHappiness where Region <> 'Western Europe'
select * 
from WorldHappiness where Region != 'Western Europe'

--or statement
select * 
from WorldHappiness
where Region = 'Western Europe' or Region = 'Eastern Asia' or Region = 'Southern Asia'

--or
select * 
from WorldHappiness
where Region IN('Western Europe','Eastern Asia','Southern Asia')

--not in statement
select * 
from WorldHappiness
where Region NOT IN('Western Europe','Eastern Asia','Southern Asia')

--selection for Germany and Belgium
select * 
from WorldHappiness
where Region = 'Western Europe' AND Country = 'Belgium'
or Country ='Germany'

--same as
select * 
from WorldHappiness
where Region = 'Western Europe' AND (Country = 'Belgium'
or Country ='Germany')

--countries with alphabet starting from N
select * 
from WorldHappiness
where Country Not Like 'N%' --N not inclusive

---countries starting with only N
select * 
from WorldHappiness
where Country Like 'N%' --N only

--to change the datatype to int
--ALTER TABLE dbo.WorldHappiness
--ALTER COLUMN Happiness_Rank int

-- COUNTRIES RANKING BETWEEN 130 AND 150 IN ECONOMY(GDP) I.E RANKING THE least 20 ALL YEAR
SELECT Country,
	   Happiness_Rank,
	   Economy_GDP,
	   Year 
 FROM WorldHappiness
 WHERE Happiness_Rank BETWEEN 130 AND 150


 -- COUNTRIES RANKING BETWEEN 1 AND 20 IN ECONOMY(GDP) I.E RANKING THE TOP MOST 20 ALL YEAR 
SELECT Country,
	   Happiness_Rank,
	   Economy_GDP,
	   Year 
 FROM WorldHappiness
 WHERE Happiness_Rank BETWEEN 1 AND 20


 -- COUNTRIES RANKING BETWEEN 130 AND 150 IN Family_SocialSupport I.E RANKING THE TOP 20 ALL YEAR
SELECT Country,
	   Happiness_Rank,
	   Family_SocialSupport,
	   Year 
 FROM WorldHappiness
 WHERE Happiness_Rank BETWEEN 130 AND 150

   -- COUNTRIES WITH hAPPINESS SCORE 7 ABOVE ALL YEAR
select * 
from WorldHappiness
where Happiness_Score BETWEEN 7.0 AND 7.9

-- COUNTRIES WITH hAPPINESS SCORE LESS THN 1 ALL YEAR
select * 
from WorldHappiness
where Happiness_Score BETWEEN 2.0 AND 3.0

SELECT TOP(20) 
       Happiness_Score,
	   Country
FROM WorldHappiness;

 -- COUNTRIES in WESTERN EUROPE REGION, YEAR WITH HAPPINESS SCORE less THAN 20 
SELECT Country,
		Year,
		Region,
		Happiness_Rank
FROM WorldHappiness
 WHERE Happiness_Rank <= 20 AND Region = 'Western Europe';

		
-- COUNTRIES in WESTERN EUROPE REGION, YEAR WITH HAPPINESS SCORE greater THAN 70 to 102 
SELECT Country,
		Year,
		Happiness_Rank,
		Region
FROM WorldHappiness
 WHERE Happiness_Rank >= 70 AND Region = 'Western Europe';


 -- COUNTRIES in Middle East and North Africa REGION, YEAR WITH HAPPINESS SCORE less THAN 50 
SELECT Country,
		Year,
		Happiness_Rank,
		Region
FROM WorldHappiness
 WHERE Happiness_Rank <= 50 AND Region = 'Middle East and North Africa';


 -- COUNTRIES in Middle East and North Africa REGION, YEAR WITH HAPPINESS SCORE greater THAN 70 to 102 
SELECT Country,
		Year,
		Happiness_Rank,
		Region
FROM WorldHappiness
 WHERE Happiness_Rank >= 20 AND Region = 'Middle East and North Africa';

 -- COUNTRIES in North America and ANZ REGION, YEAR WITH HAPPINESS SCORE less THAN 20 and there no other country that fall above 100 
SELECT Country,
		Year,
		Happiness_Rank,
		Region
FROM WorldHappiness
 WHERE Happiness_Rank <= 20 AND Region = 'North America and ANZ';


  -- COUNTRIES in sub-SAHARAN AFRICA REGION, YEAR WITH HAPPINESS SCORE between 50 t0 100 
SELECT Country,
		Year,
		Happiness_Rank,
		Region
FROM WorldHappiness
 WHERE Happiness_Rank <= 100 AND Region = 'Sub-Saharan Africa';


  -- COUNTRIES in Middle East and Northern Africa REGION, YEAR WITH HAPPINESS SCORE < 50  
SELECT Country,
		Year,
		Happiness_Rank,
		Region
FROM WorldHappiness
 WHERE Happiness_Rank <= 50 AND Region = 'Middle East and Northern Africa';


   -- COUNTRIES in Middle East and Northern Africa REGION, YEAR WITH HAPPINESS SCORE > 130 
SELECT Country,
		Year,
		Happiness_Rank,
		Region
FROM WorldHappiness
 WHERE Happiness_Rank >= 130 AND Region = 'Middle East and Northern Africa';


 -- COUNTRIES in Asia REGIONs, YEAR WITH HAPPINESS SCORE > 130 
SELECT Country,
		Year,
		Happiness_Rank,
		Region
FROM WorldHappiness
 WHERE  Region = 'Southern Asia' or Region = 'Southeast Asia' or Region = 'East Asia' or Region = 'Eastern Asia' or Region = 'South Asia';

select * 
from WorldHappiness where Region = 'Middle East and Northern Africa'

select * 
from WorldHappiness where Region = 'North America'
