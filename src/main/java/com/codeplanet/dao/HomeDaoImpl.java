package com.codeplanet.dao;

import java.io.FileOutputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.codeplanet.model.Bugtracking;
import com.codeplanet.model.Employee;

@Repository
public class HomeDaoImpl implements HomeDao
{
	@Autowired 
	JdbcTemplate jdbcTemplate;

	@Override
	public String getName( ) 
	{
		
		final String procedureCall = "{call Proc_Bug(?)}";
		Connection connection = null;
		try {
			connection = jdbcTemplate.getDataSource().getConnection();
			CallableStatement callableSt = connection.prepareCall(procedureCall);
			callableSt.setString(1, "Insert");
			
             

			ResultSet rs = callableSt.executeQuery();
			while (rs.next()) {
				//System.out.println(rs.getString("Name"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}


	
		
		
		return "getName()";
	}
	



	@Override
	public String submit(Employee emp) 
	{ String flag="";		
		final String procedureCall = "{call Proc_Bug(?,?)}";
		Connection connection = null;
		try {
			connection = jdbcTemplate.getDataSource().getConnection();
			CallableStatement callableSt = connection.prepareCall(procedureCall);
			callableSt.setString(1, "Checkpassword");
			 callableSt.setString(2,emp.getName());
			


					 String s2="";
					 String s3="";
					 String s4="";
             ResultSet rs1 = callableSt.executeQuery();
             
            if(rs1.next())
          { 
        	  
                

             rs1.getString("Password");
              
          }
          


            if(s2.equals(s4))
            {
              
           return   flag= "redirect:bugShow";


           
            }
           
            else
            	
           return flag="Home";

            } 
		
		catch (SQLException e) 
		{
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		String s3 = emp.getUserName();
		System.out.println("userName entered by the user :-    " +s3);
		String  s4=emp.getPassword();
		System.out.println("Password entered by the user  :-   "  +s4);
	
		return flag;
	
		 
	}

    @Override
	public String show(Bugtracking e) {


		return null;
	}
    
    
    
	@Override
	public void insert(Bugtracking b,String s) 
	{ String flag="";	

		final String procedureCall = "{call Proc_Bug(?,?,?,?,?,?,?,?,?,?,?,?)}";
		Connection connection = null;
		try {
			connection = jdbcTemplate.getDataSource().getConnection();
			CallableStatement callableSt = connection.prepareCall(procedureCall);
			callableSt.setString(1, "Put");
			callableSt.setString(2, b.getProjectId());
			callableSt.setString(3, b.getModuleId());
			callableSt.setString(4, b.getBugSeverity());
			callableSt.setString(5, b.getBugStatus());
			callableSt.setString(6, b.getBugType());
			callableSt.setString(7, b.getRound());
			callableSt.setString(8, b.getSubModuleId());
			callableSt.setString(9, b.getAssignTo());
			callableSt.setString(10,s);
			callableSt.setString(11, b.getBugTitle());
			callableSt.setString(12, b.getDepends());
	     
			
             int x=callableSt.executeUpdate();


			

		}

		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
}
    
    
	@Override
	public List<Bugtracking> bugShow(Bugtracking ba)
	{
		
		final String procedureCall = "{call Proc_Bug(?)}";
		Connection connection = null;
		List<Bugtracking> l= new ArrayList<Bugtracking>();
		try {
			connection = jdbcTemplate.getDataSource().getConnection();
			CallableStatement callableSt = connection.prepareCall(procedureCall);
			    callableSt.setString(1,"BugShow");
			    
			    HSSFWorkbook h= new HSSFWorkbook();
				HSSFSheet sh=h.createSheet("BugSheet");
				HSSFRow rf=sh.createRow((short)0);
			  rf.createCell((short)0).setCellValue("bugNo");
			  rf.createCell((short)1).setCellValue("projectId");
			  rf.createCell((short)2).setCellValue("modelId");
			  rf.createCell((short)3).setCellValue("bugTitle");
			  rf.createCell((short)4).setCellValue("bugType");
			  rf.createCell((short)5).setCellValue("bugSeverity");
			  rf.createCell((short)6).setCellValue("bugSatus");
			  rf.createCell((short)7).setCellValue("assginTo");
				
			    
			    
			    
			    
			ResultSet rs=callableSt.executeQuery();
			int i=1;
			while(rs.next())
			{	
				Bugtracking b= new Bugtracking();
				b.setBugNo(rs.getString("bugNo"));
				b.setProjectId(rs.getString("projectId"));
				b.setModuleId(rs.getString("moduleId"));
				b.setAssignTo(rs.getString("assignTo"));
				b.setBugSeverity(rs.getString("BugSeverity"));
				b.setBugStatus(rs.getString("BugStatus"));
				b.setBugTitle(rs.getString("bugTitle"));
				b.setDepends(rs.getString("Depends"));
				
				b.setBugType(rs.getString("BugType"));
				b.setSubModuleId(rs.getString("subModuleId"));

				HSSFRow rf1=sh.createRow((short)i);
				  rf1.createCell((short)0).setCellValue(rs.getString("bugNo"));
				  rf1.createCell((short)1).setCellValue(rs.getString("projectId"));
				  rf1.createCell((short)2).setCellValue(rs.getString("moduleId"));
				  rf1.createCell((short)3).setCellValue(rs.getString("bugTitle"));
				  rf1.createCell((short)4).setCellValue(rs.getString("BugType"));
				  rf1.createCell((short)5).setCellValue(rs.getString("BugSeverity"));
				  rf1.createCell((short)6).setCellValue(rs.getString("BugStatus"));
				  rf1.createCell((short)7).setCellValue(rs.getString("assignTo"));
								


               i++;
                
		       l.add(b);
			}
			

			String yemi="D:/BugSheet.xls";
	        FileOutputStream fileOut = new FileOutputStream(yemi);
	        h.write(fileOut);
	        fileOut.close();

		
			
			


			
			
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}


	
		
		
		return l;
	}
	

	@Override
	public List<Bugtracking> issueDetails(Bugtracking ba)
	{
		
		final String procedureCall = "{call Proc_Bug(?,?)}";
		Connection connection = null;
		List<Bugtracking> l= new ArrayList<Bugtracking>();
		try {
			connection = jdbcTemplate.getDataSource().getConnection();
			CallableStatement callableSt = connection.prepareCall(procedureCall);
			    callableSt.setString(1,"IssueShow");
			    callableSt.setString(2,ba.getBugNo());
			ResultSet rs=callableSt.executeQuery();
			
			while(rs.next())
			{
				Bugtracking b= new Bugtracking();
				b.setBugNo(rs.getString("bugNo"));
				b.setProjectId(rs.getString("projectId"));
				b.setModuleId(rs.getString("moduleId"));

				b.setSubModuleId(rs.getString("subModuleId"));

				b.setAssignTo(rs.getString("assignTo"));

				b.setBugType(rs.getString("BugType"));

				
				b.setBugSeverity(rs.getString("BugSeverity"));

				b.setBugStatus(rs.getString("BugStatus"));
;
				b.setRound(rs.getString("roundNo"));
                b.setImage(rs.getString("fName"));
                b.setBugTitle(rs.getString("bugTitle"));
                System.out.println(rs.getString("fName"));
                b.setDepends(rs.getString("Depends"));
				l.add(b);
			}
	
		
			
			


			
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}


	
		
		
		return l;
	}

   
    
    
    
    
    
	

}
