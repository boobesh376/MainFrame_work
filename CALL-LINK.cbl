//Problem Statement: Calculate the Total Salary of an Employee Using a Subprogram
//Objective: To pass employee salary details from a main program to a subprogram using CALL and LINKAGE SECTION, and calculate the total salary.

IDENTIFICATION DIVISION.
PROGRAM-ID. MAINPROG.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 WS-BASIC-SALARY PIC 9(5).
01 WS-ALLOWANCE    PIC 9(5).
01 WS-TOTAL-SALARY PIC 9(6).

PROCEDURE DIVISION.

    DISPLAY "ENTER BASIC SALARY:"
    ACCEPT WS-BASIC-SALARY

    DISPLAY "ENTER ALLOWANCE:"
    ACCEPT WS-ALLOWANCE

    CALL "SALCALC" USING
        WS-BASIC-SALARY
        WS-ALLOWANCE
        WS-TOTAL-SALARY

    DISPLAY "TOTAL SALARY: " WS-TOTAL-SALARY

    STOP RUN.
