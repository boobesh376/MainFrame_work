IDENTIFICATION DIVISION.
PROGRAM-ID. LEDGER.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 BALANCE-AMT    PIC 9(5)V99.
01 AMOUNT         PIC 9(5)V99.
01 TRANS-TYPE     PIC X.
01 N              PIC 9(3).
01 CREDIT-COUNT   PIC 9(3) VALUE 0.
01 DEBIT-COUNT    PIC 9(3) VALUE 0.
01 REJECT-COUNT   PIC 9(3) VALUE 0.
01 DISPLAY-BAL    PIC Z(5)9.99.

PROCEDURE DIVISION.

    ACCEPT BALANCE-AMT
    ACCEPT N

    PERFORM N TIMES

        ACCEPT TRANS-TYPE
        ACCEPT AMOUNT

        IF AMOUNT <= 0
            DISPLAY "REJECTED"
            ADD 1 TO REJECT-COUNT
        ELSE
            EVALUATE TRANS-TYPE

                WHEN "C"
                    ADD AMOUNT TO BALANCE-AMT
                    ADD 1 TO CREDIT-COUNT
                    DISPLAY "CREDIT POSTED"

                WHEN "D"
                    IF AMOUNT <= BALANCE-AMT
                        SUBTRACT AMOUNT FROM BALANCE-AMT
                        ADD 1 TO DEBIT-COUNT
                        DISPLAY "DEBIT POSTED"
                    ELSE
                        DISPLAY "REJECTED"
                        ADD 1 TO REJECT-COUNT
                    END-IF

                WHEN OTHER
                    DISPLAY "REJECTED"
                    ADD 1 TO REJECT-COUNT

            END-EVALUATE
        END-IF

    END-PERFORM

    MOVE BALANCE-AMT TO DISPLAY-BAL
    DISPLAY "Final balance: " DISPLAY-BAL
    DISPLAY "Credits: " CREDIT-COUNT
    DISPLAY "Debits: " DEBIT-COUNT
    DISPLAY "Rejected: " REJECT-COUNT

    STOP RUN.


