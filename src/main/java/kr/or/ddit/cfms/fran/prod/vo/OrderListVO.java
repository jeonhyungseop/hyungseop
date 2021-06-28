package kr.or.ddit.cfms.fran.prod.vo;

import java.io.Serializable;
import java.util.List;

import kr.or.ddit.cfms.head.limit.vo.OrdlistVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 이진수
 * @since 2021. 6. 7
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7      이진수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderListVO implements Serializable{
	private List<OrdlistVO> orderListVO;
	private OrderVO orderVO ;
	private int ordSeq;
	private String order_no;
}
