package com.codeplanet.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.codeplanet.model.Bugtracking;
import com.codeplanet.model.Employee;
import com.codeplanet.sendemail.SendMail;
import com.codeplanet.service.HomeService;

@Controller
public class HomeController 
{  static int x;
	@Autowired
    HomeService homeservice;
	
	
	@RequestMapping (value="/", method=RequestMethod.GET )
	public String home()
	{
	
		return "Home";
		
	}
	@RequestMapping (value="Register", method=RequestMethod.GET )
	public String register()
	{
		
		return "Register"; 
	}
	public String submit(Employee emp)
	{
		homeservice.submit(emp);
		return "Home";
	
		
	}
	@RequestMapping (value="insertIntoDB", method=RequestMethod.POST)
	public String insertIntoDB(HttpServletRequest req,HttpServletResponse res,Employee emp)
	             
	{      
		
          return homeservice.submit(emp);
		
    }
	@RequestMapping (value="putIntoDB", method=RequestMethod.POST)
	public String putIntoDB(HttpServletRequest req,HttpServletResponse res,Bugtracking bug)
	{      System.out.println(bug.getProjectId());
	       System.out.println(bug.getModuleId());
	       System.out.println(bug.getSubModuleId());
	       System.out.println(bug.getAssignTo());
	       System.out.println(bug.getBugType());
	       System.out.println(bug.getBugSeverity());
	       System.out.println(bug.getBugStatus());
	       System.out.println(bug.getRound());
	       System.out.println(bug.getBugTitle());
	       System.out.println(bug.getDepends());
	      
	       
	       String st=doUploadImage(req, bug);
	       System.out.println(st);
	       SendMail sm=new SendMail();
	       if(bug.getBugSeverity().equals("Critical"))
	       {
	    	   
	    	   sm.sendMail("hy there is mail","vivekpandey.2cse19@gmail.com","Mail");
	    	   System.out.println("Mail is send");
	    	   
	    	   
	       }
	       
	       
	       homeservice.insert(bug,st);


          //return homeservice.submitBug(bug);
	       return "redirect:bugShow";
		
    }
	@RequestMapping (value="bugShow")
	public ModelAndView bugDetails(HttpServletRequest rs,Bugtracking bug)
	{
		
		
		List<Bugtracking>list=homeservice.bugShow(bug);
	     rs.setAttribute("list",list);
	     return new ModelAndView("indexqa");
		
	}


	@RequestMapping (value="btapprove", method=RequestMethod.POST)
	public ModelAndView issueDetails(HttpServletRequest rs ,Bugtracking bug)
	
	{
		List<Bugtracking> list=homeservice.issueDetails(bug);
	
         ModelAndView mav=new ModelAndView("Issue");
         x=Integer.parseInt(list.get(0).getBugNo());
         mav.addObject("assign_to",list.get(0).getAssignTo());
         mav.addObject("modname",list.get(0).getModuleId());
         mav.addObject("subModulename",list.get(0).getSubModuleId());
         mav.addObject("subModulename",list.get(0).getSubModuleId());
         mav.addObject("round",list.get(0).getRound());
         mav.addObject("depends",list.get(0).getDepends());

         return mav;
	}

	private String doUploadImage(HttpServletRequest request, Bugtracking fileUploadForm) 
	{
			String uploadRootPath = "E:\\file";
			File uploadRootDir = new File(uploadRootPath);
			if (!uploadRootDir.exists()) {
				uploadRootDir.mkdirs();
			}
			MultipartFile fileData = fileUploadForm.getFileData();
			String uploadedFiles = "";
			String name = fileData.getOriginalFilename();

			if (name != null && name.length() > 0) {
				try {
					File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(fileData.getBytes());
					stream.close();
					
					uploadedFiles = serverFile.getCanonicalPath();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				uploadedFiles = null;
			}
			
			return uploadedFiles; 
		}
	
	
	@RequestMapping(value="/downloadphotoUploadFile", method = RequestMethod.POST)
	public ModelAndView downloadrequest(HttpServletRequest request,HttpServletResponse response,Bugtracking bug)
	{
		bug.setBugNo(Integer.toString(x));
		List<Bugtracking> emp=homeservice.issueDetails(bug);
	String mimeType=null;
	File f=null;
	try{
	f = new File(emp.get(0).getImage());
	mimeType = getMimeType(f.getCanonicalPath());
	} 
	catch (Exception e) {
		List<Bugtracking> list=homeservice.issueDetails(bug);
		
			String message="no file attached";
			ModelAndView modelMapValue = new ModelAndView("Issue","message",message);
			System.out.println("ppppppppppp"+x);
			modelMapValue.addObject("assign_to",list.get(0).getAssignTo());
			modelMapValue.addObject("modname",list.get(0).getModuleId());
			modelMapValue.addObject("subModulename",list.get(0).getSubModuleId());
			modelMapValue.addObject("round",list.get(0).getRound());
			return modelMapValue;
	}
   if (mimeType == null) {        
       mimeType = "application/excel";
   }
           response.setContentType(mimeType);
           response.setHeader("Content-Disposition", "attachment;filename=\"" + f.getName()
                           + "\"");
           response.setContentLength((int) f.length());
           InputStream is = null;
			try {
				is = new FileInputStream(f);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
           ServletOutputStream outStream = null;
			try {
				outStream = response.getOutputStream();
			} catch (IOException e) {
				e.printStackTrace();
			}  
           try {
				org.apache.commons.io.IOUtils.copy(is, outStream);
			} catch (IOException e) {
				e.printStackTrace();
			}
           try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
           try {
				outStream.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
           return new ModelAndView("Issue");
}	
	
	public static String getMimeType(String fName) {
		   fName = fName.toLowerCase();
		   if (fName.endsWith(".jpg") || fName.endsWith(".jpeg") || fName.endsWith(".jpe")) return "image/jpeg";
		   else if (fName.endsWith(".gif")) return "image/gif";
		   else if (fName.endsWith(".pdf")) return "application/pdf";
		   else if (fName.endsWith(".htm") || fName.endsWith(".html")  || fName.endsWith(".htmls") || fName.endsWith(".shtml")) return "text/html";
		   else if (fName.endsWith(".avi")) return "video/x-msvideo";
		   else if (fName.endsWith(".mov") || fName.endsWith(".qt")) return "video/quicktime";
		   else if (fName.endsWith(".mpg") || fName.endsWith(".mpeg") || fName.endsWith(".mpe")) return "video/mpeg";
		   else if (fName.endsWith(".zip")) return "application/zip";
		   else if (fName.endsWith(".tiff") || fName.endsWith(".tif")) return "image/tiff";
		   else if (fName.endsWith(".rtf")) return "application/rtf";
		   else if (fName.endsWith(".mid") || fName.endsWith(".midi")) return "audio/x-midi";
		   else if (fName.endsWith(".xl") || fName.endsWith(".xls") || fName.endsWith(".xlsx") || fName.endsWith(".xlv")
		                   || fName.endsWith(".xla") || fName.endsWith(".xlb") || fName.endsWith(".xlt")
		                   || fName.endsWith(".xlm") || fName.endsWith(".xlk")) return "application/excel";
		   else if (fName.endsWith(".doc") || fName.endsWith(".docx") || fName.endsWith(".dot")) return "application/msword";
		   else if (fName.endsWith(".png")) return "image/png";
		   else if (fName.endsWith(".ppt") || fName.endsWith(".pptx") ) return "application/mspowerpoint";
		   else if (fName.endsWith(".js")) return "application/javascript";
		   else if (fName.endsWith(".xml")) return "text/xml";
		   else if (fName.endsWith(".svg")) return "image/svg+xml";
		   else if (fName.endsWith(".mp3")) return "audio/mp3";
		   else if (fName.endsWith(".ogg")) return "audio/ogg";
		   else return "text/plain";
		}


		

	
	
	
















}
