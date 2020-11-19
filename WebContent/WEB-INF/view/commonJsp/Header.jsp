<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom -->
<link href="css/custom.css" rel="stylesheet">

<link rel="stylesheet" href="css/font-awesome.css">

<!-- CSS STYLE-->
<link rel="stylesheet" type="text/css" href="css/style.css"
        media="screen" />
        <link href="css/style_new.css" rel="stylesheet">

	<style>
.dropbtn {
    background-color: white;
    color: black;
    border: none;
    cursor: pointer;
}

.dropdown {
    position: relative;
    display: inline-block;
}
.dropdown a:active{background-color:#006780;color:#fff;}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
     min-width:133px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a{
    color: black;
    padding: 12px 8px;
    text-decoration: none !important;
    display: block;
    border:none;
     
}

.dropdown-content a:hover {background-color:#006780 !important;color:#fff;}

.dropdown:hover .dropdown-content {
    display: block;
}
.login_focus:focus{background-color:#006780 !important;color:#fff;}
.nav > li > a:focus, .nav > li > a:hover{padding:10px !important;}
 .login_focus:hover{margin-top:5px;}
	 .login_focus:focus{margin-top:5px;}
	</style>



  <header>
  <nav class="navbar  margin_bottom  nav_height header">
  <div class="container-fluid ">
    <div class="navbar-header">
   
      <a href="#"><img src="images/logo_pre.png"/></a>
     
    </div>
    <div class="collapse navbar-collapse padd" id="myNavbar">
      
      <ul class="nav navbar-nav navbar-right">
	    <!--<li><a href="#"><i class="fa fa-bell margin_icon" aria-hidden="true"></i></a></li>
        <li><a href="#"><i class="fa fa-user margin_icon" aria-hidden="true"></i>Hi User</a></li>-->
             <li class="dropdown">
	   <a href="#" class="dropdown-toggle login_focus" data-toggle="dropdown" >Employee<i class="fa fa-user" aria-hidden="true" style="margin:5px;"></i></a>
	   <ul class="dropdown-menu">
        <li> <a target="" href="#">Update Details <i class="fa fa-user" style="margin-left:10px; aria-hidden="true"></i></a></li>
        <li> <a href="#">Logout<i class="fa fa-sign-out" style="margin-left:10px; " aria-hidden="true"></i></a></li>
          
      </ul>
     </li>
      </ul>
    </div>
  </div>
</nav>
 
                <div class="bottom-nav-menu">
                       

                        <div class="navbar-wrapper">
                                <div class="container-fluid">
                                        <nav class="navbar ">
                                                <div class="container-fluid">
                                                 
                                                        
                                                                <div id="navbar" class="navbar-collapse collapse">
                                                                        <ul class="nav navbar-nav">
                                                                          
                                                                                <li class=" dropdown"><a href="#"
                                                                                        class="dropdown-toggle margin_list" data-toggle="dropdown" role="button"
                                                                                        aria-haspopup="true" aria-expanded="false">Add Project <span
                                                                                                class="caret"></span></a>
                                                                                        <ul class="dropdown-menu">

                                                                                                <li><a href="#">Add Projects</a></li>
                                                                                                <li><a href="#">Add Modules</a></li>
                                                                                                <li><a href="#">Add SubModules</a></li>
                                                                                                
                                                                                        </ul></li>
                                                                                <li class=" dropdown"><a href="#"
                                                                                        class="dropdown-toggle " data-toggle="dropdown" role="button"
                                                                                        aria-haspopup="true" aria-expanded="false">Assign Project <span
                                                                                                class="caret"></span></a>
                                                                                        <ul class="dropdown-menu">
                                                                                                <li><a href="#">Assign Project</a></li>

                                                                                        </ul>
                                                                                <li class=" dropdown"><a href="#"
                                                                                        class="dropdown-toggle " data-toggle="dropdown" role="button"
                                                                                        aria-haspopup="true" aria-expanded="false">View Progress <span
                                                                                                class="caret"></span></a>
                                                                                        <ul class="dropdown-menu">
                                                                                                <li><a href="#">Graph Generation </a></li>
                                                                                                <li><a href="#">Excel Generation</a></li>
                                                                                        </ul></li>
                                                                                <li class=" dropdown"><a href="#"
                                                                                        class="dropdown-toggle " data-toggle="dropdown" role="button"
                                                                                        aria-haspopup="true" aria-expanded="false">Finished Project<span
                                                                                                class="caret"></span> </a>
                                                                                        <ul class="dropdown-menu">
                                                                                                <li><a href="#">Finished Project</a></li>
                                                                                        </ul>
                                                                                       </li>
                                                
                                                                        </ul>

                                                                </div>

                                                </div>
                                        </nav>
                                </div>
                        </div>
                </div>
        </header>
</html>
		