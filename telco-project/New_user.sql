CREATE USER arda IDENTIFIED BY arda ; -- This creates a new user named arda.
GRANT CREATE SESSION TO  arda ; -- This gives login permission to arda.
GRANT CREATE TABLE TO arda; -- This allows the new user to create tables.