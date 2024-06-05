/*
선택함수
여러가지 경우에 따라 알맞은 결과를 선택하는 함수
IF, SWITCH문과 비슷

DECODE(컬럼명|계산식, 조건1, 결과1, 조건2, 결과2, ... [,아무것도 만족 X])

컬럼명|계산식의 값이 일치하는 조건이 있으면 해당 조건의 오른쪽에 작성된 결과가 반환 됨
*/
--예제)
--EMPLOYEE 테이블에서 모든 사원의 이름, 주민번호, 성별 조회
SELECT EMP_NAME, EMP_NO, 
    DECODE (SUBSTR(EMP_NO,8,1),
                 --EMP_NO : 주민번호인데 '-' 포함해서 14자리
          --SUBSTR(EMP_NO),8,1) : 주민번호에 '-'가 포함되어 있을 때 여덟번째 문자(숫자)가 성별을 판단하는 문자(숫자)임
        '1', '남자',
        '2', '여자') AS "성별"
FROM EMPLOYEE;
/*
EMP_NAME    EMP_NO          성별
선동일	    621231-1985634	남자
송종기	    631112-1548654	남자
노옹철	    861015-1356452	남자
*/

/*
CASE
    WHEN 조건1 THEN 결과1
    WHEN 조건2 THEN 결과2
    WHEN 조건3 THEN 결과3
    ESLE 결과
END

DECODE 계산식|컬럼   : 계산식|컬럼 값이 딱 떨어지는 경우 사용 가능
CASE 계산식|컬럼     : 계산식|컬럼 값을 범위로 지정 가능
*/
--예제)
--EMPLOYEE 테이블에서 사번, 이름, 급여, 구분을 조회
--구분 받는 급여에서 초급, 중급, 고급 조회
--급여가 500만원 이상이면 고급
--급여가 300만원 이상 ~ 500만원 미만이면 중급
--급여가 300만원 미만이면 초급
SELECT EMP_ID AS "ID", EMP_NAME AS "이름", SALARY AS "급여", 
CASE
    WHEN SALARY >= 5000000 THEN '고급'
  --WHEN SALARY >= 5000000 : if (SALARY >= 5000000) {}
                         --THEN '고급' : System.out.println("고급");
    WHEN SALARY >= 3000000 THEN '중급'
  --WHEN SALARY >= 5000000 : else if (SALARY >= 3000000) {}
                         --THEN '중급' : System.out.println("중급");
    ELSE '초급'
  --ELSE '초급' : else {System.out.println("초급");}
END "구분"
   --구분 : 표시될 컬럼 명
FROM EMPLOYEE;
/*
ID  이름    급여     구분
200	선동일	8000000	고급
201	송종기	6000000	고급
202	노옹철	3700000	중급
*/
