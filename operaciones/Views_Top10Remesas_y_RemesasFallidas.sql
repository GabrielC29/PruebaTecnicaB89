USE B89_remittances;

CREATE VIEW Top10RecipientsLastMonth AS
SELECT
    RecipientID,
    COUNT(*) AS RemittanceCount
FROM Remittances
WHERE CreatedAt >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH)
GROUP BY RecipientID
ORDER BY RemittanceCount DESC
LIMIT 10;

CREATE VIEW FailedRemittancesLastMonth AS
SELECT 
    m.Name AS MerchantName,
    COUNT(r.RemittanceID) AS FailedRemittanceCount
FROM Remittances r
JOIN Merchants m ON r.MerchantID = m.MerchantID
JOIN RemittanceStatus s ON r.StatusID = s.StatusID
WHERE s.StatusName = 'Failed' AND r.CreatedAt >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY m.Name;
