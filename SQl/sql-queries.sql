------------------------------------------------------------
-- 1. Employees hired after all managers and earning
--    more than all clerks
------------------------------------------------------------
SELECT *
FROM emp
WHERE hiredate > (SELECT MAX(hiredate) FROM emp WHERE job = 'MANAGER')
AND sal > (SELECT MAX(sal) FROM emp WHERE job = 'CLERK');


------------------------------------------------------------
-- 2. Name of the employee getting 4th maximum salary
--    along with department name
------------------------------------------------------------
SELECT e.ename, d.dname
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE e.sal = (
    SELECT sal
    FROM (
        SELECT DISTINCT sal
        FROM emp
        ORDER BY sal DESC
    )
    WHERE ROWNUM = 4
);


------------------------------------------------------------
-- 3. Salesman having 'E' as the last-but-one character
--    in ENAME and salary having exactly 4 digits
------------------------------------------------------------
SELECT *
FROM emp
WHERE job = 'SALESMAN'
AND ename LIKE '%E_'
AND sal BETWEEN 1000 AND 9999;


------------------------------------------------------------
-- 4. Employees earning more than SCOTT
--    but less than KING
------------------------------------------------------------
SELECT *
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'SCOTT')
AND sal < (SELECT sal FROM emp WHERE ename = 'KING');


------------------------------------------------------------
-- 5. Name, salary and annual salary of employees
--    whose salary is less than BLAKE and more than 3500
------------------------------------------------------------
SELECT ename, sal, sal*12 AS annual_salary
FROM emp
WHERE sal < (SELECT sal FROM emp WHERE ename = 'BLAKE')
AND sal > 3500;


------------------------------------------------------------
-- 6. Employee name and manager name
--    if manager was hired before employee
------------------------------------------------------------
SELECT e.ename AS employee_name,
       m.ename AS manager_name
FROM emp e
JOIN emp m ON e.mgr = m.empno
WHERE m.hiredate < e.hiredate;


------------------------------------------------------------
-- 7. Details of the employee who was hired 2nd
--    in the entire table
------------------------------------------------------------
SELECT *
FROM (
    SELECT *
    FROM emp
    ORDER BY hiredate
)
WHERE ROWNUM = 2;


------------------------------------------------------------
-- 8. Name and hiredate of employees hired after 1980
--    and before KING
------------------------------------------------------------
SELECT ename, hiredate
FROM emp
WHERE hiredate > TO_DATE('31-12-1980','DD-MM-YYYY')
AND hiredate < (SELECT hiredate FROM emp WHERE ename = 'KING');


------------------------------------------------------------
-- 9. Number of employees and average salary
--    whose salary > 2000, grouped by department
------------------------------------------------------------
SELECT deptno,
       COUNT(*) AS emp_count,
       AVG(sal) AS avg_salary
FROM emp
WHERE sal > 2000
GROUP BY deptno;


------------------------------------------------------------
-- 10. Employees who are working as CLERK
--     in the same department as TURNER
------------------------------------------------------------
SELECT *
FROM emp
WHERE job = 'CLERK'
AND deptno = (SELECT deptno FROM emp WHERE ename = 'TURNER');


------------------------------------------------------------
-- 11. Names of the employees reporting
--     to BLAKE's manager
------------------------------------------------------------
SELECT ename
FROM emp
WHERE mgr = (
    SELECT mgr
    FROM emp
    WHERE ename = 'BLAKE'
);


------------------------------------------------------------
-- 12. Department name and hiredate for employees
--     hired after 1983 into ACCOUNTING or RESEARCH
------------------------------------------------------------
SELECT d.dname, e.hiredate
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE e.hiredate > TO_DATE('31-12-1983','DD-MM-YYYY')
AND d.dname IN ('ACCOUNTING', 'RESEARCH');


------------------------------------------------------------
-- 13. Department number and number of employees
--     only if there are at least 2 clerks in the department
------------------------------------------------------------
SELECT deptno, COUNT(*) AS emp_count
FROM emp
WHERE job = 'CLERK'
GROUP BY deptno
HAVING COUNT(*) >= 2;


------------------------------------------------------------
-- 14. Names of employees working in OPERATIONS
--     department and hired before KING
------------------------------------------------------------
SELECT e.ename
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE d.dname = 'OPERATIONS'
AND e.hiredate < (SELECT hiredate FROM emp WHERE ename = 'KING');


------------------------------------------------------------
-- 15. Details of the employees earning
--     the least annual salary
------------------------------------------------------------
SELECT *
FROM emp
WHERE sal*12 = (SELECT MIN(sal*12) FROM emp);


------------------------------------------------------------
-- 16. Employee name, salary and designation
--     whose annual salary is more than SMITH
--     and less than KING
------------------------------------------------------------
SELECT ename, sal, job
FROM emp
WHERE sal*12 > (SELECT sal*12 FROM emp WHERE ename = 'SMITH')
AND sal*12 < (SELECT sal*12 FROM emp WHERE ename = 'KING');


------------------------------------------------------------
-- 17. Details of employees who are working as MANAGER
--     in the same department as TURNER
------------------------------------------------------------
SELECT *
FROM emp
WHERE job = 'MANAGER'
AND deptno = (SELECT deptno FROM emp WHERE ename = 'TURNER');


------------------------------------------------------------
-- 18. Details of employees hired after
--     all employees of department 10
------------------------------------------------------------
SELECT *
FROM emp
WHERE hiredate > (
    SELECT MAX(hiredate)
    FROM emp
    WHERE deptno = 10
);


------------------------------------------------------------
-- 19. Location of employees if they earn commission
--     in department 40
------------------------------------------------------------
SELECT DISTINCT d.loc
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE e.comm IS NOT NULL
AND e.deptno = 40;


------------------------------------------------------------
-- 20. Employee name and manager name along with
--     their annual salaries if employee works in
--     department 10 or 20 and manager salary > employee salary
------------------------------------------------------------
SELECT e.ename AS employee_name,
       e.sal*12 AS employee_annual_salary,
       m.ename AS manager_name,
       m.sal*12 AS manager_annual_salary
FROM emp e
JOIN emp m ON e.mgr = m.empno
WHERE e.deptno IN (10, 20)
AND m.sal > e.sal;

------------------------------------------------------------
-- 21. WAQTD DETAILS OF THE EMPLOYEE EARNING 7TH MINIMUM SALARY
------------------------------------------------------------
SELECT sal
FROM (
    SELECT ROWNUM AS slno, sal
    FROM (
        SELECT DISTINCT sal
        FROM emp
        ORDER BY sal
    )
)
WHERE slno = 7;
