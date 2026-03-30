CREATE TABLE students (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    student_id VARCHAR(255) NOT NULL,
    major VARCHAR(255) NOT NULL,
    grade INT NOT NULL,
    phone VARCHAR(255) NOT NULL,
    club_id BIGSERIAL REFERENCES school_club(id)
);

CREATE TABLE school_club (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    owner BIGSERIAL NOT NULL REFERENCES students(id)
);

/*
 1. 한 동아리의 회장은 1명이다.
 2. 동아리 회장은 학생을 동아리 회원으로 추가 또는 삭제할 수 있다.
 3. 1명의 학생은 1개의 동아리만 개설하거나 가입할 수 있다.
 4. 동아리에 가입한 학생은 스스로 동아리에서 탈퇴할 수 있다.
 5. 학생은 자신의 휴대폰 번호를 변경할 수는 있으나 비워둘 수 없다.
 */