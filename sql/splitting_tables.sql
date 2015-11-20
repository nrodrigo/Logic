/* This is a cool little way to split up
   large tables using cumulative distribution */

create table catalog.the_table1 as
select field1,
  field2,
  field3
from (
  select field1,
    field2,
    field3,
    cume_dist() over (partition by null order by rowid) AS cd
  from catalog.the_table)
 where cd <= .33;

create table catalog.the_table2 as
select field1,
  field2,
  field3
from (
  select field1,
    field2,
    field3,
    cume_dist() over (partition by null order by rowid) AS cd
  from catalog.the_table)
 where cd > .33 and cd <= .66;

create table catalog.the_table3 as
select field1,
  field2,
  field3
from (
  select field1,
    field2,
    field3,
    cume_dist() over (partition by null order by rowid) AS cd
  from catalog.the_table)
 where cd > .66;
