-- задание 1
select
  date,
  amount,
  sum(amount) over (order by date, id) as cumulative_sum
from transactions;

-- задание 2
select
  id,
  category,
  price,
  price - avg(price) over (partition by category) as price_deviation
from products;

-- задание 3
select
  log_time,
  temperature,
  avg(temperature) over (order by log_time rows between 2 preceding and current row) as moving_avg
from temperature_logs;

-- задание 4
select
  task_id,
  project_id,
  start_date,
  first_value(start_date) over (partition by project_id order by start_date) as first_start_date,
  last_value(start_date) over (partition by project_id order by start_date rows between unbounded preceding and unbounded following) as last_start_date
from project_tasks;
