CREATE TABLE users (
    id bigserial PRIMARY KEY,
    nickname varchar(30),
    gender smallint, -- 0 (male), 1 (female), 2 (rather not say)
    registered_at date,
    level int
);

INSERT INTO users (nickname, gender, registered_at, level)
    VALUES ('operator', 1, '2019-01-01', 99),
           ('user', 0, '2019-02-01', 44),
           ('user2', 0, '2019-02-01', 30),
           ('user3', 1, '2019-02-02', 37),
           ('user4', 2, '2019-02-02', 10);

SELECT * FROM users; -- 전체 쿼리
SELECT * FROM users ORDER BY registered_at DESC; -- 가입일 내림차순 정렬
SELECT * FROM users WHERE nickname LIKE 'user%'; -- WHERE 쿼리 1
SELECT * FROM users WHERE level BETWEEN 30 AND 40; -- WHERE 쿼리 2