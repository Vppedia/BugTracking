package com.codeplanet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codeplanet.dao.HomeDao;
import com.codeplanet.model.Bugtracking;
import com.codeplanet.model.Employee;
@Service	
public class HomeServiceImpl implements HomeService {
	@Autowired
	HomeDao homeDao;
public String getName()
{
	
return  homeDao.getName();
}

public String  submit(Employee emp)
{
return homeDao.submit(emp);	  
}
public String show(Bugtracking b)

{
	return homeDao.show(b);
}

public void insert(Bugtracking b ,String s)
{
	 homeDao.insert(b,s);

}
public List<Bugtracking> bugShow(Bugtracking b)
{
	return homeDao.bugShow(b);
	
}
public List<Bugtracking> issueDetails(Bugtracking b)
{
	return homeDao.issueDetails(b);
	
}

}
