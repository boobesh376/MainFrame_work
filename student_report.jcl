//EXP11JOB JOB 'JCL EXP11',CLASS=A,MSGCLASS=X
//STEP1    EXEC PGM=EXP11
//SYSOUT   DD SYSOUT=*

       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXP11.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-STUDENT-NAME PIC X(20)
          VALUE 'TYSON'.

       01 WS-DEPARTMENT PIC X(20)
          VALUE 'COMPUTER SCIENCE'.

       01 WS-MARKS PIC 9(3)
          VALUE 85.

       PROCEDURE DIVISION.

           DISPLAY 'STUDENT REPORT'.
           DISPLAY '--------------------'.
           DISPLAY 'NAME       : ' WS-STUDENT-NAME.
           DISPLAY 'DEPARTMENT : ' WS-DEPARTMENT.
           DISPLAY 'MARKS     : ' WS-MARKS.

           IF WS-MARKS >= 50
               DISPLAY 'RESULT    : PASS'
           ELSE
               DISPLAY 'RESULT    : FAIL'
           END-IF.

           STOP RUN.
