package kr.or.ddit.cfms.login.service;

import java.lang.reflect.InvocationTargetException;
import javax.inject.Inject;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.mypage.dao.IFranMypageDAO;
import kr.or.ddit.cfms.fran.mypage.vo.franMypageVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.headmypage.dao.IHHeadMypageDAO;
import kr.or.ddit.cfms.head.mypage.dao.IHeadMypageDAO;
import kr.or.ddit.cfms.head.mypage.service.IAuthenticateService;
import kr.or.ddit.cfms.head.mypage.vo.headVO;
import kr.or.ddit.cfms.login.dao.ILoginDAO;
import kr.or.ddit.cfms.login.vo.CustomUserDetails;
import kr.or.ddit.cfms.login.vo.UserVO;
import kr.or.ddit.cfms.utils.CryptoUtil;

@Service("authService")
public class LoginServiceImpl implements ILoginService, UserDetailsService,IAuthenticateService{

	private static final Logger logger =
			LoggerFactory.getLogger(LoginServiceImpl.class);
	@Inject
	private ILoginDAO loginDAO;
	@Inject
	private IHeadMypageDAO dao;
	@Inject
	private IHHeadMypageDAO HHdao;
	@Inject
	private IFranMypageDAO franDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO savedMember = loginDAO.selectForAuth(username);
		if(savedMember == null) {
			throw new UsernameNotFoundException("사용자를 찾을 수 없음");
		}
		return new CustomUserDetails(savedMember);
	}
	
	@Override
	public ServiceResult authenticate(UserVO user) {
		UserVO savedUser = loginDAO.selectForAuth(user.getId());
		ServiceResult result  = null;
		if(savedUser != null) {
			String inputPass = user.getPass();
			try {
				String encodedPass = CryptoUtil.sha512(inputPass);
				String savedPass = savedUser.getPass();
				if(savedPass.equals(encodedPass)) {
					try {
						BeanUtils.copyProperties(user, savedUser);
					}catch (IllegalAccessException | InvocationTargetException e) {
						throw new RuntimeException(e);
					}
					
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.INVALIDPASSWORD;
				}
			}catch (Exception e) {
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}
	
	@Override
	public ServiceResult myauthenticate(EmployeeVO member) {
	
		EmployeeVO savedMember = dao.selectMemberForAuth(member.getEmp_id());
		ServiceResult result = null;
		if(savedMember!=null) {
			String inputPass = member.getEmp_pass();
			try {
				String encodedPass = CryptoUtil.sha512(inputPass);
				String savedPass = savedMember.getEmp_pass();
				if(savedPass.equals(encodedPass)) {
					try {
						BeanUtils.copyProperties(member, savedMember);
					} catch (IllegalAccessException | InvocationTargetException e) {
						throw new RuntimeException(e);
					}
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.INVALIDPASSWORD;
				}
			}catch (Exception e) {
				logger.error("", e);
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}
	
	@Override
	public ServiceResult myheadauthenticate(headVO member) {
		
		headVO savedMember = dao.selectHeadMemberForAuth(member.getHead_id());
		ServiceResult result = null;
		if(savedMember!=null) {
			String inputPass = member.getHead_pass();
			try {
				String encodedPass = CryptoUtil.sha512(inputPass);
				String savedPass = savedMember.getHead_pass();
				if(savedPass.equals(encodedPass)) {
					try {
						BeanUtils.copyProperties(member, savedMember);
					} catch (IllegalAccessException | InvocationTargetException e) {
						throw new RuntimeException(e);
					}
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.INVALIDPASSWORD;
				}
			}catch (Exception e) {
				logger.error("", e);
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	@Override
	public ServiceResult myfranauthenticate(franMypageVO member) {
	
		franMypageVO savedMember = franDao.selectFranMemberForAuth(member.getFran_id());
		ServiceResult result = null;
		if(savedMember!=null) {
			String inputPass = member.getFran_pass();
			try {
				String encodedPass = CryptoUtil.sha512(inputPass);
				String savedPass = savedMember.getFran_pass();
				if(savedPass.equals(encodedPass)) {
					try {
						BeanUtils.copyProperties(member, savedMember);
					} catch (IllegalAccessException | InvocationTargetException e) {
						throw new RuntimeException(e);
					}
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.INVALIDPASSWORD;
				}
			}catch (Exception e) {
				logger.error("", e);
				result = ServiceResult.FAIL;
			}
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}


	


	
}
