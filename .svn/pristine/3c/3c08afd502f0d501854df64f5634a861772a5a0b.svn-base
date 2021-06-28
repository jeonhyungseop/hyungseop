package kr.or.ddit.cfms.head.limit.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.head.deposit.service.HeadDepositServiceImpl;
import kr.or.ddit.cfms.head.inven.dao.IHeadInvenDAO;
import kr.or.ddit.cfms.head.limit.dao.IHeadLimitDAO;
import kr.or.ddit.cfms.head.limit.vo.InlistVO;
import kr.or.ddit.cfms.head.limit.vo.OrdersVO;
import kr.or.ddit.cfms.head.limit.vo.OrdlistVO;
import kr.or.ddit.cfms.head.limit.vo.OutVO;
import kr.or.ddit.cfms.head.limit.vo.OutlistVO;
import kr.or.ddit.cfms.utils.ImageBase64Util;

/**
 * @author 배수진
 * @since 2021. 6. 1
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 1      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class HeadLimitServiceImpl implements IHeadLimitService {
	private static Logger logger = LoggerFactory.getLogger(HeadDepositServiceImpl.class);
	
	private IHeadLimitDAO limitDAO;
	private IHeadInvenDAO codeDAO; 
	
	@Inject
	public void setCodeDAO(IHeadInvenDAO codeDAO) {
		this.codeDAO = codeDAO;
		logger.info("주입된 codeDAO : {}", codeDAO.getClass().getName());
	}


	@Inject
	public void setLimitDAO(IHeadLimitDAO limitDAO) {
		this.limitDAO = limitDAO;
		logger.info("주입된 limitDAO : {}", limitDAO.getClass().getName());
	}
	
	
	
	/**
	 * @param pagingVO
	 * 페이지의 총 갯수 구한 후 datalist를 저장하는 메소드 
	 */
	@Override
	public void selectMainInfo(PagingVO<OrdersVO> pagingVO) {
		
		// 총 페이지 레코드 갯수
		int totalRecord = retirveHeadLimitCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		// 조회한 데이터 저장
		List<OrdersVO> ordersList = retirveHeadLimitList(pagingVO);
		pagingVO.setDataList(ordersList);
		
		
	}
	
	/**
	 * @param pagingVO	
	 * @return int
	 * 가맹본부에서 조회한 가맹점 발주서의 총 레코드 수
	 */
	@Override
	public int retirveHeadLimitCount(PagingVO<OrdersVO> pagingVO) {
		int count = limitDAO.selectHeadLimitCount(pagingVO);
		if(count == 0) count = 1;
		return count;
	}

	/**
	 *@param pagingVO
	 * @return List<OrdersVO>
	 * 조회 된 가맹점 들의 발주서 리스트
	 */
	@Override
	public List<OrdersVO> retirveHeadLimitList(PagingVO<OrdersVO> pagingVO) {
		return limitDAO.selectHeadLimitList(pagingVO);
	}

	/**
	 * @param code
	 * @return ComCodeGrpVO
	 * 검색에 넣을 공통코드 가져오기
	 */
	@Override
	public ComCodeGrpVO retrieveCodeList(String code) {
		return codeDAO.selectCodeList(code);
	}

	/**
	 * @param orderNo
	 * @return OrdersVO
	 * 주문 상세 조회
	 */
	@Override
	public OrdersVO retriveHeadLimitDetail(String orderNo) {
		
		// 상세정보 가져오기
		OrdersVO orderVO = new OrdersVO();
		orderVO = limitDAO.selectHeadLimitDetail(orderNo);
		
		// prod 상세 정보 가져오기 
		List<OrdlistVO> orderlistVO = limitDAO.selectHeadInvenProd(orderNo);
		orderVO.setOrderlistVO(orderlistVO);
		
		ImageBase64Util imageBase64 = new ImageBase64Util();
	      for(OrdlistVO ordlistVO : orderVO.getOrderlistVO()) {
	         if(ordlistVO !=null) {
	            imageBase64.imageBase(ordlistVO.getHeadInvenVO().getAttachfileList());
	         }
	      }
		
		//총 레코드 갯수
		int totalRecode = limitDAO.totalRecode(orderVO);
		orderVO.setTotalRecode(totalRecode);
		
		// 상태코드 맵 만들기 
		Map <String, String> steps = new HashMap<>();
		String step = null;
		String code = null;
		String grp = null;
		if (orderVO.getOrder_sttus_code().equals("B0001")) {
			step = "1";
			code = orderVO.getOrder_sttus_code();
			grp = "ORC";
		}else if (orderVO.getOrder_sttus_code().equals("A0001") && orderVO.getOut_sttus_code() == null) {
			step = "2";
			code = orderVO.getOrder_sttus_code();
			grp = "ORC";
		}else if(orderVO.getOrder_sttus_code().equals("A0001") && orderVO.getOut_sttus_code().equals("B0001")) {
			step = "3";
			code = orderVO.getOut_sttus_code();
			grp = "OSC";
		}else if (orderVO.getOrder_sttus_code().equals("A0001") && orderVO.getOut_sttus_code().equals("A0001") && orderVO.getIn_sttus_code() == null) {
			step = "4";
			code = orderVO.getOut_sttus_code();
			grp = "OSC";
		}else if (orderVO.getOrder_sttus_code().equals("A0001") && orderVO.getOut_sttus_code().equals("A0001") && orderVO.getIn_sttus_code().equals("B0001")) {
			step = "5";
			code = orderVO.getIn_sttus_code();
			grp = "ISC";
		}else if (orderVO.getOrder_sttus_code().equals("A0001") && orderVO.getOut_sttus_code().equals("A0001") && orderVO.getIn_sttus_code().equals("A0001")) {
			step = "6";
			code = orderVO.getIn_sttus_code();
			grp = "ISC";
		}else if (orderVO.getOrder_sttus_code().equals("C0001")) {
			step = "7";
			code = orderVO.getOrder_sttus_code();
			grp = "ORC";
		}else if (orderVO.getOut_sttus_code().equals("C0001")) {
			step = "8";
			code = orderVO.getOut_sttus_code();
			grp = "OSC";
		}else {
			step = "9";
			code = null;
			grp = null;
		}
		
		
		
		steps.put("step", step);
		steps.put("code", code);
		steps.put("grp", grp);
		
		orderVO.setSteps(steps);
		
		return orderVO;
	}

	/**
	 * @param pagingVO
	 * 발주 상세 내역 가져오기 
	 */
	public void selectOutlist(PagingVO<OrdersVO> pagingVO, String orderNo) {
		
		// 조회한 데이터 저장
		OrdersVO orderVO = new OrdersVO();
		orderVO =retriveHeadLimitDetail(orderNo);
		pagingVO.setDetailSearch(orderVO);
		
		// 총 페이지 레코드 갯수
		int totalRecord = orderVO.getTotalRecode();
		pagingVO.setTotalRecord(totalRecord);
		
		orderVO.setOut_code(limitDAO.getOutCode());
		
	}
	
	
	
	/**
	 * @param orderMap
	 * @return int
	 * 발주 상태 업데이트 
	 */
	@Override
	public int modifyOrder(Map<String, String> orderMap) {
		int cnt = 0;
		cnt += limitDAO.updateOrder(orderMap);
		return cnt;
	}
	
	/**
	 * @param orderNo
	 * @return int
	 * 입고 확인서 및 내역 등록
	 */
	@Override
	@Transactional
	public int insertIn(String orderNo) {
		int cnt = 0;
		OrdersVO ordersVO = limitDAO.selectHeadLimitDetail(orderNo);
		cnt += limitDAO.insertIn(ordersVO);
		
		if(cnt > 0) {
			List<OrdlistVO> ordlists = limitDAO.selectHeadLimitOrderList(orderNo);
			List<InlistVO> inlists = new ArrayList<>();
			ordersVO = limitDAO.selectHeadLimitDetail(orderNo);
			
			for(OrdlistVO vo : ordlists) {
				InlistVO in = new InlistVO();
				in.setIn_no(ordersVO.getIn_no());
				in.setProd_code(vo.getProd_code());
				in.setIn_qy(vo.getOrder_qy());
				inlists.add(in);
			}
			
			cnt += limitDAO.insertInlist(inlists);
		}
		return cnt;
	}

	/**
	 * @param orderMap
	 * @return int
	 * 출고 상태 업데이트 
	 */
	@Override
	public int modifyOut(Map<String, String> outMap) {
		int cnt = 0;
		
		cnt = limitDAO.updateOut(outMap);
		
		return limitDAO.updateOut(outMap);
				
	}

	/**
	 * @param outvo
	 * @return int
	 * 출고지시서 등록 및 입고 지시서 등록
	 */
	@Override
	@Transactional
	public int insertOut(OutVO outVO) {
		int cnt = 0;
		
		cnt = limitDAO.insertOut(outVO);
		if(cnt > 0) {
			List<OrdlistVO> ordlists =  limitDAO.selectHeadLimitOrderList(outVO.getOrder_no());
			List<OutlistVO> outlists = new ArrayList<>();
 			for(OrdlistVO ordlist : ordlists) {
 				OutlistVO out = new OutlistVO();
 				out.setOut_code(outVO.getOut_code());
 				out.setOut_qy(ordlist.getOrder_qy());
 				out.setProd_code(ordlist.getProd_code());
 				
 				outlists.add(out);
			}
 			cnt += limitDAO.insertOutlist(outlists);
 			
 			String orderNo = outVO.getOrder_no();
 			
 			cnt += insertIn(orderNo);
 			
		}

		
		return cnt;
	}

	/**
	 * @param OrdersVO
	 * @return int
	 * 출고완료 버튼 클릭 후 TB_HEINVEN 및 입고 상태코드 변경  로직 
	 */
	@Override
	@Transactional
	public int outItems(OrdersVO ordersVO) {
		int cnt = 0;
		
		List<OutlistVO> outlistVO = limitDAO.selectOutlist(ordersVO);
		OutlistVO[] arrayOutlist = new OutlistVO[outlistVO.size()];
		int idx = 0;
		
		//tb_heinven 재고 업데이트
		for(OutlistVO vo : outlistVO) {
			vo.setHead_code(ordersVO.getHead_code());
			vo.setFran_code(ordersVO.getFran_code());
			arrayOutlist[idx] = vo;
			idx++;
		}
		
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("P_LIST", arrayOutlist);
		
		limitDAO.updateOutHeinven(paramMap);
		
		//출고 상태코드 변경
		Map<String, String> outMap = new HashMap<>();
		outMap.put("orderNO", ordersVO.getOrder_no());
		outMap.put("outCode", ordersVO.getOut_code());
		outMap.put("code", "A0001");
		
		cnt += modifyOut(outMap);
		
		//입고 상태코드 변경
		String in_no = ordersVO.getIn_no();
		cnt +=limitDAO.updateIn(in_no);
		
		return cnt;
	}



	
	

}
