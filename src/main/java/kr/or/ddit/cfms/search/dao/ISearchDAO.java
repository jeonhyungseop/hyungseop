package kr.or.ddit.cfms.search.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface ISearchDAO {
	public String searchHead(Map<String, String> dataValues);
	
	public String searchEmp(Map<String, String> dataValues);
	
	public String searchFran(Map<String, String> dataValues);
	
	public int updateHeadPw(Map<String, String> dataValues);
	
	public int updateEmpPw(Map<String, String> dataValues);
	
	public int updateFranPw(Map<String, String> dataValues);
}