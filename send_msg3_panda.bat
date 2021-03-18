REM 預設 errmsg 成功需改訊息
%M0_RUNDRIVE%
CD %M0_RUNDIR% 

REM 0921024364_lineID=panda0921024364
REM SET M0_WEP=d11JbnhamEDAVhh4fI4Sdp
REM set M0_event=1_panda_ok_msg
REM set M0_event=1_panda_err_msg
REM set M0_event=123_ok_test
REM set M0_event=123_err_test
SET M0_WEP=bFfG7yiit9oGWtGh2OGaio


IF %M0_event% EQU ok_msg GOTO L9_SUB_OK
IF %M0_event% EQU err_msg GOTO L9_SUB_ERR
IF %M0_event% EQU 1_panda_ok_msg GOTO L9_SUB_OK
IF %M0_event% EQU 1_panda_err_msg GOTO L9_SUB_ERR

GOTO L9_SUB_excep

:L9_SUB_OK
echo L9_SUB_OK
set M0_event=1_panda_ok_msg
:: 將檢查成功送至 1_panda_ok_msg
curl -X POST http://maker.ifttt.com/trigger/%M0_event%/with/key/%M0_WEP% -F "value1=%M0_MSG_ENG_STR%"
GOTO L9_EXIT

:L9_SUB_ERR
echo L9_SUB_ERR
set M0_event=1_panda_err_msg
:: 將檢查成功送至 1_panda_err_msg
curl -X POST http://maker.ifttt.com/trigger/%M0_event%/with/key/%M0_WEP% -F "value1=%M0_MSG_ENG_STR%"
GOTO L9_EXIT


:L9_SUB_excep
echo 例外
echo L9_SUB_excep
SET M0_event=1_panda_err_msg
SET M0_MSG_ENG_STR=[exception]__%M0_MSG_ENG_STR%
curl -X POST http://maker.ifttt.com/trigger/%M0_event%/with/key/%M0_WEP% -F "value1=%M0_MSG_ENG_STR%"
GOTO L9_EXIT

:L9_EXIT