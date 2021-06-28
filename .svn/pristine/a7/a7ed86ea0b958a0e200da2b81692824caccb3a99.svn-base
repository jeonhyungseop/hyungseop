package kr.or.ddit.cfms.search.service;

import java.security.NoSuchAlgorithmException;
import java.util.Map;
import javax.inject.Inject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import kr.or.ddit.cfms.search.dao.ISearchDAO;
import kr.or.ddit.cfms.utils.CryptoUtil;

@Service
public class SearchServiceImpl implements ISearchService {
	@Inject
	private ISearchDAO dao;

	@Override
	public String retrieveUser(Map<String, String> dataValues) {
		String group = dataValues.get("group");
		String id = null;
		if(group.equals("head")) {
			id = dao.searchHead(dataValues);
		}else if(group.equals("head_emp")) {
			id = dao.searchEmp(dataValues);
		}else if(group.equals("fran")) {
			id = dao.searchFran(dataValues);
		}
		
		return id;
	}

	@Override
	public int changePassword(Map<String, String> dataValues) {
		String group = dataValues.get("group");
		encodePassword(dataValues);
		int cnt = 0;
		if(group.equals("head")) {
			cnt = dao.updateHeadPw(dataValues);
		}else if(group.equals("head_emp")) {
			cnt = dao.updateEmpPw(dataValues);
		}else if(group.equals("fran")) {
			cnt = dao.updateFranPw(dataValues);
		}
		
		return cnt;
	}
	
	private void encodePassword(Map<String, String> dataValues) {
		String password = dataValues.get("password");
		if(StringUtils.isBlank(password)) return;
		try {
			String encodedPass = CryptoUtil.sha512(password);
			dataValues.put("password", encodedPass);
		} catch(NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

}