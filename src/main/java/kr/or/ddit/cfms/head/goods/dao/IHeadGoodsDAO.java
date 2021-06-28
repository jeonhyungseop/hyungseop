package kr.or.ddit.cfms.head.goods.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.goods.vo.HeadGoodsVO;
import kr.or.ddit.cfms.head.inven.vo.HeadInvenVO;

/**
 * @author 이진수
 * @since 2021. 6. 15
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface IHeadGoodsDAO {
	public int selectHeadGoodsCount(PagingVO<HeadGoodsVO> pagingVO);

	public List<HeadGoodsVO> selectHeadGoodsList(PagingVO<HeadGoodsVO> pagingVO);

	public HeadGoodsVO selectHeadGoods(HeadGoodsVO headGoods);
	
	public int insertGoods(HeadGoodsVO headGoods);
	
	
	public int insertAttatches(HeadGoodsVO headgoodsvo);
	
	// 상품 삭제
	public int deleteGoods(String goods_code);
	
	public HeadGoodsVO selectGoods(String prod_codes);
	
	// 제품 업데이트
	public int updateGoods(HeadGoodsVO headgoodsvo);
	
	public String selectAttNo();
	
	// 첨부파일 저장명 가져오기
	public List<String> selectSaveNamesForDelete(HeadGoodsVO headInvenVO);
	
	// 첨부파일 삭제
		public int deleteAttatches(HeadGoodsVO headInvenVO);
}
