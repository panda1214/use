FOR /F "tokens=2" %%i IN ('20210118/t') DO (
  IF �g�@==%%i (set M1_WEEK_D=�g�@)
  IF �g�G==%%i (set M1_WEEK_D=�g�G)
  IF �g�T==%%i (set M1_WEEK_D=�g�T)
  IF �g�|==%%i (set M1_WEEK_D=�g�|)
  IF �g��==%%i (set M1_WEEK_D=�g��)
  IF �g��==%%i (set M1_WEEK_D=�g��)
  IF �g��==%%i (set M1_WEEK_D=�g��) 
SET M1_WEEKEND=%%i 
  )
echo M1_WEEKEND
pause