package kr.or.ddit.cfms.fran.trade.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.commons.vo.PagingVO;
import kr.or.ddit.cfms.enumpkg.ServiceResult;
import kr.or.ddit.cfms.fran.trade.dao.ITradeDAO;
import kr.or.ddit.cfms.head.inven.dao.IHeadInvenDAO;
import kr.or.ddit.cfms.head.limit.vo.InlistVO;
import kr.or.ddit.cfms.head.limit.vo.OrdersVO;
import kr.or.ddit.cfms.head.limit.vo.OrdlistVO;
import kr.or.ddit.cfms.head.limit.vo.OutlistVO;
import kr.or.ddit.cfms.utils.ImageBase64Util;

@Service
public class TradeServiceImpl implements ITradeService{
	private static Logger logger = LoggerFactory.getLogger(TradeServiceImpl.class);
	
	@Inject
	private ITradeDAO tradeDAO;
	@Inject
	private IHeadInvenDAO codeDAO;
	
	ImageBase64Util imageBase64Util = new ImageBase64Util();
	
	@Override
	public void selectMainInfo(PagingVO<OrdersVO> pagingVO) {
		// 페이지 레코드 수
		int totalRecord = retirveTradeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		// 조회한 데이터 리스트 저장
		List<OrdersVO> ordersList = retirveTradeList(pagingVO);
		pagingVO.setDataList(ordersList);
	}

	@Override
	public ComCodeGrpVO retrieveCodeList(String code) {
		return codeDAO.selectCodeList(code);
	}

	@Override
	public int retirveTradeCount(PagingVO<OrdersVO> pagingVO) {
		return tradeDAO.selectTradeCount(pagingVO);
	}

	@Override
	public List<OrdersVO> retirveTradeList(PagingVO<OrdersVO> pagingVO) {
		return tradeDAO.selectTradeList(pagingVO);
	}
	
	@Override
	public OrdersVO retriveTradeDetail(OrdersVO ordersVO) {
		// 상세정보 가져오기
//		OrdersVO orderVO = new OrdersVO();
		ordersVO = tradeDAO.selectTradeDetail(ordersVO.getOrder_no());
		
		// prod 상세 정보 가져오기 
		List<OrdlistVO> orderlistVO = tradeDAO.selectTradeProd(ordersVO);
		ordersVO.setOrderlistVO(orderlistVO);
		
		
	      for(OrdlistVO ordlistVO : ordersVO.getOrderlistVO()) {
	         if(ordlistVO !=null) {
	        	 imageBase64Util.imageBase(ordlistVO.getFranInvenVO().getAttachfileList());
	         }
	      }
		
		//총 레코드 갯수
		int totalRecode = tradeDAO.totalRecode(ordersVO);
		ordersVO.setTotalRecode(totalRecode);
		
		// 상태코드 맵 만들기 
		Map <String, String> steps = new HashMap<>();
		String step = null;
		String code = null;
		String grp = null;
		if (ordersVO.getOrder_sttus_code().equals("B0001")) {
			step = "1";
			code = ordersVO.getOrder_sttus_code();
			grp = "ORC";
		}else if (ordersVO.getOrder_sttus_code().equals("A0001") && ordersVO.getOut_sttus_code() == null) {
			step = "2";
			code = ordersVO.getOrder_sttus_code();
			grp = "ORC";
		}else if(ordersVO.getOrder_sttus_code().equals("A0001") && ordersVO.getOut_sttus_code().equals("B0001")) {
			step = "3";
			code = ordersVO.getOut_sttus_code();
			grp = "OSC";
		}else if (ordersVO.getOrder_sttus_code().equals("A0001") && ordersVO.getOut_sttus_code().equals("A0001") && ordersVO.getIn_sttus_code() == null) {
			step = "4";
			code = ordersVO.getOut_sttus_code();
			grp = "OSC";
		}else if (ordersVO.getOrder_sttus_code().equals("A0001") && ordersVO.getOut_sttus_code().equals("A0001") && ordersVO.getIn_sttus_code().equals("B0001")) {
			step = "5";
			code = ordersVO.getIn_sttus_code();
			grp = "ISC";
		}else if (ordersVO.getOrder_sttus_code().equals("A0001") && ordersVO.getOut_sttus_code().equals("A0001") && ordersVO.getIn_sttus_code().equals("A0001")) {
			step = "6";
			code = ordersVO.getIn_sttus_code();
			grp = "ISC";
		}else if (ordersVO.getOrder_sttus_code().equals("C0001")) {
			step = "7";
			code = ordersVO.getOrder_sttus_code();
			grp = "ORC";
		}else if (ordersVO.getOut_sttus_code().equals("C0001")) {
			step = "8";
			code = ordersVO.getOut_sttus_code();
			grp = "OSC";
		}else {
			step = "9";
			code = null;
			grp = null;
		}
		
		
		
		steps.put("step", step);
		steps.put("code", code);
		steps.put("grp", grp);
		
		ordersVO.setSteps(steps);
		
		
		
		
		// 출고 지시서 내역
		if(ordersVO.getOut_code() != null ) {
			ordersVO.setOutListVO(tradeDAO.selectOutList(ordersVO.getOut_code()));
			for(OutlistVO outlistVO : ordersVO.getOutListVO()) {
				imageBase64Util.imageBase(outlistVO.getProdVO().getAttachfileList());
			}
		}
		// 입고확인서 내역
		if(ordersVO.getIn_no() != null) {
			ordersVO.setInListVO(tradeDAO.selectInList(ordersVO.getIn_no()));
			for(InlistVO inlistVO : ordersVO.getInListVO()) {
				imageBase64Util.imageBase(inlistVO.getProdVO().getAttachfileList());
			}
		}
//		logger.info("{}", ordersVO);
		return ordersVO;
	}

	@Transactional
	@Override
	public ServiceResult updateIn(String orderNo) {
		OrdersVO ordersVO = new OrdersVO();
		int cnt = 0;
		// orders 가져오기
		ordersVO = tradeDAO.selectTradeDetail(orderNo);
		
		// 가져온 orders를 통해서 in입고확인서 상태 변경
		cnt = tradeDAO.updateIn(ordersVO.getIn_no());
		
		
		// prod 상세 정보 가져오기  및 발주 수량 가져오기
		List<InlistVO> inlistVO = tradeDAO.selectInList(ordersVO.getIn_no());
		InlistVO[] arrayInlist = new InlistVO[inlistVO.size()];
		int idx = 0;
		// tb_frinven 재고 업데이트
		if(cnt > 0) {
			for(InlistVO vo : inlistVO) {
				vo.setFran_code(ordersVO.getFran_code());
				arrayInlist[idx] = vo;
				idx++;
			}
			Map<String,Object> paramMap = new HashMap<>();
			paramMap.put("P_LIST", arrayInlist);
			
			cnt = tradeDAO.updateInven(paramMap);
			
		}
		return null;
	}

}
