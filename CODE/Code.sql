-------
SELECT *
 FROM survey
 LIMIT 10;
-------
SELECT question,
   COUNT(DISTINCT user_id) AS '# of responses'
FROM survey
GROUP BY question;
------

SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;
------
SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
LIMIT 10;
-----
WITH funnel AS (SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id)
   SELECT COUNT(*) AS ' 3 Pairs' 
   FROM funnel
   WHERE number_of_pairs LIKE '%3%' and is_purchase = 1;
--------
WITH funnel AS (SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id)
   SELECT COUNT(*) AS ' 5 Pairs' 
   FROM funnel
   WHERE number_of_pairs LIKE '%5%' and is_purchase = 1;
----------------