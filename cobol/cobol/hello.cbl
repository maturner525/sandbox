      * Hello World Program
        IDENTIFICATION DIVISION.
         PROGRAM-ID.     hello_world.
         AUTHOR.         Mark.
         INSTALLATION.   Ubuntu.
         DATE-WRITTEN.   2024-02-10.
         DATE-COMPILED.  2024-02-10.
      *
      * PROJECT DESC: SIMPLE PROGRAM TO PRINT HELLO WORLD
      *
      
        ENVIRONMENT DIVISION.
        CONFIGURATION SECTION.
         SOURCE-COMPUTER.
         OBJECT-COMPUTER.
        INPUT-OUTPUT SECTION.
         FILE-CONTROL.

        DATA DIVISION.
        FILE SECTION.
        WORKING-STORAGE SECTION.

        01  WS-MESSAGE.
            05  WS-GREETING             PIC X(5)    VALUE SPACES.
            05  FILLER                  PIC X(1)    VALUE SPACE.
            05  WS-PLANET               PIC X(5)    VALUE SPACES.

        LOCAL-STORAGE SECTION.
      *  LINKAGE SECTION.
      *  COMMUNICATION SECTION.
      *  REPORT SECTION.
      *  SCREEN SECTION.

        PROCEDURE DIVISION.
        
        000-MAIN-LOGIC.
            PERFORM 005-PRT-MESSAGE-TO-SCREEN.
        STOP RUN.

        005-PRT-MESSAGE-TO-SCREEN SECTION.
      * Section to print message 
        010-MOVE-DATA.
            MOVE 'Hello'            TO WS-GREETING.
            MOVE 'World'            TO WS-PLANET.
        010-EXIT.
        EXIT.

        020-PRT-DATA.
            DISPLAY WS-MESSAGE.
        020-EXIT.
        EXIT.

