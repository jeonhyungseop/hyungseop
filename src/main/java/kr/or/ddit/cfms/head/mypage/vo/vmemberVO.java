package kr.or.ddit.cfms.head.mypage.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class vmemberVO implements Serializable{
	
private String id;
	private String pass;
	private String se;
	private String tbnm;
	private String role;
	private String name;

}
