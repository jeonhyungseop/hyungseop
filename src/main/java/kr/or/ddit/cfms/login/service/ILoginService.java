package kr.or.ddit.cfms.login.service;

import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.login.vo.UserVO;

public interface ILoginService {
	public ServiceResult authenticate(UserVO user);
}