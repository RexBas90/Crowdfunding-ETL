-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cm.cf_id,
cm.backers_count
FROM campaign as cm
WHERE cm.outcome = 'live'
GROUP BY cm.cf_id
ORDER BY cm.cf_id DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT bk.cf_id, 
	COUNT(bk.cf_id)
FROM backers as bk
GROUP BY bk.cf_id 
ORDER BY bk.cf_id DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT co.first_name,
	co.last_name,
	co.email,
	(cm.goal - cm.pledged) AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts AS co
 JOIN campaign AS cm
	ON co.contact_id = cm.contact_id
WHERE  cm.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC

-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT bk.email,
	bk.first_name,
	bk.last_name,
	bk.cf_id,
	cm.company_name, 
	cm.description,
	cm.end_date,
	(cm.goal - cm.pledged) AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers AS bk
 JOIN campaign AS cm
	ON bk.cf_id = cm.cf_id
WHERE  cm.outcome = 'live'
ORDER BY bk.last_name


-- Check the table


