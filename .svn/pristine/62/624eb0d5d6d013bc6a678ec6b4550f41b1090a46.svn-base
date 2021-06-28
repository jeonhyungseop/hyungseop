package kr.or.ddit.cfms.head.inven.dao;

import java.util.List;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.AttachfileVO;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;
import kr.or.ddit.cfms.head.inven.vo.UnitpcListVO;

/**
 * @author 이진수
 * @since 2021. 5. 21
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface IHeadInvenDAO {
	public int selectHeadInvenCount(PagingVO<HeadInvenVO> pagingVO);
	public List<HeadInvenVO> selectHeadInvenList(PagingVO<HeadInvenVO> pagingVO);
	public HeadInvenVO selectHeadInven(HeadInvenVO headInvenVO);
	public ComCodeGrpVO selectCodeList(String code);
	// 제품등록
	public int insertProd(HeadInvenVO headInvenVO);
	// 재고 등록
	public int insertInven(HeadInvenVO headInvenVO);
	// 첨부파일 등록
	public int insertAttatches(HeadInvenVO headInvenVO);
	// 단가 변동 내역 등록
	public int insertUnitpclist(HeadInvenVO headInvenVO);
	
	// 단가 변동 내역 삭제
	public int deleteUnitpclist(String prod_code);
	// 재고 삭제
	public int deleteInvenlist(String prod_code);
	public List<AttachfileVO> selectAttList(String att_fileno);
	// 제품 삭제
	public int deleteProdList(String prod_code);
	// 첨부파일 삭제
	public int deleteAttatches(HeadInvenVO headInvenVO);
	// 첨부파일 저장명 가져오기
	public List<String> selectSaveNamesForDelete(HeadInvenVO headInvenVO);
	// 다중 수정을 위한 상품 정보 가져오기
	public HeadInvenVO selectProd(String prod_code);
	// 첨부파일 리스트 가져오기
	public AttachfileVO selectFile(AttachfileVO attachFile);
	
	// 제품 업데이트
	public int updateProd(HeadInvenVO headInvenVO);
	// 재고 업데이트
	public int updateInven(HeadInvenVO headInvenVO);
	// 단가 변동 이력 리스트
	public List<UnitpcListVO> selectUnitpcList(String prod_code);
	public String selectAttNo();
	
		
}
