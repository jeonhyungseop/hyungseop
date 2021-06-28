package kr.or.ddit.cfms.head.commons.vo;

import java.io.Serializable;
import javax.validation.constraints.NotBlank;
import kr.or.ddit.cfms.validator.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * @author 진유리
 * @since 2021. 5. 24
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24   진유리       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode
@ToString
public class StipulationVO implements Serializable{
	@NotBlank(groups = InsertGroup.class)
	private String head_code;
	@NotBlank(groups = InsertGroup.class)
	private String stplat_code;
	private String agre_at;
}