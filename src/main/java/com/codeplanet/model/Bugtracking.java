package com.codeplanet.model;

import org.springframework.web.multipart.MultipartFile;

public class Bugtracking 
{
	private  String projectId;
	private  String moduleId;
	private  String  subModuleId;
	private  String assignTo;
	private  String bugType;
	private  String bugSeverity;
	private  String bugStatus;
	private  String round;
	private String bugNo;
	private String fname;
	private String image;
	private String bugTitle;
	private String depends;
	public String getDepends() {
		return depends;
	}
	public void setDepends(String depends) {
		this.depends = depends;
	}
	public String getBugTitle() {
		return bugTitle;
	}
	public void setBugTitle(String bugTitle) {
		this.bugTitle = bugTitle;
	}


	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	private MultipartFile fileData;
	
	
	public MultipartFile getFileData() {
		return fileData;
	}
	public void setFileData(MultipartFile fileData) {
		this.fileData = fileData;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getBugNo() {
		return bugNo;
	}
	public void setBugNo(String bugNo) {
		this.bugNo = bugNo;
	}
	public String getBugSeverity() {
		return bugSeverity;
	}
	public String getBugType() {
		return bugType;
	}
	public void setBugType(String bugType) {
		this.bugType = bugType;
	}
	public void setBugSeverity(String bugSeverity) {
		this.bugSeverity = bugSeverity;
	}
	public String getBugStatus() {
		return bugStatus;
	}
	public void setBugStatus(String bugStatus) {
		this.bugStatus = bugStatus;
	}
	public String getRound() {
		return round;
	}
	public void setRound(String round) {
		this.round = round;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getModuleId() {
		return moduleId;
	}
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}
	public String getSubModuleId() {
		return subModuleId;
	}
	public void setSubModuleId(String subModuleId) {
		this.subModuleId = subModuleId;
	}
	public String getAssignTo() {
		return assignTo;
	}
	public void setAssignTo(String assignTo) {
		this.assignTo = assignTo;
	}
 
	
	

}
