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


    <script type="text/javascript">
        function deleteFunction()
        {
            var del=prompt("AccountID");


        }



        function addPMFunction()
        {
            var add=prompt("AccountID");



        }
        function changeaTOVolunteer() {
            window.location.href="/getVolJsp";
        }


    </script>


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
            <a class="navbar-brand" href="#" style="font-size: small;">HomePage</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">

            <form class="navbar-form navbar-right">
                <!--
                	作者：576253806@qq.com
                	时间：2017-10-11
                	描述：
                <input type="text" class="form-control" placeholder="Search...">-->
                <button type="button" class="btn btn-default navbar-btn">Logout</button>
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
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


            <h1 class="sub-header">Account Information
                <button class="btn btn-default" aria-label="Left Align" title="Add a new Volunteer" onclick="changeaTOVolunteer()">
                    <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>
                </button>
                <button type="submit" class="btn btn-default" aria-label="Left Align" title="Add a Project Manager" onclick="addPMFunction()">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                </button>
                <button type="submit" class="btn btn-default" aria-label="Left Align" title="Delete an account" onclick="deleteFunction()">
                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                </button>

            </h1>

            <div class="table-responsive">
                <div><table class="table table-striped" >
                    <thead>
                    <tr>
                        <th>AccountID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>City</th>
                    </tr>
                    </thead>
                    <tbody id="accountTable">
                    <tr>
                        <td>1,001</td>
                        <td>Lorem</td>
                        <td>ipsum</td>
                        <td>dolor</td>
                        <td>sit</td>
                    </tr>

                    </tbody>
                </table></div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(function() {
        $.ajax(
            {
                type: "POST",
                url: "/getAllAccount",
                success: function (data) {

                    var count = Object.keys(data).length
                    for(var x=0;x<count;x++)
                    {
                        var row=document.createElement("tr"); //创建行

                        for(var y=0;y<5;y++)
                        {
                            if(y==0)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].userid)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }
                            else if(y==1)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].username)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }
                            else if(y==2)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].email)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }
                                else if(y==3)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].phonenumber)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }
                            else if(y==4)
                            {
                                var td1=document.createElement("td"); //创建单元格

                                td1.appendChild(document.createTextNode(data[x].city)); //为单元格添加内容

                                row.appendChild(td1); //将单元格添加到行内
                            }

                        }



                        document.getElementById("accountTable").append(row); //将行添加到<tbody>中
                    }

                }
            })
        });
</script>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
