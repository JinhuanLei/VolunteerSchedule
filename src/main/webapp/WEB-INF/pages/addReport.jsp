<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">


    <title>Administrator Interface</title>


    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">







    <link href="css/dashboard.css" rel="stylesheet">



</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="bar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Administrator</a>
            <a class="navbar-brand" href="/ManageToMain" style="font-size: small;">HomePage</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">

            <form class="navbar-form navbar-right">
                <!--r
                	作者：576253806@qq.com
                	时间：2017-10-11
                	描述：
               <input type="text" class="form-control" placeholder="Search..."> -->
                <button type="button" class="btn btn-default navbar-btn" onclick="logoutFunction()">Logout</button>
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="/getManageJsp">Overview <span class="sr-only">(current)</span></a></li>
                <li class="visible-ad-block"><a href="/getManageJsp">Account</a></li>
                <li class="hidden-ad"><a href="/GetAddAccountJsp">Add Account</a></li>
                <li class="hidden-ad"><a href="/getReportJsp">Report</a></li>

            </ul>
            <!--
                作者：576253806@qq.com
                时间：2017-10-11
                描述：
             <ul class="nav nav-sidebar">
                  <li class="active"><a href="">Nav item</a></li>
                  <li><a href="">Nav item again</a></li>
                  <li><a href="">One more nav</a></li>
                  <li><a href="">Another nav item</a></li>
                  <li><a href="">More navigation</a></li>
              </ul>
              <ul class="nav nav-sidebar">
                  <li class="active"><a href="">Nav item again</a></li>
                  <li><a href="">One more nav</a></li>
                  <li><a href="">Another nav item</a></li>
              </ul> -->
        </div>
        </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


            <h1 class="sub-header">Add a report </h1>

            <p>Event:</p>
            <input type="text" class="form-control" placeholder="Event Name" id="servicename"/>
            <p>Place:</p>
            <input type="text" class="form-control" placeholder="Where..." id="location"/>
            <p>Date:</p>
            <input type="text" class="form-control" placeholder="mm/dd/yyyy-xx:xx" id="servicetime"/>

            <p>Volunteer Number Required:</p>
            <input type="number" class="form-control" placeholder="How mamy volunteers needed." id="peoplenum"/>
            <p>Manager:</p>
            <input type="text" class="form-control" placeholder="Manager's name'" id="contactperson"/>
            <p>ContactNumber:</p>
            <input type="number" class="form-control" placeholder="Phone Number" id="contactinformation"/>
            <p>Introduction:</p>
            <textarea class="form-control" rows="3" placeholder="Say something about Event" id="introduction"></textarea>
            <input type="submit" value="Summit" style="float: right" onclick="addReport()"/>


            </div>

<script type="text/javascript">
    function addReport(){
        alert("miaomiao");
        var servicename=document.getElementById("servicename").value;
        var location=document.getElementById("location").value;
        var servicetime=document.getElementById("servicetime").value;
        var peoplenum=document.getElementById("peoplenum").value;
        var contactperson=document.getElementById("contactperson").value;
        var contactinformation=document.getElementById("contactinformation").value;
        var introduction=document.getElementById("introduction").value;
        $.ajax(
            {
                type: "POST" ,
                url: "/AddNewPost" ,
                data: "servicename=" +servicename+"&location=" +location+"&servicetime="+servicetime+"&peoplenum="+peoplenum+"&contactpersonname="+contactperson+"&contactinformation="+contactinformation+"&introduction="+introduction,
                dataType: "text",
                success: function (data)
                {
             alert("chenggong");
                }
            }
        );

    }

    function logoutFunction()
    {
        window.location.href="/GetMainJsp";
    }
</script>



            <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

            <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
