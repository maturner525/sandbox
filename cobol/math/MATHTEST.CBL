        IDENTIFICATION DIVISION.
        PROGRAM-ID. MATHTEST.

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT TaxFile ASSIGN TO "tax.dat"
                ORGANIZATION IS LINE SEQUENTIAL.

        DATA DIVISION.
        FILE SECTION.
        FD TaxFile.
        01 TaxRecord.
            05 Employee   PIC X(20).
            05 Salary     PIC X(10).
            05 TaxRate    PIC X(10).

        WORKING-STORAGE SECTION.
        01 ConvertedSalary   PIC 9(8)V99.
        01 ConvertedTaxRate  PIC 9(3)V99.
        01 TaxAmount         PIC 9(9)V99.

        01 WS-EOF            PIC X  VALUE 'N'.
        01 WS-INPUT-RECORD   PIC X(80).

        PROCEDURE DIVISION.
        MAIN-LOGIC.
            OPEN INPUT TaxFile.

            DISPLAY "Employee    Salary    Tax".
            DISPLAY "-------------------------".

            PERFORM UNTIL WS-EOF = 'Y'
                READ TaxFile INTO WS-INPUT-RECORD
                    AT END
                        MOVE 'Y' TO WS-EOF
                    NOT AT END
                        PERFORM PROCESS-RECORD
                END-READ
            END-PERFORM.

            CLOSE TaxFile.
            STOP RUN.

        PROCESS-RECORD.
            UNSTRING WS-INPUT-RECORD DELIMITED BY ','
                INTO Employee Salary TaxRate
            END-UNSTRING.

            MOVE Salary TO ConvertedSalary.
            MOVE TaxRate TO ConvertedTaxRate.

            DISPLAY 'SALARY ' Salary.
            DISPLAY 'TAXRATE ' TaxRate.

      *     COMPUTE TaxAmount = ConvertedSalary * ConvertedTaxRate.
            MULTIPLY ConvertedSalary BY ConvertedTaxRate 
                GIVING TaxAmount
                NOT ON SIZE ERROR
                    DISPLAY Employee SPACE
                            Salary SPACE
                            TaxAmount.
      
