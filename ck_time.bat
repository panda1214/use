:: ���o��U�ɶ����ɡB��������
for /f "tokens=1-3 delims=:" %%i IN ('time /t') DO (
set hour=%%i
set minute=%%j
)

:: �o�� hour �e���i��|�X�{���ť�
for /f "tokens=1 delims= " %%i IN ("%hour%") DO (
set hour=%%i
)


<%

response.write(TimeSerial(23,2,3) & "<br />")
response.write(TimeSerial(0,9,11) & "<br />")
response.write(TimeSerial(14+2,9-2,1-1))

%>
The output of the code above will be:

11:02:03 PM
12:09:11 AM
4:07:00 PM