package kr.or.ddit.cfms.login.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.exception.BadRequestException;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.fran.mypage.dao.IFranMypageDAO;
import kr.or.ddit.cfms.fran.mypage.vo.franMypageVO;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.commute.vo.DclzVO;
import kr.or.ddit.cfms.head.employee.dao.IHeadEmployeeDAO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.mypage.dao.IHeadMypageDAO;
import kr.or.ddit.cfms.head.mypage.vo.headVO;
import kr.or.ddit.cfms.login.dao.ILoginDAO;
import kr.or.ddit.cfms.login.vo.UserVO;

/**
 * @author 진유리
 * @since 2021. 06. 01
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일               		 수정자               수정내용
 * ------------    --------    ----------------------
 * 2021. 06. 01         진유리      		최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	@Inject
	private ILoginDAO dao;
	
	@Inject
	private IHeadEmployeeDAO headDAO;
	
	@Inject
	private IHeadMypageDAO headMyDAO;
	
	@Inject
	private IFranMypageDAO franMyDAO;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.info("authentication : " + authentication);
		HttpSession session = request.getSession();
		
		if(session.isNew()) {
			throw new BadRequestException("비정상 세션");
		}
		
		String id = authentication.getName();
		UserVO user = dao.selectForAuth(id);
		String role = user.getRole();
		String code = "";
		String view = "/";
		String name = "";
		Cookie idCookie = new Cookie("idCookie", id);
		idCookie.setPath(request.getContextPath());
		int maxAge = 0;
		if("remember-id".equals(request.getParameter("remember-id"))) {
			maxAge = 60*60*24*7;
		}
		idCookie.setMaxAge(maxAge);
		response.addCookie(idCookie);
		if(role.equals("ROLE_ADMIN")) {
			view = "/admin/main";
		}else if(role.equals("ROLE_HEAD")) {
			HeadquartersVO headVO = dao.selectHead(id);
			headVO headImgVO = headMyDAO.selectHeadMy(id);
			logger.info("전형섭+{}",headImgVO.getAttachfileList());
			headMyimageBase(headImgVO);
			session.setAttribute("headImgVO", headImgVO);
			code = headVO.getHead_code();
			view = "/head/main";
		}else if(role.equals("ROLE_FRAN")) {
			FranchiseVO franVO = dao.selectFran(id);
			franMypageVO franImgVO = franMyDAO.selectFranMy(id);
			franMyimageBase(franImgVO);
			session.setAttribute("franImgVO", franImgVO);
			code = franVO.getFran_code();
			view = "/fran/main";
		}else if(role.equals("ROLE_EMP")) {
			EmployeeVO empVO = dao.selectEmp(id);
			EmployeeVO empImgVO = headDAO.selectEmpOne(id); //직원이미지
			logger.info("전형섭2+{}",empImgVO.getAttachfileList());
			imageBase(empImgVO);

			DclzVO dclzVO = headDAO.selectAttendCheck(id);//직원출근체크 여부
			if(dclzVO != null) {
				session.setAttribute("dclzVO", dclzVO);
			}
			session.setAttribute("empImgVO", empImgVO);
			code = empVO.getHead_code();
			view = "/head/main";
		}else if(role.equals("ROLE_HEAD_PROD")) {
			HeadquartersVO headVO = dao.selectHead(id);
			code = headVO.getHead_code();
			view = "/head/systemprod";
		}
		
		session.setAttribute("authId", id);
		session.setAttribute("code", code);
		session.setAttribute("name", user.getName());
		
		response.sendRedirect(request.getContextPath()+view);
	}
	
	
	private void imageBase(EmployeeVO employeeVO) {
		
		InputStream imageStream;
		if(employeeVO.getAttachfileList().size() > 0 || !employeeVO.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : employeeVO.getAttachfileList()) {
				try {
					// FileInputStream으로 파일을 불러온다
					imageStream = new FileInputStream(attach.getFile_path()+"/"+attach.getSave_filenm());
					// IOUtils.toByteArray 바이트배열로 바꿔서 저장
					byte[] imageBtyeArray = IOUtils.toByteArray(imageStream);
					imageStream.close();
					// 이진데이터로 바꾼다
					// 바이트배열을 Base64.encodeBase64형식에 맞춰서 인코딩 하는 작업
					byte[] encodeBase64 = Base64.encodeBase64(imageBtyeArray);
					// 인코딩 된 데이터를 보내준다.
					String base64DataString = new String(encodeBase64, "UTF-8");
					// file_img저장될때는 사용되는게 아니고 이미지를 표현할떄 사용된다.
					attach.setFile_img(base64DataString);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}
	}
	
	private void headMyimageBase(headVO employeeVO) {
		
		InputStream imageStream;
		if(employeeVO.getAttachfileList().size() > 0 || !employeeVO.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : employeeVO.getAttachfileList()) {
				try {
					// FileInputStream으로 파일을 불러온다
					imageStream = new FileInputStream(attach.getFile_path()+"/"+attach.getSave_filenm());
					// IOUtils.toByteArray 바이트배열로 바꿔서 저장
					byte[] imageBtyeArray = IOUtils.toByteArray(imageStream);
					imageStream.close();
					// 이진데이터로 바꾼다
					// 바이트배열을 Base64.encodeBase64형식에 맞춰서 인코딩 하는 작업
					byte[] encodeBase64 = Base64.encodeBase64(imageBtyeArray);
					// 인코딩 된 데이터를 보내준다.
					String base64DataString = new String(encodeBase64, "UTF-8");
					// file_img저장될때는 사용되는게 아니고 이미지를 표현할떄 사용된다.
					attach.setFile_img(base64DataString);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}
	}
	private void franMyimageBase(franMypageVO employeeVO) {
		
		InputStream imageStream;
		if(employeeVO.getAttachfileList().size() > 0 || !employeeVO.getAttachfileList().isEmpty()) {
			
			for(AttachfileVO attach : employeeVO.getAttachfileList()) {
				try {
					// FileInputStream으로 파일을 불러온다
					imageStream = new FileInputStream(attach.getFile_path()+"/"+attach.getSave_filenm());
					// IOUtils.toByteArray 바이트배열로 바꿔서 저장
					byte[] imageBtyeArray = IOUtils.toByteArray(imageStream);
					imageStream.close();
					// 이진데이터로 바꾼다
					// 바이트배열을 Base64.encodeBase64형식에 맞춰서 인코딩 하는 작업
					byte[] encodeBase64 = Base64.encodeBase64(imageBtyeArray);
					// 인코딩 된 데이터를 보내준다.
					String base64DataString = new String(encodeBase64, "UTF-8");
					// file_img저장될때는 사용되는게 아니고 이미지를 표현할떄 사용된다.
					attach.setFile_img(base64DataString);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}
	}
}