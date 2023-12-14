CREATE KEYSPACE my_ks WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};
USE my_ks;

-- первая таблица для тасков 1, 2, 3
CREATE TABLE post_by_user
(
    user_id    INT,
    username   TEXT,
    post_id    INT,
    content    TEXT,
    created_at TIMESTAMP,
    PRIMARY KEY (user_id, created_at)
) WITH CLUSTERING ORDER BY (created_at desc);

--create test data
INSERT INTO post_by_user (user_id, username, post_id, content, created_at)
VALUES (1, 'Anton', 1, 'Content_1', dateof(now()));

INSERT INTO post_by_user (user_id, username, post_id, content, created_at)
VALUES (2, 'Petr', 2, 'Content_2', dateof(now()));

INSERT INTO post_by_user (user_id, username, post_id, content, created_at)
VALUES (3, 'Stas', 3, 'Content_3', dateof(now()));

INSERT INTO post_by_user (user_id, username, post_id, content, created_at)
VALUES (1, 'Anton', 4, 'Content_4', dateof(now()));

INSERT INTO post_by_user (user_id, username, post_id, content, created_at)
VALUES (2, 'Petr', 5, 'Content_5', dateof(now()));

INSERT INTO post_by_user (user_id, username, post_id, content, created_at)
VALUES (3, 'Stas', 6, 'Content_6', dateof(now()));


--Task 1
SELECT post_id, content, created_at FROM post_by_user WHERE user_id=1;

--Task 2
SELECT post_id, content, created_at, username FROM post_by_user WHERE user_id=1 LIMIT 1;

--Task 3
SELECT user_id, username, post_id, created_at FROM post_by_user WHERE user_id=1 AND created_at>'2022-12-13 12:17:04.154';


--Вторая таблица для таска 4
CREATE TABLE post_by_topic_and_timestamp
(
    user_id INT,
    username TEXT,
    post_id INT,
    topic_id INT,
    created_at TIMESTAMP,
    PRIMARY KEY ((topic_id, created_at))
);


INSERT INTO post_by_topic_and_timestamp (user_id, username, post_id, topic_id, created_at)
VALUES (1, 'Anton', 1, 1, '2022-12-13');

INSERT INTO post_by_topic_and_timestamp (user_id, username, post_id, topic_id, created_at)
VALUES (2, 'Alex', 2, 1, '2022-12-14');

INSERT INTO post_by_topic_and_timestamp (user_id, username, post_id, topic_id, created_at)
VALUES (2, 'Evgen', 3, 1, '2022-12-15');

INSERT INTO post_by_topic_and_timestamp (user_id, username, post_id, topic_id, created_at)
VALUES (1, 'Anton', 4, 2, '2022-12-16');

INSERT INTO post_by_topic_and_timestamp (user_id, username, post_id, topic_id, created_at)
VALUES (2, 'Alex', 5, 2, '2022-12-17');

INSERT INTO post_by_topic_and_timestamp (user_id, username, post_id, topic_id, created_at)
VALUES (2, 'Evgen', 6, 2, '2022-12-18');


--Task 4
SELECT  user_id, username, post_id, created_at
    FROM post_by_topic_and_timestamp
    WHERE topic_id=2 AND created_at='2022-12-18';
