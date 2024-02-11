

INSERT INTO customer (name, email, mobile_number, pwd, role, create_dt)
VALUES ('Happy', 'happy@example.com', '9876548337', '$2y$12$oRRbkNfwuR8ug4MlzH5FOeui.//1mkd.RsOAJMbykTSupVy.x/vb2', 'admin', CURRENT_DATE);


INSERT INTO accounts (customer_id, account_type, branch_address, create_dt)
VALUES (1, 'Savings', '123 Main Street, New York', CURRENT_DATE);



INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES 
    ('11111111-1111-1111-1111-111111111111', 1, 1, CURRENT_DATE - INTERVAL '7 days', 'Coffee Shop', 'Withdrawal', 30, 34500, CURRENT_DATE - INTERVAL '7 days'),
    ('22222222-2222-2222-2222-222222222222', 1, 1, CURRENT_DATE - INTERVAL '6 days', 'Uber', 'Withdrawal', 100, 34400, CURRENT_DATE - INTERVAL '6 days'),
    ('33333333-3333-3333-3333-333333333333', 1, 1, CURRENT_DATE - INTERVAL '5 days', 'Self Deposit', 'Deposit', 500, 34900, CURRENT_DATE - INTERVAL '5 days'),
    ('44444444-4444-4444-4444-444444444444', 1, 1, CURRENT_DATE - INTERVAL '4 days', 'Ebay', 'Withdrawal', 600, 34300, CURRENT_DATE - INTERVAL '4 days'),
    ('55555555-5555-5555-5555-555555555555', 1, 1, CURRENT_DATE - INTERVAL '2 days', 'OnlineTransfer', 'Deposit', 700, 35000, CURRENT_DATE - INTERVAL '2 days'),
    ('66666666-6666-6666-6666-666666666666', 1, 1, CURRENT_DATE - INTERVAL '1 day', 'Amazon.com', 'Withdrawal', 100, 34900, CURRENT_DATE - INTERVAL '1 day');



INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2020-10-13', 'Home', 200000, 50000, 150000, '2020-10-13'),
       (1, '2020-06-06', 'Vehicle', 40000, 10000, 30000, '2020-06-06'),
       (1, '2018-02-14', 'Home', 50000, 10000, 40000, '2018-02-14'),
       (1, '2018-02-14', 'Personal', 10000, 3500, 6500, '2018-02-14');


INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('4565XXXX4656', 1, 'Credit', 10000, 500, 9500, CURRENT_DATE),
       ('3455XXXX8673', 1, 'Credit', 7500, 600, 6900, CURRENT_DATE),
       ('2359XXXX9346', 1, 'Credit', 20000, 4000, 16000, CURRENT_DATE);



INSERT INTO authorities (customer_id, name)
 VALUES (1, 'VIEWACCOUNT'),
        (1, 'VIEWCARDS'),
        (1, 'VIEWLOANS'),
        (1, 'VIEWBALANCE');


INSERT INTO authorities (customer_id, name)
 VALUES (1, 'ROLE_USER'),
        (1, 'ROLE_ADMIN');
