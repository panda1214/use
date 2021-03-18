FOR /F "tokens=2" %%i IN ('20210118/t') DO (
  IF 週一==%%i (set M1_WEEK_D=週一)
  IF 週二==%%i (set M1_WEEK_D=週二)
  IF 週三==%%i (set M1_WEEK_D=週三)
  IF 週四==%%i (set M1_WEEK_D=週四)
  IF 週五==%%i (set M1_WEEK_D=週五)
  IF 週六==%%i (set M1_WEEK_D=週六)
  IF 週日==%%i (set M1_WEEK_D=週日) 
SET M1_WEEKEND=%%i 
  )
echo M1_WEEKEND
pause