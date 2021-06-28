package kr.or.ddit.cfms.fran.mypage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.cfms.commons.vo.ComCodeVO;
import kr.or.ddit.cfms.fran.mypage.vo.franMypageVO;
import kr.or.ddit.cfms.head.employee.vo.EmployeeVO;
import kr.or.ddit.cfms.head.mypage.vo.headVO;
import kr.or.ddit.cfms.head.mypage.vo.vmemberVO;


@Repository
public interface IFranMypageDAO {

	
	
	
	//공통코드 직급목록조회
	public List<ComCodeVO> comcodeECL();
	
	//공통코드 직원구분
	public List<ComCodeVO> comcodeESE();
	

	
	public vmemberVO selectSe(String id);
	
	public franMypageVO selectFranMemberForAuth(String mem_id);
	
	public franMypageVO selectFranMy(String mem_id);
	
	public int updatefranMypage(franMypageVO franmypagevo);
	
	//파일업로드
	public int insertfranMyImage(franMypageVO franmypagevo);
	
	public int updatenoImgfranMypage(franMypageVO franmypagevo);
	
	
	
	
}
