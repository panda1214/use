FOR /F "tokens=2" %%i IN ('(date+3)/t') DO (
  IF 週一==%%i (set M0_WEEK_D=週一)
  IF 週二==%%i (set M0_WEEK_D=週二)
  IF 週三==%%i (set M0_WEEK_D=週三)
  IF 週四==%%i (set M0_WEEK_D=週四)
  IF 週五==%%i (set M0_WEEK_D=週五)
  IF 週六==%%i (set M0_WEEK_D=週六)
  IF 週日==%%i (set M0_WEEK_D=週日) )
  
  echo %M0_WEEK_D%