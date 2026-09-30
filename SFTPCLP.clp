/*********************************************************************/
/*   SFTP TESTING PROGRAM BY MAQSOOD                                 */
/*                                                                   */
/*********************************************************************/
/*  Program Name:  SFTPCLP                                           */
/*                                                                   */
/*  Purpose.....:  TO TEST SFTP SCRIPT                               */
/*                                                                   */
             PGM
             DCL VAR(&CMD) TYPE(*CHAR) LEN(255)

/* ENABLE ESCAPE MESSAGES FROM QSHELL FOR ERROR MONITORING */
             ADDENVVAR  ENVVAR(QIBM_QSH_CMD_ESCAPE_MSG) VALUE('Y') +
                          REPLACE(*YES)
             MONMSG     MSGID(CPF106A)

/* BUILD THE QSH SFTP COMMAND POINTING TO THE BATCH FILE AND KEY */
             CHGVAR     VAR(&CMD) VALUE('sftp -i +
                          /home/secmaqsood/.SSH/id_ed25519 -b +
                          /home/secmaqsood/FTP_definition.txt +
                          secmaqsood@busdep.staplescan.com')
 /* EXECUTE VIA QSHELL */
    QSH CMD(&CMD)

 /* CATCH ERRORS */
     MONMSG MSGID(QSH0001) EXEC(GOTO CMDLBL(ERROR))

     GOTO CMDLBL(END)

ERROR:
     SNDPGMMSG MSG('SFTP TRANSFER FAILED SAFELY.')

 END:
     ENDPGM
