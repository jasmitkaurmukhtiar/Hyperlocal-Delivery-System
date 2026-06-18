
CREATE TABLE notifications (
    notificationid INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    message VARCHAR(255),
    scheduledtime TIME,
    dayofweek VARCHAR(10),
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample delivery notifications

INSERT INTO notifications (message, scheduledtime, dayofweek)
VALUES
('Running low on milk? Get it delivered in under 10 minutes!', '09:00:00', 'Monday'),

('Lunch cravings? Order now and skip the cooking!', '13:00:00', 'Tuesday'),

('It''s getting hot! Cold drinks are just a few taps away.', '15:00:00', 'Wednesday'),

('Eggs, bread, and butter running out? Restock before it''s too late!', '18:00:00', 'Thursday'),

('Friday treat unlocked! Add chocolates to your cart today.', '17:30:00', 'Friday'),

('Weekend grocery shopping made easy. Order now and relax!', '10:00:00', 'Saturday'),

('Sunday special! Enjoy free delivery on orders above ₹299.', '12:00:00', 'Sunday');

SELECT * FROM notifications;

-- Function to display today's notifications

CREATE OR REPLACE FUNCTION send_notification_today()
RETURNS TABLE(message VARCHAR)
AS $$
BEGIN
    RETURN QUERY
    SELECT n.message
    FROM notifications n
    WHERE n.dayofweek = TRIM(TO_CHAR(CURRENT_DATE, 'Day'));

    -- Uncomment to send only at scheduled time

    -- AND n.scheduledtime <= CURRENT_TIME
    -- AND n.scheduledtime >= CURRENT_TIME - INTERVAL '1 minute';

END;
$$
LANGUAGE plpgsql;

-- Execute

SELECT * FROM send_notification_today();