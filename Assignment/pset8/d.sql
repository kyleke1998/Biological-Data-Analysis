













WITH t1 AS(SELECT Follow_up.Follow_up_Center, Recipient.organ, count(Recipient.organ) as organ_count
FROM Follow_up
LEFT JOIN Recipient
ON Follow_up.Recipient_ID = Recipient.Recipient_ID
GROUP BY Follow_up.Follow_up_Center, Recipient.organ)

select Follow_up_Center, organ, organ_count/ cast(sum(organ_count) over (partition by Follow_up_Center) as float) from t1

LAG(champion,1) over (order by Year ASC) AS Last_Champion

sum(case when paying_customer = 'yes' then downloads else 0 end ) as paying_downloads,
sum(case when paying_customer = 'no' then downloads else 0 end ) as non_pa

WITH cte AS (
    SELECT user_id,
    DATE(timestamp) AS d,
    MAX(CASE WHEN action = 'page_load' THEN timestamp ELSE NULL END) AS last_page_load,
    MIN(CASE WHEN action = 'page_exit' THEN timestamp ELSE NULL END) AS first_page_exit
    FROM facebook_web_log
    GROUP BY user_id, d