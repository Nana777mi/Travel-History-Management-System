# Travel-History-Management-System

CPT103 Coursework Report
 
Database Design Details
Tables
In this section, you are required to explain all of the tables in your ER diagram. An example is given below. Please make sure you follow the template and everything is clearly explained.
Table name: district
Table design explanation: 
The district table is used to store the information of the districts in the kingdom. The primary key is district_name as it is unique for every district.
Column Definition	Domain	Explanation
district_name varchar(100)	All valid districts are acceptable.	The name of the district. 
region varchar(10)	‘west’,’east’,’south’,’north’or’central’	The region where district is located. The data cannot be checked by the database directly, so manual checking is required when entering data.

Foreign keys and reasons: 
There is no foreign key in this table.  

Table name: hospital
Table design explanation: 
The hospital table is used to store the information of the hospitals in the kingdom. The primary key is hospital_name as it is unique for every hospital. 
Column Definition	Domain	Explanation
hospital_name varchar(100)	All valid names are acceptable.	The name of the hospital. 
district varchar(100)	All valid districts are acceptable. 	The area where the hospital is located. 

Foreign keys and reasons:
The column district references district.district_name, this is to make sure that district_name are valid names that reflect existing district of the kingdom. It corresponds to the m:1 relationship in the ER diagram.


Table name: doctor
Table design explanation: 
The doctor table is used to store the information of the doctors in the hospitals. Here, an ID is added for each doctor in the Doctor table to prevent duplicate doctor names. The primary key is id as it is unique for every doctor. 
Column Definition	Domain	Explanation
id int	0-9999999	Each doctor has a unique ID number. 
doctor varchar(100)	All valid names are acceptable. 	The name of doctor who did the viral test. 
hospital varchar(100)	All valid hospitals are acceptable. 	The hospital to which the doctor belongs. 

Foreign keys and reasons:
The column hospital references hospital.hospital_name, this is to make sure that hospital_name are valid names that reflect existing hospital of the kingdom. It corresponds to the m:1 relationship in the ER diagram.

Table name: person
Table design explanation: 
The person table is used to store the information of the citizens in the kingdom. The primary key is mobile as it is unique for every citizen. 
Column Definition	Domain	Explanation
mobile varchar(20)	1 to 20 digital characters.	Every citizen has a unique mobile phone number. 
The data cannot be checked by the database directly. As a result, manual checking is required when entering data.
name varchar(50)	All valid names are acceptable.	The name of the person. 
sex varchar(10)	‘male’ or ‘female’	The sex of the person. 
age int check (age >= 0)	Positive integer. 	The age of the person. The age must not be less than 0. 

Foreign keys and reasons:
There is no foreign key in this table.  

Table name: sample
Table design explanation: 
The sample table is used to store the types of samples. The primary key is sample_type as it is unique for each type of virus. 
Column Definition	Domain	Explanation
sample_type varchar(30)	All valid sample types are acceptable.	The type of the sample. 
description varchar(255)	The value contains a maximum of 255 characters	The description of the sample. The same type of sample has the same description. 

Foreign keys and reasons:
There is no foreign key in this table.  

Table name: viral_test_result
Table design explanation: 
The viral_test_result table is used to store the information of all viral test results. The primary key is a composite primary key composed of the mobile and sample_collect_time, because a person can't be sampled twice at the same time. 

Column Definition	Domain	Explanation
hospital varchar(100)	All valid names are acceptable. 	The name of hospital that did the viral test. 
mobile  varchar(20) 	0 to 20 digital characters. 	Every citizen has a unique mobile phone number. 
sample_type varchar(30)	Type of sample 
xxx-01	Virus name and generation.
test_result char(8)	‘positive’ or ’negative’	The result of the viral test.
sample_collect_time datetime	‘YYYY-MM-DD HH:MM:SS’
‘0000-00-00 00:00:00’ to ‘9999-12-31 23:59:59’	Time of sample collection. 
doctor varchar(100)	All valid names are acceptable.	The name of doctor who did the viral test. 
sample_test_time datetime	‘YYYY-MM-DD HH:MM:SS’
‘0000-00-00 00:00:00’ to ‘9999-12-31 23:59:59’	Time of sample test. 
report_time datetime	‘YYYY-MM-DD HH:MM:SS’
‘0000-00-00 00:00:00’ to ‘9999-12-31 23:59:59’	Time of sample test report. 

Foreign keys and reasons:
The column mobile references person.mobile, this is to make sure that person.mobile are valid phone numbers. It corresponds to the m:1relationship in the ER diagram. 
The column sample_type references sample.sample_type, this is to make sure that sample_type are valid sample types that exist in the database. It corresponds to the m:1 relationship in the ER diagram.
The column hospital references hospital.hospital_name, this is to make sure that hospital_name are valid names that reflect existing hospital of the kingdom. It corresponds to the m:1 relationship in the ER diagram.


Table name: mobile_base_station
Table design explanation:
The mobile_base_station table is used to store the information of mobile base stations. The primary key is location as it is unique for every base station. 
Column Definition	Domain	Explanation
location varchar(255)	The GPS format is a string of the form (longitude, latitude). For example, (130.2331, 23.5141).	The GPS format is a string of the form (longitude, latitude). For example, (130.2331, 23.5141).
Longitude and latitude are expressed as decimals. 
The longitude ranges from -180 to 180. A positive number represents the east longitude and a negative number represents the west longitude. 
The latitude ranges from -90 to 90. A positive number represents north latitude and a negative number represents south latitude. 
district varchar(100)	All valid districts are acceptable. 	The district where the base station is located. 

Foreign keys and reasons:
The column district references district.district_name, this is to make sure that district_name are valid names that reflect existing district of the kingdom. It corresponds to the m:1 relationship in the ER diagram.


Table name: travel_history
Table design explanation: 
The travel_history table is used to keep track of citizens' journeys. The primary key is a composite primary key composed of the mobile and arrive_time. A person can only enter one area at a time because there is no overlap in base station coverage. 
Column Definition	Domain	Explanation
mobile varchar(20)	1 to 20 digital characters.	The mobile that corresponds to this history. 
district varchar(100)	All valid districts are acceptable.	The district where the person was at this time
arrive_time datetime	‘YYYY-MM-DD HH:MM:SS’
‘0000-00-00 00:00:00’ to ‘9999-12-31 23:59:59’	The time this person arrived in this district. 
leave_time datetime	‘YYYY-MM-DD HH:MM:SS’
‘0000-00-00 00:00:00’ to ‘9999-12-31 23:59:59’	The time this person left this district.

Foreign keys and reasons:
The column mobile references person.mobile, this is to make sure that person.mobile are valid phone numbers. It corresponds to the m:1 relationship in the ER diagram.
The column district references district.district_name, this is to make sure that district_name are valid names that reflect existing district of the kingdom. It corresponds to the m:1 relationship in the ER diagram.



 

Viral Test Report – Normalisation Process

 
Please write down the detailed normalisation process for the viral test report. Firstly, identify all attributes you can find in the viral test report as well as in the specifications (you need to add your own attributes if your database design has them). Then, at each normalisation stage, list all functional dependencies and normalise them to the higher normal form. 3NF is required for the final tables and must match your ER diagram.

Stage 1
Attributes:
viral_test_result{hospital, name, sex, age, mobile, sample_type, test_result, sample_collect_time, doctor, sample_test_time, report_time, sample_discription}
FDs (Indicate partial or transitive dependencies):
mobile, sample_collect_time -> hospital, name, sex, age, mobile, sample_type, test_result, sample_collect_time, doctor, sample_test_time, report_time, sample_discription 
A person can only be sampled once at a time. So the other attributes of the report can be found by the mobile and sample_collect_time of the report. 
mobile -> name, sex, age
Everyone has one and only one phone number. When we know a person's mobile phone number, we can find their name, gender and age. 
Name, sex, age partially depend on (mobile, sample_collect_time). 
sample_type -> sample_description
All samples of the same type will have the same description. 
sample_description transitively depends on (mobile, sample_collect_time). 
doctor.id -> doctor, hospital
A doctor's name and hospital fully depend on the doctor’s id. 
Each doctor has a hospital, but doctors may have the same name. There may be doctors with the same name in different hospitals. But if each doctor has an unique ID, then each doctor's ID can correspond to a unique hospital.
Hospital partially depends on (mobile, sample_collect_time). 
Normalised tables and which normal form they are currently in:
viral_test_result(1NF):
hospital	name	sex	age	mobile	sample_type

test_result	sample_collect_time	doctor	sample_test_time	report_time	sample_description



Stage 2
Attributes:
viral_test_result{hospital, mobile, sample_type, test_result, sample_collect_time, doctor, sample_test_time, report_time}
person{mobile, name, sex, age}
sample{sample_type, description}
doctor{id, doctor, hospital}
hospital{hospital_name, district}
FDs (Indicate partial or transitive dependencies):
mobile, sample_collect_time -> sample_type, test_result, hospital, doctor, sample_test_time, report_time 
A person can only be sampled once at a time. So the other attributes of the report can be found by the mobile and sample_collect_time of the report. 
mobile -> name, sex, age
Everyone has one and only one phone number. When we know a person's mobile phone number, we can find their name, gender and age. 
sample_type -> sample_description
All samples of the same type will have the same description. 
Normalised tables and which normal form they are currently in:
viral_test_result(3NF):
Mobile	sample_collect_time	sample_type	test_result	hospital	doctor	sample_test_time	report_time

person(3NF):
Mobile	name	sex	age

sample(3NF): 
sample_type	description

doctor(3NF): 
id	doctor	hospital

 
Use Cases
Remember to put all of your SQL statements into the SQL script file, including all SELECT statements and INSERT statements used to insert test data.
Important Use Cases
This section lists some very important use cases of the PMMS. Your database design is expected to satisfy all of these use cases. Keep in mind that all use cases below should be achieved with a single SELECT statement (unless specified otherwise). Do not ignore the “explanation” or “proof” parts of this section, as they constitute the majority of your marks. If the SQL keywords/functions you learned cannot achieve these tasks, you are allowed to self-study some other keywords and use them. The example below is very simple and requires a short paragraph of explanation. But your answers should be more detailed.
Use case 1: A person can potentially get infected if he was in the same district with someone. The government requires that, if someone is tested to be positive, all people in the same district as him in the past 48 hours (before the positive report is published) need to take viral tests. Assume that a person called Mark was tested to be positive at 19:30 on 09-Oct-2021. Mark’s telephone number is 233636. Please write a query that can get the phone numbers of all citizens who will potentially get infected because of him.
Your SQL statement:
 
SELECT DISTINCT
	mobile 
FROM
	(
	SELECT
		district,
		arrive_time,
		leave_time 
	FROM
		travel_history 
	WHERE
		mobile = '233636' 
		AND ((
				travel_history.arrive_time < '2021-10-09 19:30:00' AND travel_history.leave_time > '2021-10-07 19:30:00' 
				) 
		OR ( arrive_time < '2021-10-09 19:30:00' AND travel_history.leave_time IS NULL )) 
	) th1
	LEFT JOIN travel_history th2 ON th1.district = th2.district 
WHERE
	th2.leave_time > th1.arrive_time 
	AND th2.arrive_time < th1.leave_time 
	AND mobile != '233636';

Your test data and why it can prove that the SELECT statement works: 
The following travel information is added to the travel_history table. 
 
This data set contains all the travel information. Between 2021-10-07 19:30:00 and 2021-10-09 19:30:00, Mark passed through the Crown Ming Gorge (2021-10-08 11:30:00, 2021-10-09 10:30:00) and High Land (2021-10-09 10:30:00, 2021-10-10 00:30:00). The phone numbers of the people who passed through the area at the same time as Mark were 112233 and 191981. 

The result of the SELECT statement (screenshot):
 

Use case 2:  Please first clearly describe the format of GPS locations. The format must be a valid format that is used in real life. Then mimic what happens to your database when a user moves into the range of a base station and then moves out one hour later by listing all SQL statements involved in the process.
The GPS format and where did you learn it from (show the website link or the screenshot of the book):

The GPS format is a string of the form (longitude, latitude). For example, (130.2331, 23.5141).
Longitude and latitude are expressed as decimals. 
The longitude ranges from -180 to 180. A positive number represents the east longitude and a negative number represents the west longitude. 
The latitude ranges from -90 to 90. A positive number represents north latitude and a negative number represents south latitude. 

Website link: 
https://blog.csdn.net/duzm200542901104/article/details/78800398
http://lbs.amap.com/api/javascript-api/example/map/click-to-get-lnglat/
 
Your SQL statement(s) for travel record insertion: 
No SQL statements are executed when a person moves between different base stations in a district. 

When a user moves into the range of a base station: 
The following SQL statement is executed if the district he or she is in changes. 
INSERT INTO travel_history ( mobile, district, arrive_time )
VALUES
	(
		'114514',
	'A Street',
	now());

When the user moves out one hour later: 
The following SQL statement is executed if the district he or she is in changes. 
UPDATE travel_history 
SET leave_time = now() 
WHERE
	mobile = '114514' 
	AND leave_time IS NULL;

The result of the statements (screenshot): 
INSERT:  
UPDATE:  

Use case 3: The Lukewarm Kingdom wants to find out the hospitals that can do viral tests efficiently. The report generation time is calculated using (report time - sample test time). Please write a query to find out which hospital has the least average report generation time. 
Your SQL statement:
SELECT
	t1.hospital 
FROM
	(
	SELECT
		hospital,
		min( t2.time ) 
	FROM
	( SELECT hospital, avg( time_to_sec( timediff( report_time, sample_test_time ))) AS time FROM viral_test_result GROUP BY hospital ) t2 
	) t1;

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully): 
The following test result information is added to the viral_test_result table. 

 
This data set contains all the test result information. The average report generation time of A-soul hospital is 3650 seconds. The average report generation time of Fragrance hospital is 4200 seconds. The average report generation time of Holo-live hospital is 3800 seconds. A-soul hospital has the least average report generation time. 

The result of the SELECT statement (screenshot):
 
Use case 4: List the phone numbers of all citizens who did two viral tests with the time window from 2021-10-03 00:00 to 2021-10-05 00:00. The two viral tests must have a gap time of at least 24 hours (at least 24 hours apart). 
Your SQL statement:
SELECT
	t1.mobile 
FROM
	(
	SELECT
		sub2.mobile,
		sub2.sample_collect_time 
	FROM
		( SELECT mobile FROM viral_test_result WHERE sample_collect_time > '2021-10-03 00:00:00' AND sample_collect_time < '2021-10-05 00:00:00' GROUP BY mobile HAVING count( mobile ) = 2 ) sub1
		LEFT JOIN ( SELECT mobile, sample_collect_time FROM viral_test_result WHERE sample_collect_time > '2021-10-03 00:00:00' AND sample_collect_time < '2021-10-05 00:00:00' ) sub2 ON sub1.mobile = sub2.mobile 
	) t1
	LEFT JOIN (
	SELECT
		sub2.mobile,
		sub2.sample_collect_time 
	FROM
		( SELECT mobile FROM viral_test_result WHERE sample_collect_time > '2021-10-03 00:00:00' AND sample_collect_time < '2021-10-05 00:00:00' GROUP BY mobile HAVING count( mobile ) = 2 ) sub1
		LEFT JOIN ( SELECT mobile, sample_collect_time FROM viral_test_result WHERE sample_collect_time > '2021-10-03 00:00:00' AND sample_collect_time < '2021-10-05 00:00:00' ) sub2 ON sub1.mobile = sub2.mobile 
	) t2 ON t1.mobile = t2.mobile 
WHERE
	timestampdiff( DAY, t1.sample_collect_time, t2.sample_collect_time ) >= 1;

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following test result information is added to the viral_test_result table.
 
This data set contains all the test result information. Only 2 people whose phone numbers are 114514 and 334455 did the viral test exactly twice between 2021-10-03 00:00:00 and 2021-10-05 00:00:00. Only the one with the phone number 114514 were tested more than 24 hours apart. 

The result of the SELECT statement (screenshot):
 
Use case 5: List the high-risk, mid-risk and low-risk districts using one query. High-risk districts should be listed first, followed by mid-risk districts and then low-risk districts. 
Your SQL statement:
SELECT DISTINCT
	district,
	'high' AS risk_level 
FROM
	travel_history th
	LEFT JOIN (
	SELECT
		mobile,
		max( report_time ) AS report_time 
	FROM
		viral_test_result 
	WHERE
		test_result = 'positive' 
		AND timestampdiff( DAY, report_time, '2021-10-16 00:00:00' ) < 7 
	GROUP BY
		mobile 
	) rt ON th.mobile = rt.mobile 
WHERE
	(
		leave_time BETWEEN timestampadd( DAY, - 2, report_time ) 
		AND report_time 
		OR arrive_time BETWEEN timestampadd( DAY, - 2, report_time ) 
		AND report_time 
	OR ( arrive_time < timestampadd( DAY, - 2, report_time ) AND leave_time IS NULL )) 
	AND (
		timestampdiff( DAY, arrive_time, leave_time ) >= 1 
	OR ( th.leave_time IS NULL AND timestampdiff( DAY, arrive_time, rt.report_time ) >= 1 )) 
	AND th.mobile IN ( SELECT DISTINCT mobile FROM viral_test_result WHERE test_result = 'positive' AND timestampdiff( DAY, report_time, '2021-10-16 00:00:00' ) < 7 ) UNION
SELECT DISTINCT
	district,
	'mid' AS risk_level 
FROM
	travel_history th
	LEFT JOIN (
	SELECT
		mobile,
		max( report_time ) AS report_time 
	FROM
		viral_test_result 
	WHERE
		test_result = 'positive' 
		AND timestampdiff( DAY, report_time, '2021-10-16 00:00:00' ) < 7 
	GROUP BY
		mobile 
	) rt ON th.mobile = rt.mobile 
WHERE
	(
		leave_time BETWEEN timestampadd( DAY, - 2, report_time ) 
		AND report_time 
		OR arrive_time BETWEEN timestampadd( DAY, - 2, report_time ) 
		AND report_time 
	OR ( arrive_time < timestampadd( DAY, - 2, report_time ) AND leave_time IS NULL )) 
	AND th.mobile IN ( SELECT DISTINCT mobile FROM viral_test_result WHERE test_result = 'positive' AND timestampdiff( DAY, report_time, '2021-10-16 00:00:00' ) < 7 ) 
	AND district NOT IN (
	SELECT DISTINCT
		district 
	FROM
		travel_history th
		LEFT JOIN (
		SELECT
			mobile,
			max( report_time ) AS report_time 
		FROM
			viral_test_result 
		WHERE
			test_result = 'positive' 
			AND timestampdiff( DAY, report_time, '2021-10-16 00:00:00' ) < 7 
		GROUP BY
			mobile 
		) rt ON th.mobile = rt.mobile 
	WHERE
		(
			leave_time BETWEEN timestampadd( DAY, - 2, rt.report_time ) 
			AND report_time 
			OR arrive_time BETWEEN timestampadd( DAY, - 2, rt.report_time ) 
			AND report_time 
		OR ( arrive_time < timestampadd( DAY, - 2, report_time ) AND leave_time IS NULL )) 
		AND (
			timestampdiff( DAY, arrive_time, leave_time ) >= 1 
		OR ( th.leave_time IS NULL AND timestampdiff( DAY, arrive_time, rt.report_time ) >= 1 )) 
		AND th.mobile IN ( SELECT DISTINCT mobile FROM viral_test_result WHERE test_result = 'positive' AND timestampdiff( DAY, report_time, '2021-10-16 00:00:00' ) < 7 ) 
	) UNION
SELECT DISTINCT
	district_name AS district,
	'low' AS risk_level 
FROM
	district 
WHERE
	district_name NOT IN (
	SELECT DISTINCT
		district 
	FROM
		travel_history th
		LEFT JOIN (
		SELECT
			mobile,
			max( report_time ) AS report_time 
		FROM
			viral_test_result 
		WHERE
			test_result = 'positive' 
			AND timestampdiff( DAY, report_time, '2021-10-16 00:00:00' ) < 7 
		GROUP BY
			mobile 
		) rt ON th.mobile = rt.mobile 
	WHERE
		(
			leave_time BETWEEN timestampadd( DAY, - 2, report_time ) 
			AND report_time 
			OR arrive_time BETWEEN timestampadd( DAY, - 2, report_time ) 
			AND report_time 
		OR ( arrive_time < timestampadd( DAY, - 2, report_time ) AND leave_time IS NULL )) 
	AND th.mobile IN ( SELECT DISTINCT mobile FROM viral_test_result WHERE test_result = 'positive' AND timestampdiff( DAY, report_time, '2021-10-16 00:00:00' ) < 7 ) 
	);

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully): 
The following district information is added to the  district table. 
 

The following travel information is added to the travel_history table. 
 


The following test result information is added to the viral_test_result table.
 

Assume the current time is '2021-10-16 00:00:00'. To query the risk level of the current actual time, replace all '2021-10-16 00:00:00' in the code with now().
We assume that high-risk districts are those with patients passing through in the two days before the report and staying longer than 24 hours within a week.
Persons with cell phone numbers 191981 and 233636 within the week preceding '2021-10-16 00:00:00' were reported to have a positive diagnosis. In the two days prior to the report, the person with mobile phone number 191981 stayed in M Town for more than one day, and the person with mobile phone number 233636 passed through Crown Ming Gorge and High Land and stayed in Crown Ming Gorge for more than one day. Therefore, the risk level of Crown Ming Gorge and M Town is high, the risk level of High Land is mid, and the risk level of other regions is low.

The result of the SELECT statement (screenshot):
 

Use case 6: List all positive cases found in the district called “Centre Lukewarm Hillside” on 2021-10-04. The result should include the names and phone numbers of people tested to be positive.
Your SQL statement:
SELECT 
name,
	p.mobile AS mobile 
FROM
	person p
	RIGHT JOIN (
	SELECT
		distinct mobile 
	FROM
		viral_test_result 
	WHERE
		report_time >= '2021-10-04 00:00:00' 
		AND report_time < '2021-10-05 00:00:00' 
	AND test_result = 'positive' 
	AND hospital IN ( SELECT hospital_name FROM hospital WHERE district = 'Centre Lukewarm Hillside' )) m ON p.mobile = m.mobile;

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following test person information is added into the person table. 
 
The following test hospital information is added into the hospital table.
 
The following test result information is added to the viral_test_result table.
 
Centre Lukewarm Hillside hospital has the A-Soul Hospital. People found to be positive case at Centre Lukewarm Hillside Hospital on 2021-10-04 are Senpai(mobile:114514) and Rachel(mobile:191981). 

The result of the SELECT statement (screenshot):
 
Use case 7: Calculate the increase in new positive cases in the district called “Centre Lukewarm Hillside” on 2021-10-05 compared to 2021-10-04. The result should show a single number indicating the increment. If there are fewer new positive cases than yesterday, this number should be negative.
Your SQL statement:
SELECT
	cnt1 - cnt2 AS dif 
FROM
	(
	SELECT
		count( m1.mobile ) AS cnt1 
	FROM
		(
		SELECT DISTINCT
			mobile 
		FROM
			viral_test_result 
		WHERE
			report_time >= '2021-10-05 00:00:00' 
			AND report_time < '2021-10-06 00:00:00' 
			AND test_result = 'positive' 
			AND hospital IN ( SELECT hospital_name FROM hospital WHERE district = 'Centre Lukewarm Hillside' ) 
		) m1 
	) c1
	LEFT JOIN (
	SELECT
		count( m2.mobile ) AS cnt2 
	FROM
		(
		SELECT DISTINCT
			mobile 
		FROM
			viral_test_result 
		WHERE
			report_time >= '2021-10-04 00:00:00' 
			AND report_time < '2021-10-05 00:00:00' 
			AND test_result = 'positive' 
			AND hospital IN ( SELECT hospital_name FROM hospital WHERE district = 'Centre Lukewarm Hillside' ) 
		) m2 
	) c2 ON 1;

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following test hospital information is added into the hospital table.
 
The following test result information is added to the viral_test_result table.
 
The new positive case on 2021-10-05 the person whose mobile phone number1 is 334455, and the new positive cases on 2021-10-04 are those whose mobile phone numbers are 114514 and 191981. So the increase in new positive cases in Centre Lukewarm Hillside on 2021-10-05 compared to 2021-10-04 is -1.  

The result of the SELECT statement (screenshots):
 
Use case 8: Assume that the spread rate of a virus is calculated by dividing the total number of people that were in the same district as the positive case with 48 hours (calculated in use case 1) by the total number of people among them that later confirmed to be infected in 14 days. Again, assume that a person called Mark (telephone number is 233636) was tested to be positive at 19:30 on 09-Oct-2021 and he is the only person in the country that has coughid-19. Please write a query that calculates the spread rate of the virus.
Your SQL statement:
SELECT
	cnt2 / cnt1 AS spread_rate 
FROM
	(
	SELECT
		count( mobile ) AS cnt1 
	FROM
		(
		SELECT DISTINCT
			mobile 
		FROM
			(
			SELECT
				district,
				leave_time,
				arrive_time 
			FROM
				travel_history 
			WHERE
				mobile = '233636' 
				AND ((
						travel_history.arrive_time < '2021-10-09 19:30:00' AND travel_history.leave_time > '2021-10-07 19:30:00' 
						) 
				OR ( arrive_time < '2021-10-09 19:30:00' AND travel_history.leave_time IS NULL )) 
			) th1
			LEFT JOIN travel_history th2 ON th1.district = th2.district 
		WHERE
			th2.leave_time > th1.arrive_time 
		AND th2.arrive_time < th1.leave_time AND mobile != '233636' ) t ) t1 LEFT JOIN ( SELECT count( mobile ) AS cnt2 FROM viral_test_result WHERE report_time >= '2021-10-09 19:30:00' 
		AND report_time < '2021-10-23 19:30:00' 
		AND test_result = 'positive' 
		AND hospital IN (
		SELECT
			hospital_name 
		FROM
			hospital 
		WHERE
			district IN (
			SELECT
				district 
			FROM
				travel_history 
			WHERE
				mobile = '233636' 
				AND ((
						travel_history.arrive_time < '2021-10-09 19:30:00' AND travel_history.leave_time > '2021-10-07 19:30:00' 
						) 
				OR ( arrive_time < '2021-10-09 19:30:00' AND travel_history.leave_time IS NULL ))) 
	)) t2 ON 1;

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following test hospital information is added into the hospital table.
 
The following test result information is added to the viral_test_result table.
 
The following travel information is added to the travel_history table. 
 
Mark passed through Crown Ming Gorge and High Land in the 48 hours before he was found to be positive case. The mobile numbers of the people who passed through the area at the same time as Mark were 1919810 and 112233. The only new positive case in those areas over the next 14 days were in people with a mobile phone number of 191981. So the spread rate of the virus is 0.5. 
The result of the SELECT statement (screenshots):

 


Extended Use Cases
Apart from the use cases proposed in the previous section, your database could also support more scenarios. Please follow the same format in the previous section and write down your own 10 use cases. You are allowed to use keywords learned outside of the lectures. Practical use cases displaying good innovations will receive higher marks.

Use case 1: Find out which district is passed by the most. The result contains its names and the number of times it have been passed by. 
Your SQL statement: 
SELECT
	* 
FROM
	( SELECT district, count( mobile ) AS count FROM ( SELECT mobile, district FROM travel_history ) s1 GROUP BY district ) cnt 
WHERE
	count = (
	SELECT
		max( s2.count ) 
	FROM
	( ( SELECT count( mobile ) AS count FROM ( SELECT mobile, district FROM travel_history ) s1 GROUP BY district ) ) s2 
	);

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following travel information is added to the travel_history table.
 
Counting the times of all districts being passed by, we can get the following table.
 
Wind dragon ruins have been passed four times, which is the district that has been passed the most times. 

The result of the SELECT statement (screenshot):
 
Use case 2: List phone numbers of people who have been found to be positive cases twice.
Your SQL statement:
SELECT
	mobile 
FROM
	viral_test_result 
WHERE
	test_result = 'positive' 
GROUP BY
	mobile 
HAVING
	count( test_result ) = 2;

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following test result information is added to the viral_test_result table.
 
The person with the phone number 114514,233636,334455 was found to be positive once, the person with the phone number 191981 was found to be positive twice, and everyone else tested negative.
So the query result should be 191981.

The result of the SELECT statement (screenshot):
 
Use case 3: Query the phone number of the youngest person who tested positive. 
Your SQL statement: 
SELECT
	mobile 
FROM
	( SELECT DISTINCT p.mobile, age FROM viral_test_result LEFT JOIN person p ON p.mobile = viral_test_result.mobile WHERE test_result = 'positive' ) s1 
WHERE
	age = (
	SELECT
		min( age ) 
	FROM
	( SELECT DISTINCT age FROM viral_test_result LEFT JOIN person p ON p.mobile = viral_test_result.mobile WHERE test_result = 'positive' ) s2 
	);

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following person information is added into the person table. 
 
The following test result information is added to the viral_test_result table.
 
The test data set contains all the viral test results and person information. The mobile phone numbers of those who tested positive were 114514,191981,233636,334455. The youngest of them is 14. His mobile number is 191981. 

The result of the SELECT statement (screenshot):
 
Use case 4: Query the phone numbers of people who stayed at Wind dragon ruins all day on October 8.
Your SQL statement: 
SELECT
	mobile 
FROM
	travel_history 
WHERE
	arrive_time <= '2021-10-08 00:00:00' AND ( leave_time >= '2021-10-09 00:00:00' 
	OR leave_time IS NULL 
	);

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following travel information is added to the travel_history table.
 
The test data contains all the travel history information. On October 8, the person with mobile number 114514,191981,223344 stayed at Wind dragon ruins all day. So the result of the query should be 114514,191981,223344. 

The result of the SELECT statement (screenshot):
 
Use case 5: Query the district with the most positive cases. 
Your SQL statement:
SELECT
	district 
FROM
	(
	SELECT
		district,
		count( district ) AS count 
	FROM
		viral_test_result
		LEFT JOIN hospital h ON h.hospital_name = viral_test_result.hospital 
	WHERE
		test_result = 'positive' 
	GROUP BY
		district 
	) s2 
WHERE
	count = (
	SELECT
		max( count ) 
	FROM
		(
		SELECT
			district,
			count( district ) AS count 
		FROM
			viral_test_result
			LEFT JOIN hospital h ON h.hospital_name = viral_test_result.hospital 
		WHERE
			test_result = 'positive' 
		GROUP BY
			district 
		) s1 
	);

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following test hospital information is added into the hospital table.
 
The following test result information is added to the viral_test_result table.
 
The test data contains all the viral test results and hospital information. Five positive cases have been found in the kingdom, four at A-Soul Hospital and one at Holo-Live Hospital. A-soul Hospital is in Centre Lukewarm Hillside, Holo-Live Hospital is in Crown Ming Gorge. So the district with the largest number of positive cases is Centre Lukewarm Hillside, with a total of four cases.

The result of the SELECT statement (screenshot):
 
Use case 6: Query the phone numbers of positive cases found in the central region of the kingdom. 
Your SQL statement:
SELECT
	mobile 
FROM
	viral_test_result
	LEFT JOIN hospital h ON h.hospital_name = viral_test_result.hospital
	LEFT JOIN district d ON d.district_name = h.district 
WHERE
	test_result = 'positive' 
	AND region = 'central';

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following district information is added into the district table.
 
The following test hospital information is added into the hospital table.
 
The following test result information is added to the viral_test_result table.
 
The test data contains all the district and hospital information and viral test results. High Land and Centre Lukewarm Hillside belong to the Central Region. There is Fragrance Hospital in High Land and A-soul Hospital in Centre Lukewarm Hillside. The mobile phone numbers of the positive cases found in the two hospitals are 114514, 191981, 233636, 334455. So, the query result should be 114514, 191981, 233636, 334455

The result of the SELECT statement (screenshot):
 
Use case 7: List the average time for each hospital from the time of sample collection to the time of reporting. The results contain hospital names and average time spent, in descending order of average time spent.
Your SQL statement:
SELECT
	hospital,
	avg(
		time_to_sec(
		timediff( report_time, sample_collect_time ))) AS avg_time 
FROM
	viral_test_result 
GROUP BY
	Hospital
ORDER BY
avg_time desc;

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following test result information is added to the viral_test_result table.
 
The test data contains all the viral test results. We calculated that the average time from sample collection to report at a-Soul Hospital was 20,700 seconds. The average time at Fragrance Hospital was 23,100 seconds. The average time at Holo-Live Hospital was 1,400 seconds.

The result of the SELECT statement (screenshot):
 
Use case 8: Query the phone number of the first person found to be a positive case. 
Your SQL statement:
SELECT
	mobile 
FROM
	viral_test_result 
WHERE
	report_time = ( SELECT min( report_time ) FROM viral_test_result WHERE test_result = 'positive' );

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following test result information is added to the viral_test_result table.
 
The test data contains all the viral test results. The person with phone number 114514 is the first person to be found to be positive case. The report_time is '2021-10-04 16:35:00'. 

The result of the SELECT statement (screenshot):
 
Use case 9: Query district visited by the person whose mobile phone number is 114514 between '2021-10-08 15:00:00' and '2021-10-15 15:00:00'. 
Your SQL statement:
SELECT
	district 
FROM
	travel_history 
WHERE
	mobile = '114514' 
	AND arrive_time < '2021-10-15 15:00:00' AND ( leave_time > '2021-10-08 15:00:00' 
	OR leave_time IS NULL 
	);

Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following travel information is added to the travel_history table.
 
The test data contains all the travel history information. Between '2021-10-08 15:00:00' and '2021-10-15 15:00:00', the person with cell phone number 114514 visited M Town and Crown Ming Gorge.

The result of the SELECT statement (screenshot):
 

Use case 10: Query the phone number of the person who was in Wind Dragon Ruins at '2021-10-09 15:00:00'.
Your SQL statement: 
SELECT
	mobile 
FROM
	travel_history 
WHERE
	travel_history.district = 'Wind dragon ruins' 
	AND arrive_time < '2021-10-09 15:00:00' AND ( leave_time > '2021-10-09 15:00:00' 
	OR leave_time IS NULL 
	);
Your test data and why it can prove that the SELECT statement works (Important! Please explain carefully):
The following travel information is added to the travel_history table.
 
The test data contains all the travel history information. Only people with the phone number 114514 went through Wind Dragon Ruins at '2021-10-09 15:00:00'. 
The result of the SELECT statement (screenshot):
 
