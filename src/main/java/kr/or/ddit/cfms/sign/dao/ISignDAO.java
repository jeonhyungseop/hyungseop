package kr.or.ddit.cfms.sign.dao;

import org.springframework.stereotype.Repository;
import kr.or.ddit.cfms.commons.vo.ComCodeGrpVO;
import kr.or.ddit.cfms.head.commons.vo.HeadquartersVO;
import kr.or.ddit.cfms.head.commons.vo.StipulationVO;

/**
 * @author 진유리
 * @since 2021. 5. 26
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26   진유리       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface ISignDAO {
	
	public int idcheck(String id);
	
	public int bizrnocheck(String bizrno);
	
	public ComCodeGrpVO selectCodeList(String code);
	
	public int insertHeadQuarter(HeadquartersVO vo);
	
	public int insertAttatches(HeadquartersVO vo);
	
	public int selectNumber(String name);
	
	public int insertStipulation(HeadquartersVO vo);
	
}