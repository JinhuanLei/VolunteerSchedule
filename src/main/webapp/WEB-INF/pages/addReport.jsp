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
    <link href="build/toastr.css" rel="stylesheet" />
    <link href="css/bootstrap-datetimepicker.css"rel="stylesheet" />





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
                <button type="button" class="btn btn-default navbar-btn" onclick="logoutFunction()">Exit</button>
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="/TurnToServiceTable">Overview <span class="sr-only">(current)</span></a></li>
                <li class="hidden-ad" id="reportli"><a href="/TurnToServiceTable">Report</a></li>
                <li class="hidden-ad" id="addreportli"><a href="/getReportJsp">Add Report</a></li>
                <li class="hidden-ad" id="addreportli1"><a href="/TurnToPageServiceRequest">Service Request  <span class="badge">3</span></a></li>
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
            <p>Start Date:</p>
            <%--<input type="text" class="form-control" placeholder="mm/dd/yyyy-xx:xx" id="starttime"/>--%>
            <input type="text" name="startTime" class="form-control" id="starttime"readonly/>
            <p>End Date:</p>
            <%--<input type="text" class="form-control" placeholder="mm/dd/yyyy-xx:xx" id="endtime"/>--%>
            <input type="text" name="endTime" class="form-control" id="endtime" readonly/>
            <p>Volunteer Number Required:</p>
            <input type="number" class="form-control" placeholder="How mamy volunteers needed." id="peoplenum"/>
            <p>Manager:</p>
            <input type="text" class="form-control" placeholder="Manager's name'" id="contactperson"/>
            <p>ContactNumber:</p>
            <input type="number" class="form-control" placeholder="Phone Number" id="contactinformation"/>
            <p>Introduction:</p>
            <textarea class="form-control" rows="3" placeholder="Say something about Event" id="introduction"></textarea>
            <br>
            <input type="submit" class="btn btn-success" value="Summit" style="float: right" onclick="addReport()"/>
            </div>
<script src="assets/lib/jquery/jquery.js"></script>
<script src="build/toastr.min.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
    toastr.options.positionClass = 'toast-top-center';
    $("input[name='startTime']").datetimepicker({
        minView : "hour", //  选择时间时，最小可以选择到那层；默认是‘hour’也可用0表示
        language : 'zen', // 语言
        autoclose : true, //  true:选择时间后窗口自动关闭
        format : 'yyyy-mm-dd hh:00:00', // 文本框时间格式，设置为0,最后时间格式为2017-03-23 17:00:00
        todayBtn : true, // 如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
        startDate : new Date()  // 窗口可选时间从今天开始
//        endDate : new Date()   // 窗口最大时间直至今天
    })

    $("input[name='endTime']").datetimepicker({
        minView : "hour", //  选择时间时，最小可以选择到那层；默认是‘hour’也可用0表示
        language : 'zen', // 语言
        autoclose : true, //  true:选择时间后窗口自动关闭
        format : 'yyyy-mm-dd hh:00:00', // 文本框时间格式，设置为0,最后时间格式为2017-03-23 17:00:00
        todayBtn : true, // 如果此值为true 或 "linked"，则在日期时间选择器组件的底部显示一个 "Today" 按钮用以选择当前日期。
        startDate : new Date()  // 窗口可选时间从今天开始
//        endDate : new Date()   // 窗口最大时间直至今天
    })


    function addReport(){
       // alert("miaomiao");
        var servicename=document.getElementById("servicename").value;
        var location=document.getElementById("location").value;
        var starttime=document.getElementById("starttime").value;
        var endtime=document.getElementById("endtime").value;
        var peoplenum=document.getElementById("peoplenum").value;
        var contactperson=document.getElementById("contactperson").value;
        var contactinformation=document.getElementById("contactinformation").value;
        var introduction=document.getElementById("introduction").value;
        $.ajax(
            {
                type: "POST" ,
                url: "/AddNewPost" ,
                data: "servicename="+servicename+"&location=" +location+"&starttime="+starttime+"&peoplenum="+peoplenum+"&contactpersonname="+contactperson+"&contactinformation="+contactinformation+"&introduction="+introduction+"&endtime="+endtime,
                dataType: "text",
                success: function (data)
                {
                    toastr.success('Add Success');
                    setTimeout(function(){window.location.href="/getManageJsp";},2000);
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
