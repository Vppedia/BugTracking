<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Project Tracking Management</title>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom -->
<link href="css/custom.css" rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/font-awesome.css">

<!-- CSS STYLE-->
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" />

<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
<link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css"
	media="screen" />
<style>
body {
  background: #eee !important;
}

sup {
    vertical-align: super;
    font-size: 1.0em;
    color: red;
}

.wrapper {
  margin-top: 80px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 30px 35px;
 margin-bottom:50px;
  background-color: #fff;
 margin-left: 30px;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 30px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  font-size: 16px;
  height: auto;
  padding: 10px;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 20px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

</style>
</head>

  <link rel='stylesheet prefetch' href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>

      <link rel="stylesheet" href="css/style.css">
      
      
<body>
 

                       
<div class="" style="padding-top:200px;padding-bottom:100px;">

        <div class="panel panel-primary" style="width:476px;border:none;margin-left:465px;">
      <div class="panel-heading"><b>Register</b></div>
      <div class="panel-body" >
          <form class="form-horizontal form-signin" action="" method="post"> 
          
        
         
	      <h2 class="form-signin-heading">Please Register</h2>
	    
	      
	      <b>Name</b><sup>*</sup><input type="text" class="form-control" id="name" name="name" placeholder="NAME" required autofocus/><br>
	      <b>UserName</b><sup>*</sup><input type="text" class="form-control" id="userName" name="userName" placeholder="USERNAME" required autofocus/><br>
	      <b>EmailId</b><sup>*</sup><input type="email" class="form-control" id="email" name="email" placeholder="EMAIL" required autofocus/><br>
        
          
       
	    
          	      
	     
	        <b>Field</b><sup>*</sup>
	      <select class="form-control" name="#" id="#" required>
							<option value="0">Select Your Designation</option>
							
          </select> <br>
	  
	      
	        <b>Password</b><sup>*</sup><input type="password" class="form-control" id="#" name="#" placeholder="PASSWORD" required autofocus/>
	         	      
	      <b>Confirm Password</b><sup>*</sup><input type="password" class="form-control" id="#" name="#" placeholder="RE-ENTER PASSWORD" required autofocus/>
	       
	      <span id="message" style="color:red"></span>
	      <br>
	      <br>
	      
		      
		        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button> 
	        
              
		     
          
    </form>
    </div></div>
</div>

</body>
</html>
