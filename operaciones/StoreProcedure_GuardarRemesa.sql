USE B89_remittances;

DELIMITER //

CREATE PROCEDURE SaveRemittance (
    IN p_MerchantID INT,
    IN p_Amount DECIMAL(10, 2),
    IN p_Currency VARCHAR(10),
    IN p_SenderID INT,
    IN p_RecipientID INT,
    IN p_BankAccountID INT,
    IN p_StatusID INT
)
BEGIN
    DECLARE now TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

    INSERT INTO Remittances (MerchantID, Amount, Currency, SenderID, RecipientID, BankAccountID, StatusID)
    VALUES (p_MerchantID, p_Amount, p_Currency, p_SenderID, p_RecipientID, p_BankAccountID, p_StatusID);
END //

DELIMITER ;