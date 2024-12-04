-- Q1

CREATE TABLE departments (
department_id INT UNSIGNED auto_increment PRIMARY KEY COMMENT '部署ID',
name VARCHAR(20) NOT NULL COMMENT '部署名',
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
)
COMMENT '部署';

-- Q2

alter table people add column department_id int UNSIGNED after email;

-- Q3

-- departments
insert into departments (name) values ('営業'),('開発'),('経理'),('人事'),('情報システム');

-- people
insert into people (name, email, department_id, age, gender)
values
('佐藤大輔', 'satou_d@gizumo.jp', 1, 42, 1),
('鈴木美咲', 'suzuki_m@gizumo.jp', 1, 89, 2),
('高橋蓮', 'takahasi_r@gizumo.jp', 1, 56, 1),
('渡辺結衣', 'watanabe_y@gizumo.jp', 2, 17, 2),
('木村拓也', 'kimura_t@gizumo.jp', 2, 63, 1),
('田中愛', 'tanaka_a@gizumo.jp', 2, 21, 2),
('伊藤智也', 'itou_t@gizumo.jp', 2, 78, 1),
('中村さくら', 'nakamura_s@gizumo.jp', 3, 34, 2),
('山本颯太', 'yamamoto_s@gizumo.jp', 4, 91, 1),
('石田花音', 'isida_k@gizumo.jp', 5, 65, 2);

-- reports
insert into reports (person_id, content)
values
('7', 'report:02/01'),
('8', 'report:02/02'),
('9', 'report:02/03'),
('10', 'report:02/04'),
('11', 'report:02/05'),
('12', 'report:02/06'),
('13', 'report:02/07'),
('14', 'report:02/08'),
('15', 'report:02/09'),
('16', 'report:02/10');

-- Q4
update people set department_id = 3 where department_id is null and gender = 1;

update people set department_id = 4 where department_id is null and gender = 2;

update people set department_id = 5 where department_id is null and gender = null;

-- Q5
select name, age from people where gender = 1 order by age desc;

-- Q6
SELECT
  `name`, `email`, `age` --name, email, ageカラムを取得する
FROM
  `people` --peopleテーブルのレコードから
WHERE
  `department_id` = 1 --department_id が 1 に一致するものを
ORDER BY
  `created_at`; --created_atが昇順になるように並び変えて

-- Q7
select name from people where
  (age between 20 and 29 and gender = 2) or
  (age between 40 and 49 and gender = 1)
  order by gender;

-- Q8
select * from people where
  department_id = 1
  order by age;

-- Q9
select avg(age) as average_age from people where department_id = 2 and gender = 2;

-- Q10
select
  p.name, d.name, r.content
from
  people as p
inner join
  reports as r using (person_id)
inner join
  departments as d using (department_id);

-- Q11
select
  p.name
from
  people as p
left outer join
  reports as r using (person_id)
where
  content is null;
