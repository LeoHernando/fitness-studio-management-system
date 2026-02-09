-- Ensure the 'member' table exists
CREATE TABLE IF NOT EXISTS member
(
    id                      UUID PRIMARY KEY,
    first_name              VARCHAR(255)        NOT NULL,
    last_name               VARCHAR(255)        NOT NULL,
    email                   VARCHAR(255) UNIQUE NOT NULL,
    phone_number            VARCHAR(20)         NOT NULL,
    address                 VARCHAR(255)        NOT NULL,
    date_of_birth           DATE                NOT NULL,
    status                  VARCHAR(20)         NOT NULL,
    membership_start_date   DATE                NOT NULL,
    membership_end_date     DATE
    );

-- Insert sample gym members with realistic data
INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '123e4567-e89b-12d3-a456-426614174000',
       'John',
       'Doe',
       'john.doe@example.com',
       '+65 9123 4567',
       '123 Orchard Road, Singapore 238858',
       '1985-06-15',
       'ACTIVE',
       '2024-01-10',
       '2025-01-10'
    WHERE NOT EXISTS (SELECT 1
                  FROM member
                  WHERE id = '123e4567-e89b-12d3-a456-426614174000');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '123e4567-e89b-12d3-a456-426614174001',
       'Jane',
       'Smith',
       'jane.smith@example.com',
       '+65 9234 5678',
       '456 Marina Bay, Singapore 018956',
       '1990-09-23',
       'ACTIVE',
       '2023-12-01',
       '2025-12-01'
    WHERE NOT EXISTS (SELECT 1
                  FROM member
                  WHERE id = '123e4567-e89b-12d3-a456-426614174001');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '123e4567-e89b-12d3-a456-426614174002',
       'Alice',
       'Johnson',
       'alice.johnson@example.com',
       '+65 9345 6789',
       '789 Sentosa Cove, Singapore 098234',
       '1978-03-12',
       'EXPIRED',
       '2022-06-20',
       '2024-06-20'
    WHERE NOT EXISTS (SELECT 1
                  FROM member
                  WHERE id = '123e4567-e89b-12d3-a456-426614174002');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '123e4567-e89b-12d3-a456-426614174003',
       'Bob',
       'Brown',
       'bob.brown@example.com',
       '+65 9456 7890',
       '321 Clementi Avenue, Singapore 120321',
       '1982-11-30',
       'ACTIVE',
       '2023-05-14',
       '2026-05-14'
    WHERE NOT EXISTS (SELECT 1
                  FROM member
                  WHERE id = '123e4567-e89b-12d3-a456-426614174003');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '123e4567-e89b-12d3-a456-426614174004',
       'Emily',
       'Davis',
       'emily.davis@example.com',
       '+65 9567 8901',
       '654 Tampines Street, Singapore 520654',
       '1995-02-05',
       'ACTIVE',
       '2024-03-01',
       '2025-03-01'
    WHERE NOT EXISTS (SELECT 1
                  FROM member
                  WHERE id = '123e4567-e89b-12d3-a456-426614174004');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174005',
       'Michael',
       'Green',
       'michael.green@example.com',
       '+65 9678 9012',
       '987 Bukit Timah Road, Singapore 279734',
       '1988-07-25',
       'ACTIVE',
       '2024-02-15',
       '2025-02-15'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174005');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174006',
       'Sarah',
       'Taylor',
       'sarah.taylor@example.com',
       '+65 9789 0123',
       '123 Ang Mo Kio Avenue, Singapore 560123',
       '1992-04-18',
       'SUSPENDED',
       '2023-08-25',
       '2025-08-25'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174006');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174007',
       'David',
       'Wilson',
       'david.wilson@example.com',
       '+65 9890 1234',
       '456 Jurong West Street, Singapore 640456',
       '1975-01-11',
       'ACTIVE',
       '2022-10-10',
       '2025-10-10'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174007');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174008',
       'Laura',
       'White',
       'laura.white@example.com',
       '+65 9901 2345',
       '789 Woodlands Drive, Singapore 730789',
       '1989-09-02',
       'ACTIVE',
       '2024-04-20',
       '2025-04-20'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174008');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174009',
       'James',
       'Harris',
       'james.harris@example.com',
       '+65 9012 3456',
       '321 Pasir Ris Street, Singapore 510321',
       '1993-11-15',
       'ACTIVE',
       '2023-06-30',
       '2026-06-30'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174009');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174010',
       'Emma',
       'Moore',
       'emma.moore@example.com',
       '+65 9123 4560',
       '654 Toa Payoh Lorong, Singapore 310654',
       '1980-08-09',
       'EXPIRED',
       '2023-01-22',
       '2024-01-22'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174010');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174011',
       'Ethan',
       'Martinez',
       'ethan.martinez@example.com',
       '+65 9234 5601',
       '987 Bishan Street, Singapore 570987',
       '1984-05-03',
       'ACTIVE',
       '2024-05-12',
       '2025-05-12'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174011');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174012',
       'Sophia',
       'Clark',
       'sophia.clark@example.com',
       '+65 9345 6012',
       '123 Hougang Avenue, Singapore 530123',
       '1991-12-25',
       'ACTIVE',
       '2022-11-11',
       '2025-11-11'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174012');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174013',
       'Daniel',
       'Lewis',
       'daniel.lewis@example.com',
       '+65 9456 7123',
       '456 Punggol Drive, Singapore 820456',
       '1976-06-08',
       'ACTIVE',
       '2023-09-19',
       '2025-09-19'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174013');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '223e4567-e89b-12d3-a456-426614174014',
       'Isabella',
       'Walker',
       'isabella.walker@example.com',
       '+65 9567 8234',
       '789 Yishun Ring Road, Singapore 760789',
       '1987-10-17',
       'ACTIVE',
       '2024-03-29',
       '2025-03-29'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '223e4567-e89b-12d3-a456-426614174014');

-- Additional members for variety
INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '323e4567-e89b-12d3-a456-426614174015',
       'Ryan',
       'Tan',
       'ryan.tan@example.com',
       '+65 9678 9345',
       '101 Serangoon Road, Singapore 218012',
       '1994-07-21',
       'ACTIVE',
       '2024-06-01',
       '2025-06-01'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '323e4567-e89b-12d3-a456-426614174015');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '323e4567-e89b-12d3-a456-426614174016',
       'Michelle',
       'Lim',
       'michelle.lim@example.com',
       '+65 9789 0456',
       '202 East Coast Road, Singapore 428902',
       '1986-03-14',
       'EXPIRED',
       '2022-08-15',
       '2023-08-15'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '323e4567-e89b-12d3-a456-426614174016');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '323e4567-e89b-12d3-a456-426614174017',
       'Kevin',
       'Ng',
       'kevin.ng@example.com',
       '+65 9890 1567',
       '303 Thomson Road, Singapore 307651',
       '1991-05-30',
       'ACTIVE',
       '2024-01-20',
       '2026-01-20'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '323e4567-e89b-12d3-a456-426614174017');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '323e4567-e89b-12d3-a456-426614174018',
       'Rachel',
       'Chua',
       'rachel.chua@example.com',
       '+65 9901 2678',
       '404 Katong Avenue, Singapore 439032',
       '1998-11-08',
       'ACTIVE',
       '2024-07-15',
       '2025-07-15'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '323e4567-e89b-12d3-a456-426614174018');

INSERT INTO member (id, first_name, last_name, email, phone_number, address, date_of_birth, status, membership_start_date, membership_end_date)
SELECT '323e4567-e89b-12d3-a456-426614174019',
       'Marcus',
       'Wong',
       'marcus.wong@example.com',
       '+65 9012 3789',
       '505 Bedok North Street, Singapore 460505',
       '1983-02-19',
       'SUSPENDED',
       '2023-10-05',
       '2025-10-05'
    WHERE NOT EXISTS (SELECT 1 FROM member WHERE id = '323e4567-e89b-12d3-a456-426614174019');
