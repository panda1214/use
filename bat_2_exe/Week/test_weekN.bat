FOR /F "tokens=2" %%i IN ('(date+3)/t') DO (
  IF �g�@==%%i (set M0_WEEK_D=�g�@)
  IF �g�G==%%i (set M0_WEEK_D=�g�G)
  IF �g�T==%%i (set M0_WEEK_D=�g�T)
  IF �g�|==%%i (set M0_WEEK_D=�g�|)
  IF �g��==%%i (set M0_WEEK_D=�g��)
  IF �g��==%%i (set M0_WEEK_D=�g��)
  IF �g��==%%i (set M0_WEEK_D=�g��) )
  
  echo %M0_WEEK_D%