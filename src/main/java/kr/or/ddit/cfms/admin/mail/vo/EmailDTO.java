package kr.or.ddit.cfms.admin.mail.vo;


	import lombok.Data;
	import lombok.ToString;

	@Data
	@ToString
	public class EmailDTO {
		private String senderName;    //발신자 이름
	    private String senderMail;    //발신자 이메일 주소
	    private String receiveMail;    //수신자 이메일 주소
	    private String subject;            //제목
	    private String message;            //본문
	    
	  
	  

	

}
