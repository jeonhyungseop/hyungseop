package kr.or.ddit.cfms.sign.service;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;

/**
 * @author 진유리
 * @since 2021. 5. 26
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26   진유리       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface ISignService {
	/**
	 * 아이디 중복 확인 조회
	 * @param id 아이디
	 * @return 0이면 중복아이디 없음 , 1이면 중복아이디 존재
	 */
	public int idCheck(String id);
	
	/**
	 * 공통코드 조회 
	 * @param code 조회하고자 하는 공통코드 그룹
	 * @return 그룹에 대한 공통코드 정보
	 */
	public ComCodeGrpVO retrieveCodeList(String code);
	
	/**
	 * 가맹본부 삽입
	 * @param vo 삽입하고자 하는 가맹본부 정보
	 * @return
	 */
	public ServiceResult insertHeadQuarter(HeadquartersVO vo);
	
	public int selectNumber(String name);

	public int bizrnoCheck(String bizrno);
	
}