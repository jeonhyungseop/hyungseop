package kr.or.ddit.cfms.login.vo;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of = "id")
public class UserVO implements Serializable{
	private String id;
	private String pass;
	private String se;
	private String tbnm;
	private String role;
	private String name;
	
	public UserVO(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}
	
}