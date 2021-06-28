package kr.or.ddit.cfms.search.service;

import java.util.Map;

public interface ISearchService {	
	public String retrieveUser(Map<String, String> dataValues);

	public int changePassword(Map<String, String> dataValues);
}