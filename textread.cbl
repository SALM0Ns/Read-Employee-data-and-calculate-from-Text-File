       IDENTIFICATION DIVISION.
       PROGRAM-ID. textread.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO "Sample.rtf" 
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  INPUT-FILE.
       01  FILE-RECORD PIC X(80).

       WORKING-STORAGE SECTION.
       01  WS-EOF-FLAG    PIC A(1) VALUE 'N'.
           88 WS-END-OF-FILE       VALUE 'Y'.

       PROCEDURE DIVISION.
       MAIN-PROCESSING.

            OPEN INPUT INPUT-FILE.

            READ INPUT-FILE
                AT END SET WS-END-OF-FILE TO TRUE
            END-READ.
             
                PERFORM UNTIL WS-END-OF-FILE
            
                DISPLAY FILE-RECORD

                READ INPUT-FILE
                    AT END SET WS-END-OF-FILE TO TRUE
                END-READ
                
                 END-PERFORM.

            CLOSE INPUT-FILE.
             STOP RUN.

       END PROGRAM textread.