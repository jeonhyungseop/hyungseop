package kr.or.ddit.cfms.head.franmanage.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.fran.commons.vo.FranchiseVO;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.royal.vo.HeadBillVO;

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

@Repository
public interface IHeadFranManageDAO {
	//가맹점 개수
	public int selectFranCount(PagingVO<FranchiseVO> pagingVO);
	
	//가맹점 조회
	public List<FranchiseVO> selectFranList(PagingVO<FranchiseVO> pagingVO);
	
	//가맹점 상세조회
	public FranchiseVO selectFran(Map<String, Object> map);
	
	//공통코드
	public ComCodeGrpVO selectCodeList(String code);
	
	//가맹점 삽입
	public int insertFran(FranchiseVO fran);
	
	//가맹본부 정보
	public Map<String, String> selectHeadInfo(String head_code);
	
	//첨부파일 추가
	public int insertAttatches(FranchiseVO fran);
	
	//Map출력을 위한 조회
	public List<FranchiseVO> selectFranMap(String code);
	
	//가맹비 내역 삽입
	public int insertBill(HeadBillVO billVO);
	
	public String selectRoyaltyApliDay(String code);
	
	//폐가맹점 등록
	public int updateFranClose(String fran_code);
	
	//폐가맹점 복구
	public int updateFranRestore(String fran_code);
}