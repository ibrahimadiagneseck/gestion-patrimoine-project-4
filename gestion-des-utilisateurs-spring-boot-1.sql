DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS authorities;

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  mobile_number VARCHAR(20) NOT NULL,
  pwd VARCHAR(500) NOT NULL,
  role VARCHAR(100) NOT NULL,
  create_dt DATE DEFAULT CURRENT_DATE
);

INSERT INTO customer (name, email, mobile_number, pwd, role, create_dt)
VALUES ('Happy', 'happy@example.com', '9876548337', '$2y$12$oRRbkNfwuR8ug4MlzH5FOeui.//1mkd.RsOAJMbykTSupVy.x/vb2', 'admin', CURRENT_DATE);

CREATE TABLE accounts (
  account_number SERIAL PRIMARY KEY,
  customer_id INT NOT NULL,
  account_type VARCHAR(100) NOT NULL,
  branch_address VARCHAR(200) NOT NULL,
  create_dt DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

INSERT INTO accounts (customer_id, account_type, branch_address, create_dt)
VALUES (1, 'Savings', '123 Main Street, New York', CURRENT_DATE);

CREATE TABLE account_transactions (
  transaction_id UUID PRIMARY KEY,
  account_number INT NOT NULL,
  customer_id INT NOT NULL,
  transaction_dt DATE NOT NULL,
  transaction_summary VARCHAR(200) NOT NULL,
  transaction_type VARCHAR(100) NOT NULL,
  transaction_amt INT NOT NULL,
  closing_balance INT NOT NULL,
  create_dt DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (account_number) REFERENCES accounts (account_number) ON DELETE CASCADE,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

INSERT INTO account_transactions (transaction_id, account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES 
    ('11111111-1111-1111-1111-111111111111', 1, 1, CURRENT_DATE - INTERVAL '7 days', 'Coffee Shop', 'Withdrawal', 30, 34500, CURRENT_DATE - INTERVAL '7 days'),
    ('22222222-2222-2222-2222-222222222222', 1, 1, CURRENT_DATE - INTERVAL '6 days', 'Uber', 'Withdrawal', 100, 34400, CURRENT_DATE - INTERVAL '6 days'),
    ('33333333-3333-3333-3333-333333333333', 1, 1, CURRENT_DATE - INTERVAL '5 days', 'Self Deposit', 'Deposit', 500, 34900, CURRENT_DATE - INTERVAL '5 days'),
    ('44444444-4444-4444-4444-444444444444', 1, 1, CURRENT_DATE - INTERVAL '4 days', 'Ebay', 'Withdrawal', 600, 34300, CURRENT_DATE - INTERVAL '4 days'),
    ('55555555-5555-5555-5555-555555555555', 1, 1, CURRENT_DATE - INTERVAL '2 days', 'OnlineTransfer', 'Deposit', 700, 35000, CURRENT_DATE - INTERVAL '2 days'),
    ('66666666-6666-6666-6666-666666666666', 1, 1, CURRENT_DATE - INTERVAL '1 day', 'Amazon.com', 'Withdrawal', 100, 34900, CURRENT_DATE - INTERVAL '1 day');



CREATE TABLE loans (
  loan_number SERIAL PRIMARY KEY,
  customer_id INT NOT NULL,
  start_dt DATE NOT NULL,
  loan_type VARCHAR(100) NOT NULL,
  total_loan INT NOT NULL,
  amount_paid INT NOT NULL,
  outstanding_amount INT NOT NULL,
  create_dt DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2020-10-13', 'Home', 200000, 50000, 150000, '2020-10-13'),
       (1, '2020-06-06', 'Vehicle', 40000, 10000, 30000, '2020-06-06'),
       (1, '2018-02-14', 'Home', 50000, 10000, 40000, '2018-02-14'),
       (1, '2018-02-14', 'Personal', 10000, 3500, 6500, '2018-02-14');

CREATE TABLE cards (
  card_id SERIAL PRIMARY KEY,
  card_number VARCHAR(100) NOT NULL,
  customer_id INT NOT NULL,
  card_type VARCHAR(100) NOT NULL,
  total_limit INT NOT NULL,
  amount_used INT NOT NULL,
  available_amount INT NOT NULL,
  create_dt DATE DEFAULT CURRENT_DATE,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('4565XXXX4656', 1, 'Credit', 10000, 500, 9500, CURRENT_DATE),
       ('3455XXXX8673', 1, 'Credit', 7500, 600, 6900, CURRENT_DATE),
       ('2359XXXX9346', 1, 'Credit', 20000, 4000, 16000, CURRENT_DATE);

CREATE TABLE notice_details (
  notice_id SERIAL PRIMARY KEY,
  notice_summary VARCHAR(200) NOT NULL,
  notice_details VARCHAR(500) NOT NULL,
  notic_beg_dt DATE NOT NULL,
  notic_end_dt DATE DEFAULT NULL,
  create_dt DATE DEFAULT CURRENT_DATE,
  update_dt DATE DEFAULT NULL
);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Home Loan Interest rates reduced', 'Home loan interest rates are reduced as per the government guidelines. The updated rates will be effective immediately',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL),
       ('Net Banking Offers', 'Customers who will opt for Internet banking while opening a saving account will get a $50 Amazon voucher',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL),
       ('Mobile App Downtime', 'The mobile application of the EazyBank will be down from 2AM-5AM on 12/05/2020 due to maintenance activities',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL),
       ('E Auction notice', 'There will be an e-auction on 12/08/2020 on the Bank website for all the stubborn arrears. Interested parties can participate in the e-auction',
        CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL);

CREATE TABLE contact_messages (
  contact_id VARCHAR(50) PRIMARY KEY,
  contact_name VARCHAR(50) NOT NULL,
  contact_email VARCHAR(100) NOT NULL,
  subject VARCHAR(500) NOT NULL,
  message VARCHAR(2000) NOT NULL,
  create_dt DATE DEFAULT CURRENT_DATE
);

CREATE TABLE authorities (
  id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

INSERT INTO authorities (customer_id, name)
 VALUES (1, 'VIEWACCOUNT'),
        (1, 'VIEWCARDS'),
        (1, 'VIEWLOANS'),
        (1, 'VIEWBALANCE');

DELETE FROM authorities;

INSERT INTO authorities (customer_id, name)
 VALUES (1, 'ROLE_USER'),
        (1, 'ROLE_ADMIN');
