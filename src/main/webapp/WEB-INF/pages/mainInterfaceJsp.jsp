<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <%--<link rel="icon" href="../../favicon.ico">--%>

    <title>Volunteer</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">



    <!-- Custom styles for this template -->
    <link href="../../css/jumbotron.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->

</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Volunteer Work Scheduling</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
               <div id="downbar">
            <ul class="nav navbar-nav navbar-right" >
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">User <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a id="action-1" href="#">Manager</a></li>

                        <li><a href="#">Setting</a></li>
                        <li class="divider"></li>
                        <li><a href="/logoutFuntion">Log Out</a></li>

                    </ul>
                </li>
            </ul>
               </div>
            <div id="submitform">
            <form class="navbar-form navbar-right" id="loginButton" action="/maintoindex">
                <!--
                    作者：576253806@qq.com
                    时间：2017-10-11
                    描述：
                <div class="form-group">
                     <input type="text" placeholder="Email" class="form-control">
                 </div>
                 <div class="form-group">
                     <input type="password" placeholder="Password" class="form-control">
                 </div> -->
                <button type="submit" class="btn btn-success" >Sign in</button>

            </form>
            </div>
        </div><!--/.navbar-collapse -->

    </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron" style="background-image: url(../../images/timg.jpg);">
    <div class="container">
        <h1>WELCOME!</h1>
        <p>Introduction of website</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
    </div>
</div>

<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-4   panel-warning" id="service1">

            <div class="panel-heading">
            <h2>Activity 1</h2>
            </div>
            <div class="panel-body">

            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
        </div>

        <div class="col-md-4 panel-info" id="service2">
            <div class="panel-heading">
            <h2>Activity 2</h2>
            </div>
            <div class="panel-body">
            <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
            </div>
            </div>
        <div class="col-md-4  panel-success" id="service3">
            <div class="panel-heading">
            <h2>Activity 3</h2>
            </div>
            <div class="panel-body">
            <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
            <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        </div>
    </div>

    <hr>


</div> <!-- /container -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(function() {
        var state;
        $.ajax(
            {
                type: "POST" ,
                url: "/initialVolunteerData" ,
              success: function (data)
                {
              alert(data[0].servicename);


                     for(var x=0; x<3;x++)
                     {
                         var eleH=$("#service"+(x+1)+" h2");
                         var eleP=$("#service"+(x+1)+" p");
                         eleH.text(data[x].servicename);
                         eleP[0].innerHTML=data[x].introduction;
                     }
//                    var eleH=$("#service1 h2");
//                    var eleP=$("#service1 p");
//                    console.log(data.servicename);
//                      eleH.text(data[x].servicename);
//                      eleP[0].innerHTML=data.introduction;
                         }
    })

        var username="<%=session.getAttribute("username")%>";
        var type="<%=session.getAttribute("usertype")%>";   //判断是否是admin 管理员 或user
        var navbar=document.getElementById("downbar");
        var loginbutton=document.getElementById("submitform");
        console.log("username"+username+(username!="null"));
//        if(username!="")   //exist
            if (username!="null")
        {
            navbar.style.display="block";
            loginbutton.style.display="none";

        }
        else
        {

            navbar.style.display="none";
            loginbutton.style.display="block";
        }

    });


//    function loginFunction()
//    {
//        alert("xxx");
//        window.location.href="/maintoindex";
//    }
</script>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
