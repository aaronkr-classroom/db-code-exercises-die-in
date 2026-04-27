# 활동 1: 학교 / 수강신청 DB
## Bad Design / 나쁜 설계
STUDENT_COURSE
- student_id
- student_name
- student_phone
- major_name
- course_id
- course_name
- professor_name
- professor_phone
- semester
- grade

## What is wrong? / 문제점
1. 학생, 과목, 교수, 수강신청 정보가 한 테이블에 섞여 있다.
1. 학생 정보가 수강 과목마다 반복된다.
1. 과목 정보가 학생마다 반복된다.
1. 교수는 별도의 개체로 분리해야 한다.
1. 수강신청은 단순 속성이 아니라 학생과 과목 사이의 관계 개체이다.

## Fixed Design / 수정된 설계
STUDENT ↔ COURSE (M:N 관계) = ENROLLMENT

STUDENT
- student_id PK
- student_name
- student_phone
- major_name

PROFESSOR
- professor_id PK
- professor_name
- professor_phone

COURSE
- course_id PK
- course_name
- course_grade
- professor_id FK

ENROLLMENT
- student_id FK (PK+)
- course_id FK (PK+)
- semester
- grade
PK = course_id + student_id

## Why is this better / 왜 더 좋은가?
- 중복 없음
- 테이블별로 목적 분리
- 관계 개체 명확히 표현

---
# 활동 2: 게임 유저 관리 DB
## Bad Design / 나쁜 설계
GAME_USER
- user_id
- nickname
- phone
- game1_name
- game1_level
- game1_score
- game2_name
- game2_level
- game2_score
- game3_name
- game3_level
- game3_score

## What is wrong? / 문제점
- 새로운 게임을 추가하거나 기존 게임이 제거되면 모든 열 자체를 수정해야만 함
- 3개의 게임 전부가 아닌 일부를 플레이하는 유저의 경우 나머지 칸이 전부 비어 불필요한 공간 낭비가 발생함

## Fixed Design / 수정된 설계
USER
- user_id PK
- nickname
- phone

GAME
- game_id PK
- game_name
- genre

USER_GAME
- user_id FK (PK+)
- game_id FK (PK+)
- level
- score
- last_played_time
PK: user_id + game_id

## Why is this better / 왜 더 좋은가?
- 유연성 확보
- 확장성 확보

# 활동 3: 쇼핑몰 DB
## Bad Design / 나쁜 설계
ORDER_TABLE
- order_id
- customer_name
- customer_phone
- customer_address
- product1_name
- product1_price
- product1_quantity
- product2_name
- product2_price
- product2_quantity
- product3_name
- product3_price
- product3_quantity
- order_date
- delivery_status

## What is wrong? / 문제점
- 주문, 고객, 상품 개체가 어지럽게 섞여 있음
- 고객 정보에 대한 중복이 발생함
- 상품 개체가 추가/삭제될 때 유연성이 전혀 없음

## Fixed Design / 수정된 설계
PRODUCT <-> ORDER (M:N) => ORDER_DETAIL\
CUSTOMER <-> ORDER (M:N)

CUSTOMER
- customer_id PK
- customer_phone
- customer_address

PRODUCT
- product_id PK
- product_name
- product_price
- product_quantity (창고에 있는 수량)

ORDER_TABLE
- order_id PK
- customer_id FK
- order_date

ORDER_DETAIL
- order_id FK (PK+)
- product_id FK (PK+)
- quantity

DELIVERY
- delivery_history_id PK
- delivery_status
- order_id FK
- changed_at

## Why is this better / 왜 더 좋은가?
- 고객 및 상품 정보를 독립적으로 관리함
- 유연성과 확장성이 보장됨
- 하나의 주문에 여러 상품을 포함할 수 있음
- ORDER_DETAIL은 주문 안의 상품 목록을 올바르게 표현한다
- DELIVERY를 사용하면 배송 상태 변화를 쉽게 추적할 수 있음