
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script language="JavaScript1.2" type="text/javascript">
    function delayURL(url) {
        var delay=document.getElementById("time").innerHTML;
        //最后的innerHTML不能丢，否则delay为一个对象
        if(delay>0){
            delay--;
            document.getElementById("time").innerHTML=delay;
        }else{
            window.top.location.href=url;
        }
        setTimeout("delayURL('" + url + "')", 1000);
//此处1000毫秒即每一秒跳转一次
    }
</script>

The page will change to the login page in <span id="time" >3</span>
seconds.
<a href="index.jsp">Login page</a>
<script type="text/javascript">
    delayURL("index.jsp");
</script>
</body>
</html>
