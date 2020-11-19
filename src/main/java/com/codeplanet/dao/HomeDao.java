package com.codeplanet.dao;

import java.util.List;

import com.codeplanet.model.Bugtracking;
import com.codeplanet.model.Employee;

public interface HomeDao {

	public String getName();
	public  String submit(Employee emp);
     public String show(Bugtracking b);
     public void insert(Bugtracking b,String s);
     public List<Bugtracking> bugShow(Bugtracking b);
     public List<Bugtracking> issueDetails(Bugtracking b);
}
