<!-- :
@echo off

START /wait "" mshta.exe "%~f0"

-->



<html>
<head><title>�T����������</title></head>
<meta http-equiv="Content-Type" content="text/html; charset=Big5">
<body bgcolor=black>
	


<span>File exists? </span>


<script>
datnow.innerHTML="�T���e�X�ɶ�: "+new Date().toLocaleString()+' �P��'+'��@�G�T�|����'.charAt(new Date().getDay());
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