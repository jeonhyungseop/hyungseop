package kr.or.ddit.cfms.login.vo;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import lombok.Getter;

@Getter
public class CustomUserDetails extends User{
	
	private UserVO adaptee;
	
	public CustomUserDetails(UserVO adaptee) {
		super(adaptee.getId(), adaptee.getPass(), AuthorityUtils.createAuthorityList(adaptee.getRole()));
	}
	
}