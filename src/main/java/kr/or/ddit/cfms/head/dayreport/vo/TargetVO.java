package kr.or.ddit.cfms.head.dayreport.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
/**
 * @author 배수진
 * @since 2021. 6. 18
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 18      배수진       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="target_seq")
@ToString
public class TargetVO implements Serializable{
	private String target_base_year;
	private Integer target_seq;
	private String fran_code;
	private String emp_id;
	private Integer target_money;
	private String target_upde;
	private String target_base_month;
	private String memo;

}
