<!-- :
@echo off

START /wait "" mshta.exe "%~f0"

-->



<html>
<head><title>訊息提醒視窗</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
<body bgcolor=black>
	


<span>File exists? </span>


<script>
datnow.innerHTML="訊息送出時間: "+new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
</script>


<SCRIPT>
    function get_error(x){
        document.getElementsByTagName('span')[0].innerHTML+=x+" does not exist.";
    }
    url="d:/test.txt";
    url+="?"+new Date().getTime()+Math.floor(Math.random()*1000000);
    var el=document.createElement('script');
    el.id="123";
    el.onerror=function(){if(el.onerror)get_error(this.id)}
    el.src=url;
    document.body.appendChild(el);
</SCRIPT>

</body>
</html>