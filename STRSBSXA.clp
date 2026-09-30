/*****************************************************************/
/*  PROGRAM NAME STRSBSXA                                        */
/*  THIS PROGRAM WILL BRING SUB SYSTEM UP XA EVERY MONDAY MORNING*/
/*  THIS PROGRAM WILL BE PART OF ROBOT SCHDULE STR_SBSXA         */
/*  CREATION DATE 25-SEP-2026                                    */
/*  DEVELOPED BY MAQSOOD                                         */
/*****************************************************************/
             PGM
             MONMSG     MSGID(CPF0000)
             MONMSG     MSGID(CPF0000)
             ADDLIBLE   LIB(XAPROD) POSITION(*LAST)
             STRSBS     SBSD(XA)
             XAPISRVUTL RELEASE(13504)
             ENDPGM
