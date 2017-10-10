<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <title>Volunteer work scheduling website</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="description" content="Expand, contract, animate forms with jQuery wihtout leaving the page" />
    <meta name="keywords" content="expand, form, css3, jquery, animate, width, height, adapt, unobtrusive javascript"/>
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="../../css/style.css" />
    <script src="../../js/cufon-yui.js" type="text/javascript"></script>
    <script src="../../js/ChunkFive_400.font.js" type="text/javascript"></script>
    <script type="text/javascript">
        Cufon.replace('h1',{ textShadow: '1px 1px #fff'});
        Cufon.replace('h2',{ textShadow: '1px 1px #fff'});
        Cufon.replace('h3',{ textShadow: '1px 1px #000'});
        Cufon.replace('.back');
    </script>
    <style type="text/css">
        .form_wrapper span.successinfer{
            visibility:hidden;
            color:green;
            font-size:11px;
            font-style:italic;
            display:block;
            margin:-10px 30px 5px 185px;
        }
    </style>

</head>
<body>
<div class="wrapper">
    <h1 style="text-align: center">Welcome to Volunteer Work Scheduling Website</h1>

    <div class="content">
        <div id="form_wrapper" class="form_wrapper">
            <form class="register">
                <h3>Register</h3>
                <div class="column">
                    <div>
                        <label>Username:</label>
                        <input type="text" id="Rusername"/>
                        <span class="error">This is an error</span>
                    </div>
                    <div>
                        <label>Password:</label>
                        <input type="password" id="Rpassword"/>
                        <span class="error">This is an error</span>
                    </div>
                    <div>
                        <label>Email:</label>
                        <input type="text" id="Remail" />
                        <span class="error">This is an error</span>
                    </div>
                </div>
                <div class="column">
                    <div>
                        <label>Phone Number:</label>
                        <input type="text" id="Rphonenumber"/>
                        <span class="error">This is an error</span>
                    </div>
                    <div>
                        <label>Password again:</label>
                        <input type="password" id="Rpassword2"/>
                        <span class="error" id="passworderror">This is an error</span>
                    </div>
                    <div>
                        <label>city:</label>
                        <input type="text" id="Rcity"/>
                        <span class="error">This is an error</span>
                    </div>
                </div>
                <%--注册--%>
                <div class="bottom">
                    <div class="remember">
                        <input type="checkbox" />
                        <span>Send me updates</span>
                    </div>
                    <input type="submit" value="Register" onclick="register()"/>
                    <a href="index.html" rel="login" class="linkform">You have an account already? Log in here</a>
                    <div class="clear"></div>
                </div>
            </form>
            <%--登陆--%>
            <form class="login active">
                <h3>Login</h3>
                <div>
                    <label>Username:</label>
                    <input type="text"  id="username"/>
                    <span class="error">This is an error</span>
                </div>
                <div>
                    <label>Password: <a href="forgot_password.html" rel="forgot_password" class="forgot linkform">Forgot your password?</a></label>
                    <input type="password"  id="password"/>
                    <span class="error" id="loginerror">This is an error</span>
                </div>
                <div class="bottom">
                    <div class="remember"><input type="checkbox" /><span>Keep me logged in</span></div>

                    <input type="submit" value="Login" onclick="Login()"/>
                    <a href="register.html" rel="register" class="linkform">You don't have an account yet? Register here</a>
                    <div class="clear"></div>
                </div>
            </form>
            <form class="forgot_password">
                <h3>Forgot Password</h3>
                <div>
                    <label>Username or Email:</label>
                    <input type="text" id="Femail" spellcheck="false"/>
                    <span class="error" id="emailerror">This is an error</span>
                    <span class="successinfer" id="successinfer">send successfully</span>
                </div>
                <div class="bottom">
                    <input type="submit" value="Send reminder" onclick="forgotpassword()"></input>
                    <a href="index.html" rel="login" class="linkform">Suddenly remebered? Log in here</a>
                    <a href="register.html" rel="register" class="linkform">You don't have an account? Register here</a>
                    <div class="clear"></div>
                </div>
            </form>
        </div>
        <div class="clear"></div>
    </div></div>

<script type="text/javascript">
    
    function forgotpassword() {
      var email=document.getElementById("Femail").value;
        var error = document.getElementById("emailerror");
        error.style.visibility="hidden";
        var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        var isok= reg.test(email);
        console.log(isok);
      if (email==""||isok==false)
      {
        error.style.visibility="visible";
          return;
      }
        $.ajax(
            {
                type: "POST" ,
                url: "/sendEmailServlet",
                data: "email=" +email,
                dataType: "text" ,
                success: function (data)
                {
                    var success = document.getElementById("successinfer");
                    success.style.visibility="visible";
                }
            }
        );
    }
function register() {
    var username=document.getElementById("Rusername").value;
    var password=document.getElementById("Rpassword").value;
    var email=document.getElementById("Remail").value;
    var phonenumber=document.getElementById("Rphonenumber").value;
    var password2=document.getElementById("Rpassword2").value;
    var city=document.getElementById("Rcity").value;
if(password!=password2)
{
    var error = document.getElementById("passworderror");
    error.style.visibility="visible";
    return;
}
    $.ajax(
        {
            type: "POST" ,
            url: "/createAccountServlet",
            data: "username=" +username+"&password=" +password+"&email="+email+"&phonenumber="+phonenumber+"&city="+city,
            dataType: "text" ,
            success: function (data)
            {
               //delayUrl();
                window.location.href="testJsp.jsp";
            }
        }
    );
}


    function Login() {
        var username =document.getElementById("username").value;
        var password =document.getElementById("password").value;

        $.ajax(
            {
                type: "POST" ,
                url: "/loginFunction" ,
                data: "username=" +username+"&password=" +password ,
                dataType: "text" ,
                success: function (data)
                {
                   console.log(data);
                    if(data=="0")
                   {
                       var error = document.getElementById("loginerror");
                       error.style.visibility="visible";
                       return;
                   }
                    else
                   {
                       console.log("data is %s",data);
                       window.location.href="../../";
                   }
                }
            }
        );


    }
</script>

        <!-- The JavaScript -->
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript">



            $(function() {
                //the form wrapper (includes all forms)
                var $form_wrapper	= $('#form_wrapper'),
                    //the current form is the one with class active
                    $currentForm	= $form_wrapper.children('form.active'),
                    //the change form links
                    $linkform		= $form_wrapper.find('.linkform');

                //get width and height of each form and store them for later
                $form_wrapper.children('form').each(function(i){
                    var $theForm	= $(this);
                    //solve the inline display none problem when using fadeIn fadeOut
                    if(!$theForm.hasClass('active'))
                        $theForm.hide();
                    $theForm.data({
                        width	: $theForm.width(),
                        height	: $theForm.height()
                    });
                });

                //set width and height of wrapper (same of current form)
                setWrapperWidth();

                /*
                clicking a link (change form event) in the form
                makes the current form hide.
                The wrapper animates its width and height to the
                width and height of the new current form.
                After the animation, the new form is shown
                */
                $linkform.bind('click',function(e){
                    var $link	= $(this);
                    var target	= $link.attr('rel');
                    $currentForm.fadeOut(400,function(){
                        //remove class active from current form
                        $currentForm.removeClass('active');
                        //new current form
                        $currentForm= $form_wrapper.children('form.'+target);
                        //animate the wrapper
                        $form_wrapper.stop()
                            .animate({
                                width	: $currentForm.data('width') + 'px',
                                height	: $currentForm.data('height') + 'px'
                            },500,function(){
                                //new form gets class active
                                $currentForm.addClass('active');
                                //show the new form
                                $currentForm.fadeIn(400);
                            });
                    });
                    e.preventDefault();
                });

                function setWrapperWidth(){
                    $form_wrapper.css({
                        width	: $currentForm.data('width') + 'px',
                        height	: $currentForm.data('height') + 'px'
                    });
                }

                /*
                for the demo we disabled the submit buttons
                if you submit the form, you need to check the
                which form was submited, and give the class active
                to the form you want to show
                */
                $form_wrapper.find('input[type="submit"]')
                    .click(function(e){
                        e.preventDefault();
                    });
            });
        </script>
</body>
</html>