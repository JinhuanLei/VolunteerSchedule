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


    <style type="text/css">

        .col-sm-9 span.errorinfer{
            visibility:hidden;
            color:red;
            font-size:11px;
            font-style:italic;
            display:block;

        }
    </style>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="bar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
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
                <!--
                    作者：576253806@qq.com
                    时间：2017-10-11
                    描述：
                 <input type="text" class="form-control" placeholder="Search...">-->
                <button type="button" class="btn btn-default navbar-btn" onclick="logoutFunction()">Logout</button>
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="/getManageJsp">Overview <span class="sr-only">(current)</span></a>
                </li>
                <li class="visible-ad-block"><a href="/getManageJsp">Account</a></li>
                <li class="hidden-ad"><a href="/GetAddAccountJsp">Add Account</a></li>
                <li class="hidden-ad"><a href="/getReportJsp">Report</a></li>

            </ul>

        </div>
    </div>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


    <h1 class="sub-header">Add a new User</h1>
    <p>UserType:</p>
    <select class="form-control" id="usertype">
        <option></option>
        <option>Manager</option>
        <option>Volunteer</option>

    </select>

    <p>UserName:</p>
    <input type="text" class="form-control" placeholder="Please input a username" id="username"/>
    <p>First Name:</p>
    <input type="text" class="form-control" placeholder="Please input a firstname" id="firstname"/>
    <p>Last Name:</p>
    <input type="text" class="form-control" placeholder="Please input a lastname" id="lastname"/>
    <p>Password:</p>
    <input type="password" class="form-control" placeholder="Please input password" id="password1"/>
    <p>Password again:</p>
    <input type="password" class="form-control" placeholder="Please repeat password" id="password2"/>
    <br>
    <input type="submit" class="btn btn-success" value="Summit" style="float: right" onclick="addAccount()"/>

    <span class="errorinfer" id="errorinfer">Incomparable Password</span>

</div>

<script type="text/javascript">


    function logoutFunction()
    {
        window.location.href="/GetMainJsp";
    }

    function addAccount() {
//        alert("qwq");
        var username=document.getElementById("username").value;
        var firstname=document.getElementById("firstname").value;
        var lastname=document.getElementById("lastname").value;
        var password1=document.getElementById("password1").value;
        var password2=document.getElementById("password2").value;
        var error = document. getElementById("errorinfer");
        var usertype=$("#usertype").val();
        error.style.visibility="hidden";


//        alert(password1 +"  "+password2);
        if(password1!=password2)
        {
            error.style.visibility="visible";
            return;
        }
        $.ajax(
            {
                type: "POST" ,
                url: "/AddNewAccountByAdmin" ,
                data: "username=" +username+"&password=" +password1+"&usertype="+usertype+"&firstname="+firstname+"&lastname="+lastname ,
                dataType: "text",
                success: function (data)
                {
                      window.location.href="/TurnToManagePage";
                }
            }
        );

//        alert("Volunteer has been created.")

    }
</script>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
