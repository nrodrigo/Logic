-- The witty cartesian join on a table to itself to find the first or last element
-- I believe this is unofficially dubbed the "theta" join

-- table a
-- values: 1, 2, 3

select a.id, a_theta.id
from a
left join a as a_theta on a.id > a_theta.id
where a_theta.id is null
;

-- Truth table:

-- a | a_theta | true?
-- -------------------
-- 1 | 1       | 0
-- 1 | 2       | 0
-- 1 | 3       | 0
-- 2 | 1       | 1
-- 2 | 2       | 0
-- 2 | 3       | 0
-- 3 | 1       | 1
-- 3 | 2       | 1
-- 3 | 3       | 0

-- Without "where a_theta.id is null", this returns:
> select a.id, a_theta.id
    -> from a
    -> left join a as a_theta on a.id > a_theta.id;
+------+------+
| id   | id   |
+------+------+
|    1 | NULL |
|    2 |    1 |
|    3 |    1 |
|    3 |    2 |
+------+------+

-- Since "a" is the first table in a left join, ALL values in "a" must be present.
-- With the where clause, this yields:

> select a.id, a_theta.id
    -> from a
    -> left join a as a_theta on a.id > a_theta.id
    -> where a_theta.id is null
    -> ;
+------+------+
| id   | id   |
+------+------+
|    1 | NULL |
+------+------+
1 row in set (0.00 sec)

-- Likewise, if you flip ">" to "<":

> select a.id, a_theta.id
    -> from a
    -> left join a as a_theta on a.id < a_theta.id
    -> where a_theta.id is null
    -> ;
+------+------+
| id   | id   |
+------+------+
|    3 | NULL |
+------+------+

-- This functionality is somewhat similar to Oracle's lead/lag analytical function

