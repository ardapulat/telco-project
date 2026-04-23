-- TARIFFS
-- This table stores tariff information.
-- I added fee and limit columns for package details.
-- PRIMARY KEY is used to keep each tariff unique.
CREATE TABLE TARIFFS (
    TARIFF_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    MONTHLY_FEE NUMBER(10,2) NOT NULL,
    DATA_LIMIT NUMBER,
    MINUTE_LIMIT NUMBER,
    SMS_LIMIT NUMBER
);

--------------------------------------------------

-- CUSTOMERS 
-- This table stores customer information.
-- I connected each customer to a tariff with TARIFF_ID.
-- FOREIGN KEY keeps relation between customers and tariffs.
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    CITY VARCHAR2(100),
    SIGNUP_DATE DATE,
    TARIFF_ID NUMBER NOT NULL,

    CONSTRAINT fk_tariff
    FOREIGN KEY (TARIFF_ID)
    REFERENCES TARIFFS(TARIFF_ID)
);

--------------------------------------------------

-- MONTHLY_STATS
-- This table stores monthly usage and payment data.
-- I used usage columns for internet, minute and sms values.
-- CHECK constraint limits PAYMENT_STATUS to valid values.
CREATE TABLE MONTHLY_STATS (
    ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER NOT NULL,
    DATA_USAGE NUMBER(10,2),
    MINUTE_USAGE NUMBER,
    SMS_USAGE NUMBER,
    PAYMENT_STATUS VARCHAR2(20),

    CONSTRAINT chk_payment_status
    CHECK (PAYMENT_STATUS IN ('PAID', 'UNPAID', 'LATE'))
);