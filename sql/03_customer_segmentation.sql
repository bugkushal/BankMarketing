SELECT 
    job,
    COUNT(*) AS total_records,
    SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS subscribed_count,
    ROUND(SUM(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(*), 0), 2) AS subscription_rate
FROM marketing_campaign
GROUP BY job
ORDER BY subscription_rate DESC;