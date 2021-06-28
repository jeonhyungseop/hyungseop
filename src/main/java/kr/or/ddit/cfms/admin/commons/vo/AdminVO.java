package kr.or.ddit.cfms.admin.commons.vo;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "admin_id")
@ToString(exclude = "admin_pass")
@NoArgsConstructor
@AllArgsConstructor
public class AdminVO implements Serializable{
	private String admin_id;
	private String admin_pass;
	private String admin_nm;
	
	public AdminVO(String admin_id, String admin_pass) {
		this.admin_id = admin_id;
		this.admin_pass = admin_pass;
	}
	
}