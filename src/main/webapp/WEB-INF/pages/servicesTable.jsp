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
    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="assets/css/main.css">
    <link href="build/toastr.css" rel="stylesheet" />
    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="assets/lib/metismenu/metisMenu.css">
    <%--<link rel="stylesheet" href="assets/lib/onoffcanvas/onoffcanvas.css">--%>

    <%--<!-- animate.css stylesheet -->--%>
    <%--<link rel="stylesheet" href="assets/lib/animate.css/animate.css">--%>

    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap.min.css">--%>
    <style>
        @font-face {
            font-family: 'iconfont';
            /* project id 444600 */
            src: url('//at.alicdn.com/t/font_444600_mot3jg1520t9ms4i.eot');
            src: url('//at.alicdn.com/t/font_444600_mot3jg1520t9ms4i.eot?#iefix') format('embedded-opentype'), url('//at.alicdn.com/t/font_444600_mot3jg1520t9ms4i.woff') format('woff'), url('//at.alicdn.com/t/font_444600_mot3jg1520t9ms4i.ttf') format('truetype'), url('//at.alicdn.com/t/font_444600_mot3jg1520t9ms4i.svg#iconfont') format('svg');
        }

        @font-face {
            font-family: 'iconfont';  /* project id 481344 */
            src: url('//at.alicdn.com/t/font_481344_3j910nkydca98uxr.eot');
            src: url('//at.alicdn.com/t/font_481344_3j910nkydca98uxr.eot?#iefix') format('embedded-opentype'),
            url('//at.alicdn.com/t/font_481344_3j910nkydca98uxr.woff') format('woff'),
            url('//at.alicdn.com/t/font_481344_3j910nkydca98uxr.ttf') format('truetype'),
            url('//at.alicdn.com/t/font_481344_3j910nkydca98uxr.svg#iconfont') format('svg');
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
    <script src="build/toastr.min.js"></script>
    <script type="text/javascript">
        toastr.options.positionClass = 'toast-top-center';
        function changeaTOVolunteer() {
            window.location.href="/GetAddAccountJsp";
        }

        function logoutFunction()
        {
            window.location.href="/GetMainJsp";
        }

    </script>


    <link href="css/dashboard.css" rel="stylesheet">
    <script>
        less = {
            env: "development",
            relativeUrls: false,
            rootpath: "/assets/"
        };
    </script>
    <link rel="stylesheet" href="assets/css/style-switcher.css">
    <link rel="stylesheet/less" type="text/css" href="assets/less/theme.less">
    <link href="build/toastr.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/less.js/2.7.1/less.js"></script>

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
                <li class="active"><a href="/TurnToServiceTable">Overview <span class="sr-only">(current)</span></a></li>
                <%--<li class="visible-ad-block" id="accountli"><a href="/getManageJsp">Account</a></li>--%>
                <%--<li class="hidden-ad" id="addaccountli"><a href="/GetAddAccountJsp">Add Account</a></li>--%>
                <li class="hidden-ad" id="reportli"><a href="/TurnToServiceTable">Service</a></li>
                <li class="hidden-ad" id="addreportli"><a href="/getReportJsp">Add Service</a></li>
                <li class="hidden-ad" id="addreportli1"><a href="/TurnToPageServiceRequest">Service Request  <span class="badge">3</span></a></li>
            </ul>

        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <br>
            <h1 class="sub-header" >Service Information
                <button class="btn btn-default" aria-label="Left Align" title="Add a new service" onclick="changeaTOVolunteer()">
                    <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
                </button>


            </h1>

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
                                                <th><i class="iconfont">&#xe607;</i></th>
                                                <th>Service ID</th>
                                                <th>Service Name</th>
                                                <th>Location</th>
                                                <th>Starttime</th>
                                                <th>Endtime</th>

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
                        </div>
                        <!-- /.row -->

                    </div>
                    <!-- /#content -->

                    <!-- /#right -->
                </div>
                <!-- /#wrap -->
            </div>
        </div>
    </div>
</div>
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
<script>
    toastr.options.positionClass = 'toast-top-center';

    function deleteService(thisObj,idcount)
    {
        var serviceid=document.getElementById("serviceid"+idcount).innerText;
        $.ajax(
            {
                type: "POST" ,
                url: "/DeleteService" ,
                data: "serviceid=" +serviceid,
                success: function (data)
                {
                    toastr.success('Delete Success');
                    setTimeout(function(){window.location.href="/TurnToServiceTable";},2000);
                }
            })

    }
</script>
<script type="text/javascript">
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
                            if(y==0)
                            {
                                var td1 = document.createElement("td"); //创建单元格
                                td1.align = "center";
                                var a1 = document.createElement("a");
                                var i1 = document.createElement("i");
                                var a2 = document.createElement("a");
                                var i2 = document.createElement("i");
                                a2.setAttribute("onclick", "deleteService(this," + x + ")");
                                a1.title = "Terminate";
                                a2.title = "Delete";
                                a1.className = 'btn btn-default';
                                a2.className = 'btn btn-danger';
                                i1.className = 'iconfont';
                                i2.className = 'iconfont';
                                a1.appendChild(i1);
                                a2.appendChild(i2);
                                // i1.appendChild(document.createTextNode("&#xe624;"));
                                i1.innerHTML = "&#xe624;";
                                i2.innerHTML = "&#xe601";

                                //i2.appendChild(document.createTextNode("&#xe600;"));
                                //                                $("#discussionTable").trigger("create");//为单元格添加内容
                                //                                var a1=' <a class="btn btn-default"><i class="iconfont">&#xe624;</i></a>';
                                //                                var a2='<a class="btn btn-dange"><i class="iconfont">&#xe600;</i></a>';

                                td1.appendChild(a1);
                                td1.append(" ");
                                td1.appendChild(a2);

                                row.appendChild(td1); //将单元格添加到行内
                            }
                            else if(y==1)
                            {
                                var td1=document.createElement("td"); //创建单元格
                                td1.id='serviceid'+x;
                                td1.appendChild(document.createTextNode(data[x].serviceid)); //为单元格添加内容
                                row.appendChild(td1); //将单元格添加到行内
                            }
                            else if(y==2)
                            {
                                var td1=document.createElement("td"); //创建单元格
                                td1.id='servicename'+x;
                                td1.appendChild(document.createTextNode(data[x].servicename)); //为单元格添加内容
                                row.appendChild(td1); //将单元格添加到行内
                            }


                            else if(y==3)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].location)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }
                            else if(y==4)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].starttime)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }

                            else if(y==5)
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
    });
    function distinguishUserType(usertype){
        if(usertype==0)
        {
            return "admin";
        }

        else if(usertype==1)
        {
            return "manager";
        }

        else if(usertype==2)
        {
            return "volunteer";
        }
    }


</script>

</body>
</html>
