package kr.or.ddit.cfms.head.reqvacation.vo;

import java.util.List;

import kr.or.ddit.cfms.head.vacationList.vo.VacationVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReqVacationListVO {

	private List<VacationVO> reqVacationListVO;
	private VacationVO vacationVO;
	private int vcreq_seq;
	private String vacation_no;
}
