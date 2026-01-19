/* =========================================================
   JOIN WITH CONDITIONS
   Tables: EMP, DEPT
   ========================================================= */

------------------------------------------------------------
-- 1. Display ENAME and LOCATION of employees
--    earning more than 2000
------------------------------------------------------------
SELECT e.ename, d.loc
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE e.sal > 2000;


------------------------------------------------------------
-- 2. Display ENAME, SAL and DNAME of employees
--    working in DEPT 30
------------------------------------------------------------
SELECT e.ename, e.sal, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE e.deptno = 30;


------------------------------------------------------------
-- 3. Display ENAME and DNAME of employees
--    whose department location is CHICAGO
------------------------------------------------------------
SELECT e.ename, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE d.loc = 'CHICAGO';


------------------------------------------------------------
-- 4. Display ENAME, SAL and LOC of employees
--    working as MANAGER
------------------------------------------------------------
SELECT e.ename, e.sal, d.loc
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE e.job = 'MANAGER';


------------------------------------------------------------
-- 5. Display ENAME and DNAME of employees
--    whose DNAME starts with 'A'
------------------------------------------------------------
SELECT e.ename, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE d.dname LIKE 'A%';



/* =========================================================
   AGGREGATE + JOIN
   ========================================================= */

------------------------------------------------------------
-- 6. Display DNAME and total salary needed
--    to pay employees in each department
------------------------------------------------------------
SELECT d.dname, SUM(e.sal) AS total_salary
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname;


------------------------------------------------------------
-- 7. Display DNAME and number of employees
--    in each department
------------------------------------------------------------
SELECT d.dname, COUNT(e.empno) AS employee_count
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname;


------------------------------------------------------------
-- 8. Display DNAME and average salary
--    of employees in each department
------------------------------------------------------------
SELECT d.dname, AVG(e.sal) AS average_salary
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname;


------------------------------------------------------------
-- 9. Display DNAME and maximum salary
--    in each department
------------------------------------------------------------
SELECT d.dname, MAX(e.sal) AS max_salary
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname;


------------------------------------------------------------
-- 10. Display LOCATION and total salary
--     of employees in that location
------------------------------------------------------------
SELECT d.loc, SUM(e.sal) AS total_salary
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.loc;
