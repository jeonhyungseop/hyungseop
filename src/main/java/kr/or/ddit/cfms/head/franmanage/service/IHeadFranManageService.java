package kr.or.ddit.cfms.head.franmanage.service;

import java.util.List;
import java.util.Map;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;

/**
 * @author 진유리
 * @since 2021. 06. 02
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * ------------     --------    ----------------------
 * 2021. 06. 02     진유리         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface IHeadFranManageService {
	//가맹점 개수
	public int retrieveFranCount(PagingVO<FranchiseVO> pagingVO);
	
	//가맹점 조회
	public List<FranchiseVO> retrieveFranList(PagingVO<FranchiseVO> pagingVO);
	
	//가맹점 상세조회
	public FranchiseVO retrieveFran(Map<String, Object> map);
	
	//공통코드 조회
	public ComCodeGrpVO retrieveCodeList(String code);
	
	//가맹점 삽입
	public ServiceResult createFranchise(FranchiseVO fran);
	
	public Map<String, String> retrieveHeadInfo(String head_code);
	
	public List<FranchiseVO> retrieveFranMap(String code);
	
	//폐가맹점 등록
	public int updateFranClose(String fran_code);
	
	//폐가맹점 복구
	public int updateFranRestore(String fran_code);
}