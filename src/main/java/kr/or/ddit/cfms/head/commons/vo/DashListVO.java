package kr.or.ddit.cfms.head.commons.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DashListVO {

	private List<DashVO> dashListVO;
	private DashVO dashVO;
	private int dash_seq;
	private String dash_no;
	
	
}
