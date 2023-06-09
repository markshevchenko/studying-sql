/* MySQL */

WITH RECURSIVE Fib AS
(
  SELECT 0 AS N, 0 AS A, 1 AS B
  UNION ALL
  SELECT N + 1 AS N, B AS A, (A + B) AS B
  FROM Fib
  WHERE N < 20
)
SELECT N, A FROM Fib;