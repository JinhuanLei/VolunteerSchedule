<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
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

    <link href="build/toastr.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="../../css/jumbotron.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->


    <link href="build/toastr.css" rel="stylesheet" />
    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="assets/css/main.css">
    <link href="build/toastr.css" rel="stylesheet" />
    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="assets/lib/metismenu/metisMenu.css">

    <style>
        @font-face {
            font-family: 'iconfont';  /* project id 481344 */
            src: url('//at.alicdn.com/t/font_481344_9vvukb6moxpc766r.eot');
            src: url('//at.alicdn.com/t/font_481344_9vvukb6moxpc766r.eot?#iefix') format('embedded-opentype'),
            url('//at.alicdn.com/t/font_481344_9vvukb6moxpc766r.woff') format('woff'),
            url('//at.alicdn.com/t/font_481344_9vvukb6moxpc766r.ttf') format('truetype'),
            url('//at.alicdn.com/t/font_481344_9vvukb6moxpc766r.svg#iconfont') format('svg');
        }

        .iconfont {
            font-family: "iconfont";
            font-size: 16px;
            font-style: normal;
            -webkit-font-smoothing: antialiased;
            -webkit-text-stroke-width: 0.2px;
            -moz-osx-font-smoothing: grayscale;
            padding-left: 0
        }
    </style>

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
        <div>
            <ul class="nav navbar-nav">
                <li id="li0"><a href="#">Admin</a></li>
                <li id="li1"><a href="#">Manager</a></li>
                <li id="li2"><a href="#">Volunteer</a></li>


            </ul>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
               <div id="downbar">
            <ul class="nav navbar-nav navbar-right" >
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">User <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li id="adminli"><a id="action-1" href="/MainToManage" >Admin</a></li>
                        <li id="manageli"><a id="action-2" href="/TurnToServiceTable" >Manage</a></li>

                        <li><a href="#" data-toggle="modal" title="edit" data-target="#EditAccount">My Account</a></li>
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
<div class="modal fade" id="EditAccount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </button>
                <h4 class="modal-title" id="myModalLabel">My Account</h4>
            </div>
            <div class="modal-body">
                <center>
                    <img src="http://lorempixel.com/90/90" name="aboutme" width="90" height="90" border="0" class="img-circle"></a>
                    <h3 class="media-heading">Joe Sixpack </h3><h5><small>USA</small></h5>
                    <%--<span><strong>Skills: </strong></span>--%>
                    <%--<span class="label label-warning">CS</span>--%>
                    <%--<span class="label label-info">AI</span>--%>
                    <%--<span class="label label-info">Machine Learning</span>--%>
                    <%--<span class="label label-success">Discrete Math</span>--%>
                </center>
                <hr>

                    <%--<p class="text-left"><strong>Information: </strong></p>--%>
                    <label for="username">username</label>
                    <input type="text"  class="form-control"id="username" disabled="disabled" name="username"/>
                    <label for="firstname">firstname</label>
                    <input type="text"  class="form-control"name="firstname" id="firstname"/>
                    <label for="lastname">lastname</label>
                    <input type="text"  class="form-control" name="lastname" id="lastname"/>
                    <label for="email">email</label>
                    <input type="text"  class="form-control" name="email" id="email"/>
                    <label for="phone">phone</label>
                    <input type="text"  class="form-control" name="phone" id="phone"/>
                    <label for="city">city</label>
                    <input type="text"  class="form-control" name="city" id="city"/>

            </div>
            <div class="modal-footer">
                <center>
                    <button type="button" class="btn btn-success" data-dismiss="modal" id="EditAccountBtn">Confirm</button>
                </center>
            </div>
        </div>
    </div>
</div>
<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron" style="background-image: url(../../images/timg.jpg);">
    <div class="container">
        <h1>WELCOME!</h1>
        <p>Introduction of website</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
    </div>
</div>

<%--<div class="container">--%>
    <%--<!-- Example row of columns -->--%>
    <%--<div class="row">--%>
        <%--<div class="col-md-4   panel-warning" id="service1">--%>

            <%--<div class="panel-heading">--%>
            <%--<h2>Activity 1</h2>--%>
            <%--</div>--%>
            <%--<div class="panel-body">--%>

            <%--<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>--%>
            <%--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>--%>
            <%--</div>--%>
        <%--</div>--%>

        <%--<div class="col-md-4 panel-info" id="service2">--%>
            <%--<div class="panel-heading">--%>
            <%--<h2>Activity 2</h2>--%>
            <%--</div>--%>
            <%--<div class="panel-body">--%>
            <%--<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>--%>
            <%--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>--%>
            <%--</div>--%>
            <%--</div>--%>
        <%--<div class="col-md-4  panel-success" id="service3">--%>
            <%--<div class="panel-heading">--%>
            <%--<h2>Activity 3</h2>--%>
            <%--</div>--%>
            <%--<div class="panel-body">--%>
            <%--<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>--%>
            <%--<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>--%>
        <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

    <%--<hr>--%>
<%--</div> <!-- /container -->--%>


<div id="content">
    <%--<div class="outer">--%>
    <%--<div class="inner bg-light lter">--%>
    <!--Begin Datatables-->
    <div class="row">
        <div class="col-lg-12">
            <div class="box">
                <header>

                    <h5>Service Table</h5>
                </header>
                <div id="collapse4" class="body">
                    <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                        <tr>

                            <th>Service ID</th>
                            <th>Service Name</th>
                            <th>Location</th>
                            <th>Starttime</th>
                            <th>Endtime</th>
                            <th><i class="iconfont">&#xe7da;</i></th>
                        </tr>
                        </thead>
                        <tbody id="accountTable">
                        <%--<tr>--%>
                        <%--<td align="center">--%>
                        <%--<a class="btn btn-default"><i class="iconfont">&#xe624;</i></a>--%>
                        <%--<a class="btn btn-danger"><i class="iconfont">&#xe600;</i></a>--%>
                        <%--</td>--%>
                        <%--<td>1</td>--%>
                        <%--<td class="hidden-xs">John Doe</td>--%>
                        <%--<td>Administrator</td>--%>
                        <%--<td>12691613@qq.com</td>--%>
                        <%--<td>La Crosse</td>--%>
                        <%--</tr>--%>
                        </tbody>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
    <%--</div>--%>
    <!-- /.row -->

</div>
<!-- /#content -->

<!-- /#right -->
</div>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<script src="assets/lib/jquery/jquery.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.6/js/jquery.tablesorter.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>

<!--Bootstrap -->
<script src="assets/lib/bootstrap/js/bootstrap.js"></script>
<!-- MetisMenu -->
<script src="assets/lib/metismenu/metisMenu.js"></script>
<!-- onoffcanvas -->
<script src="assets/lib/onoffcanvas/onoffcanvas.js"></script>
<!-- Screenfull -->
<script src="assets/lib/screenfull/screenfull.js"></script>

<!-- Metis core scripts -->
<script src="assets/js/core.js"></script>
<!-- Metis demo scripts -->
<script src="assets/js/app.js"></script>
<script src="build/toastr.min.js"></script>
<script type="text/javascript">
    toastr.options.positionClass = 'toast-top-center';
    $(function() {
        $.ajax(
            {
                type: "POST",
                url: "/initialVolunteerData",
                success: function (data) {

                    var count = Object.keys(data).length;
                    for(var x=0;x<count;x++)
                    {
                        var row=document.createElement("tr"); //创建行

                        for(var y=0;y<6;y++)
                        {
                            if(y==5)
                            {
                                var td1 = document.createElement("td"); //创建单元格
                                td1.align = "center";
                                td1.id='func'+x;
                                var a1 = document.createElement("a");
                                var i1 = document.createElement("i");

                                a1.setAttribute("onclick", "applyService(this," + x + ")");
                                a1.title = "applyService";
                                a1.className = 'btn btn-success';
                                i1.className = 'iconfont';
                                a1.appendChild(i1);
                                i1.innerHTML = "&#xe61f;";
                                td1.appendChild(a1);
                                row.appendChild(td1); //将单元格添加到行内
                            }
                            else if(y==0)
                            {
                                var td1=document.createElement("td"); //创建单元格
                                td1.id='serviceid'+x;
                                td1.appendChild(document.createTextNode(data[x].serviceid)); //为单元格添加内容
                                row.appendChild(td1); //将单元格添加到行内
                            }
                            else if(y==1)
                            {
                                var td1=document.createElement("td"); //创建单元格
                                td1.id='servicename'+x;
                                td1.appendChild(document.createTextNode(data[x].servicename)); //为单元格添加内容
                                row.appendChild(td1); //将单元格添加到行内
                            }


                            else if(y==2)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].location)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }
                            else if(y==3)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].starttime)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }

                            else if(y==4)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].endtime)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }


                        }
                        document.getElementById("accountTable").append(row); //将行添加到<tbody>中
                    }
                    Metis.MetisTable();
                    Metis.metisSortable();
                }
            })

//         $.ajax(
//            {
//                type: "POST" ,
//                url: "/initialVolunteerData" ,
//              success: function (data)
//                {
////              alert(data[0].servicename);
//
//
//                     for(var x=0; x<3;x++)
//                     {
//                         var eleH=$("#service"+(x+1)+" h2");
//                         var eleP=$("#service"+(x+1)+" p");
//                         eleH.text(data[x].servicename);
//                         eleP[0].innerHTML=data[x].introduction;
//                     }
//                         }
//    })

        var username="<%=session.getAttribute("username")%>";
        var type="<%=session.getAttribute("usertype")%>";   //判断是否是admin 管理员 或user
        var navbar=document.getElementById("downbar");
        var loginbutton=document.getElementById("submitform");
        var manageAutho=document.getElementById("adminli");   //admin Discussion
        var manageAutho2=document.getElementById("manageli");  //manager
        var li0=document.getElementById("li0");
        var li1=document.getElementById("li1");
        var li2=document.getElementById("li2");
        li0.style.display="none";
        li1.style.display="none";
        li2.style.display="none";

        console.log("username"+username+(username!="null"));
        manageAutho2.style.display="none";
//        if(username!="")   //exist
            if (username!="null")
        {
            navbar.style.display="block";
            loginbutton.style.display="none";
            console.log(type);
            if(type==2||type==1)
            {
                manageAutho.style.display="none";
                if(type==2)
                {
                    li2.style.display="block";
                }

                if(type==1)
                {
                    manageAutho2.style.display="block";
                    li1.style.display="block";
                }
            }

            if(type==0)
            {
                li0.style.display="block";
            }

//            switch(type)
//            {
//                case 0:
//
//                    break;
//
//                case 1:
//                    li1.style.display="block";
//                    break;
//                case 2:
//
//                    break;
//            }

            $.ajax(
                {
                    type: "POST",
                    url: "/InitialAccountInformation",
                    data: "username="+username,
                    dataType: "text",
                    success:function (data) {
                        var Objdata=eval("("+data+")");
                       // alert(data.username);
                        var eleH=$("#EditAccount h3");
                        var eleInput=$("#EditAccount input");
                    // document.getElementById("username").value=Objdata.username;
                        //alert(Objdata.username);
                        eleH[0].value=Objdata.firstname+" "+Objdata.lastname;
                        eleInput[0].value=Objdata.username;
                        eleInput[1].value=Objdata.firstname;
                        eleInput[2].value=Objdata.lastname;
                        eleInput[3].value=Objdata.email;
                        eleInput[4].value=Objdata.phonenumber;
                        eleInput[5].value=Objdata.city;

                    }
                });

                var mytable = document.getElementById("accountTable");
                $.ajax(
                    {
                        type: "POST",
                        url: "/InitialAppliedServiceForUser",
                        data: "username="+username,
                        dataType: "text",
                        success:function (data) {

                            var data1=eval(data);
                            var count = Object.keys(data1).length;
                            console.log("--------"+count);
                            for(var i=0,rows=mytable.rows.length; i<rows; i++){
//                                for(var j=0,cells=mytable.rows[i].cells.length; j<cells; j++){
                                    for(var x=0;x<count;x++)
                                    {
                                        console.log(mytable.rows[i].cells[1].innerHTML+"   "+data1[0].servicename)
                                        if(mytable.rows[i].cells[1].innerHTML==data1[x].servicename)
                                        {
                                            if(data1[x].status==0)
                                            {
                                                mytable.rows[i].cells[5].innerHTML="Applying";
                                            }
                                            else
                                            {
                                                var i1 = document.createElement("i");
                                                i1.className = 'iconfont';
                                                i1.innerHTML = "&#xe600;";
                                                mytable.rows[i].cells[5].innerHTML="";
                                                mytable.rows[i].cells[5].appendChild(i1);
                                            }

                                        }
                                    }

//                                }
                            }


                        }
                    });








        }
        else
        {

            navbar.style.display="none";
            loginbutton.style.display="block";
        }

    });


    document.getElementById("EditAccountBtn").addEventListener("click", function() {
        //  rate++;
       var username=document.getElementById("username").value;
        var firstname=document.getElementById("firstname").value;
        var lastname=document.getElementById("lastname").value;
        var email=document.getElementById("email").value;
        var phone=document.getElementById("phone").value;
        var city=document.getElementById("city").value;
     //var jsonObj=getDataFromForm("EditAccount");
    // console.log(jsonObj);
        $.ajax(
            {
                type: "POST",
                url: "/UpdateAccountInformation",
                data: "username="+username+"&firstname="+firstname+"&lastname="+lastname+"&email="+email+"&phone="+phone+"&city="+city,
                dataType: "text",
                success:function (data) {

                    toastr.success('Edit Success');
                }
            });
        // drawGate();
    }, false);


function getDataFromForm(id)
{
    var form = document.getElementById(id);//获取要提交的div
    var inputs = form.getElementsByTagName("input");//获得想要提交的所有div
    var object = new Object();//创建一个存放数据的对象
    for(var i=0;i<inputs.length;i++){
        object[inputs[i].getAttribute("name")]=inputs[i].value;//动态生成数据的键值对
    }
    var jsonData = JSON.stringify(object);//根据数据生成json数据
    return jsonData;
}


function applyService(thisObj,idcount) {
    var serviceid=document.getElementById("serviceid"+idcount).innerText;
    var mytable = document.getElementById("accountTable");
    //alert(serviceid);
    $.ajax(
        {
            type: "POST" ,
            url: "/ApplyService" ,
            data: "serviceid=" +serviceid+"&username="+"<%=session.getAttribute("username")%>",
            dataType: "text",
            success: function (data)
            {
                toastr.success('Apply Success');
//                setTimeout(function(){window.location.href="/changeToMainPage";},2000);
                mytable.rows[idcount].cells[5].innerHTML="Applying";
            }
        })

}
</script>
</body>
</html>
