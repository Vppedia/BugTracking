f<!DOCTYPE html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page isELIgnored="false"%>



<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Project Tracking Management</title>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->

<link href="css/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/bootstrap.min.css">

  <link href="css/style_bug.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/dataTables.bootstrap.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/buttons.dataTables.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css" media="screen" />
  <style>
  #message{color:#fff;}
#message:hover{color:#006780;}
#dtable thead,
#dtable thead,
#dtable thead,
#dtable thead {  background-color: #006780; color: #fff; }
.bug_header{border-bottom:1px solid gray;}
.button_margin{margin-left:100px !important;}

</style>
</head>
<script type="text/javascript">

   function acceptapproval(bugNo){

            document.getElementById("approve"+bugNo).action="btapprove";        
                document.getElementById("approve"+bugNo).method="post";
                document.getElementById("approve"+bugNo).submit();
   }
</script>
<script type="text/javascript">

   function editBug(bugNo){

            document.getElementById("editbug"+bugNo).action="bteditbug";        
                document.getElementById("editbug"+bugNo).method="post";
                document.getElementById("editbug"+bugNo).submit();
   }
</script>
<script type="text/javascript">
$(document).on( "click", '.edit_button',function(e) {
    var bugNo = $(this).data('bugNo');
    var projectName = $(this).data('projectName');
    var bugName = $(this).data('bugName');
    var bugType = $(this).data('bugType');

    $("#projectName").val(projectName);
    $("#bugName").val(bugName);
    $("#bugType").val(bugType);
    tinyMCE.get('#confirm-box1${loop.count}').setContent(approval);   
});

</script>




<body >
<div class="affix" style="width:100%;" >
	<jsp:include page="commonJsp/Header.jsp" />
		<div class="clearfix"></div>
		<div class="breadcumb-wrapper">
			<div class="clearfix">
				<div class="pull-left">
					<ul class="list-inline link-list">
						<li><a href="#">Home</a></li>
						
							<li>Bug Report by QA</li>
					</ul>
				</div>
	
			</div>
		</div></div>




   <div class="container-fluid" style="padding:210px 0px 100px 0px;min-height:738px;">

      

	  <a class="btn btn-primary" href="#" id="myBtn" style="background: #006780;color:#fff; float:left; margin:10px 20px;">New Bug</a>
   
      
     


  
    <table id="dtable" class="table table-bordered display nowrap" style="table-layout:fixed;">
    <thead>
      <tr>
        <th><center>Bug No</center></th>
        	<%-- --<th><center>Date</center></th>--%>
        <th><center>Project</center></th>
		        <th><center>Module</center></th>
		 <th><center>Bug Tittle</center> </th>
		    <th><center>Bug Type</center></th>
		    <th><center>Bug Severity</center></th>
		     <th><center>Bug Status</center></th>
				  <th><center>Assign To</center></th>
				     <th><center>Issue</center></th>
					<th><center>Edit</center></th>
      </tr>
    </thead>
    <tbody>
      	  <c:forEach items="${list}" var="approval" varStatus="loop">  
	<tr>
	      <td>${approval.bugNo}</td>
	     <%--  <td>${approval.date}</td> --%>
             <td>${approval.projectId}</td>
			       <td>${approval.moduleId} </td>
			       <td>${approval.bugTitle} </td>

			        <td>${approval.bugType}</td>
				   <td>${approval.bugSeverity}</td>
                    <td>${approval.bugStatus}</td>
                    <td>${approval.assignTo}</td>
                   


				          
		  <td>
		<%--here we r taking bugNo number for each issue in he hidden so that it cannot be seen on the browser --%>   
	     <form id="approve${approval.bugNo}" method="POST">
          <input type="hidden" value="${approval.bugNo}" name="bugNo"/>
          </form>
      <input type="button" class="btn btn-primary"value="View Issue" onclick="acceptapproval(${approval.bugNo})" style= "background: #006780;color:#fff;"/></td> 
	  	
	  <td>
	     <form id="editbug${approval.bugNo}" method="POST">
          <input type="hidden" value="${approval.bugNo}" name="bugNo"/>
          </form>
      <input type="button" class="btn btn-primary"value="Edit" onclick="editBug(${approval.bugNo})" style="background: #006780;color:#fff;"/>   
    </td>	  	
		</tr>	
</c:forEach>
    </tbody>
  </table>
 
   <!-- Modal -->
  <div class="modal fade " id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>Bug Entry</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px; overflow-y:scroll;  max-height:500px;">
         <form class="form-signin" action="putIntoDB" method="post" enctype="multipart/form-data" >
         
            <div class="form-group">
       Project<sup>*</sup>
       
	      <select class="form-control" name="projectId" id="projectName"  onchange="GetAllModules(this);" required >
							<option value="0">Select The Project</option>
							<option value="Bugtracking">Bugtracking</option>
						<option value="VechileTracking">Vechile Tracking</option>
						
            
          </select> <br>
          	
          
          Modules<sup>*</sup>
	      <select class="form-control" name="moduleId" id="nbmoduleName" onchange="GetAllSubModules(this);"   required >
				<option value="0" selected>Assigned Module</option>	
				<option value="module1" selected>module 1</option>		
				<option value="module2" selected>module 2</option>				
          </select> <br>
          
			<div class="form-group">
               
          Sub Modules<sup>*</sup>
	      <select class="form-control" name="subModuleId" id="nbsubmoduleId" onchange="GetAssignTo(this);" required >
	      <option value="0" selected>Assigned SubModule</option>
	        <option value="subA" selected>Sub module A</option>
	          <option value="subB" selected>Sub module B</option>
	      	
          </select> <br>
     
          
            </div>
            
 <div class="form-group">
 Assigned To<sup>*</sup>
 <select class="form-control" name="assignTo" id="nbassignId"  required >
<option value="Assigned SubModule" selected>Assigned SubModule</option>
<option value="Mr.Yash" selected>Mr.Yash</option>
<option value="Mr.Ashish" selected>Mr.Ashish</option>
<option value="Mr.Himang" selected>Mr.Himang</option>	
<option value="Mr.Vivek" selected>Mr.Vivek</option>

 </select> <br>
     
          
            </div>
     		        	
             </div>
	            <div class="form-group">
	              <label for="bug_name">Bug Tittle</label>
	              <input type="text" class="form-control" id="bugTitle" name="bugTitle"  placeholder="enter bug name">
	            </div>
          
            <!--  </div>
         <div class="form-group">
          Bug Name<sup>*</sup>
	      <select class="form-control" name="bugName" id="bugName"  required >
	      <option value="UI" selected>UI</option>	
	       <option value="" selected></option>
          </select> <br>
          </div> -->
     		        	
         
         
          
       	  <div class="form-group">
            Bug Type
			  <select class="form-control" Name="BugType" id="bugType" >
			  <option value="">--Select One--</option>
			  <option value="Functionality Error">Functionality Error</option>
			  	  <option value="Communication Error">Communication Error</option>
			  	  	  <option value="Missing Command">Missing Command</option>
			  <option value="Syntactic Error">Syntactic Error</option>
			  <option value="Error Handling Error">Error Handling Error</option>
			<option value="Requirement">Requirement</option>
			<option value="Suggestions">Suggestions</option>
		      </select>
          </div>
           <div class="form-group">
              Bug Severity
			  <select class="form-control"  name="bugSeverity" id="bugSeverity" >
			  <option value="">--Select One--</option>
			  <option value="Critical">Critical</option>
			  <option value="Major">Major</option>
			  <option value="Medium">Medium</option>
			  <option value="low">Low</option>
			  </select>
            </div>
            <div class="form-group">
              Bug Status
			  <select class="form-control"  name="bugStatus" id="bugStatus" >
			  <option value="">--Select One--</option>
			  <option value="New">New</option>
			  <option value="Open">Open</option>
			  <option value="Reopen">Reopen</option>
			  <option value="Close">Close</option>
			  </select>
            </div>
          
		  
          				

		   <div class="form-group">
	            <label for="bug discription">Bug Description</label> <br>
		<textarea name="description" rows="4" cols="72" style="resize:none"></textarea>
		</div>
		      
		      
		      <div class="form-group">
              Round<sup>*</sup>
	      <select class="form-control"  name="round" id="round" >
	       <option value="">--Select One--</option>
			  <option value="1">1</option>
			  <option value="2">2</option>
			  <option value="3">3</option>
			  </select> <br>
            </div>
				
			
			  <div class="form-group">
              <label for="file_upload">File Upload</label> <br>
			<input type="file" name="fileData"  id="id" size="40" onchange="checkFileTypeForPhoto(id)" placeholder="choose file">
			</div>
			
			  <div class="form-group">
              <label>Depends</label> <br>
			 <input type="text" class="form-control" id="depends" name="depends">
			</div>
			  <div class="row">
      <div class=" col-sm-6">        <button class="btn  btn-default button_margin " type="submit" id="submit" style="background: #006780;color:#fff;">Submit</button>
			 </div>
 <div class=" col-sm-6"> <button class="btn  btn-default button_margin " type="submit" id="reset" style="background: #006780;color:#fff;">Reset</button>
			</div>  </div>
          </form>
       
		</div>
        <div class="modal-footer">
          <button type="submit" class="btn  btn-default pull-left" data-dismiss="modal"> Cancel</button>
        
        </div>
      </div>
      
    </div>
  </div> 
  
  
 


</div>

	<jsp:include page="commonJsp/Footer.jsp" />


<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
	

});
</script>
<script type="text/javascript">

$(document).on("click", "#edit", function () {
    var bugno = $(this).data('bugno');
    
 
   
    $("#projectId").val($(this).data('projectid'));
    $("#ModueleId").val($(this).data('moduleid'));
    $("confirm-box1${loop.count}").show();
});

  
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="js/dataTables.buttons.min.js"></script> 
<script type="text/javascript" src="js/buttons.flash.min.js"></script> 
<script type="text/javascript" src="js/jszip.min.js"></script> 
<script type="text/javascript" src="js/pdfmake.min.js"></script> 
<script type="text/javascript" src="js/vfs_fonts.js"></script> 
<script type="text/javascript" src="js/buttons.html5.min.js"></script> 
<script type="text/javascript" src="js/buttons.print.min.js"></script> 

<!-- <script>
       
	  $(document).ready(function() {
    $('#dtable').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'excel', 'pdf', 'print'
        ]
	
    } );
} );
</script> -->






</body>






</html>