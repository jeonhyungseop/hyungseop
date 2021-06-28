package kr.or.ddit.cfms.head.question.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HeadAnswerVO implements Serializable{
	public HeadAnswerVO(String head_code, String id) {
		this.head_code = head_code;
		this.answer_writer_id = id;
	}
	
	private String answer_dt;
	private String answer_del_at;
	private String answer_writer_id;
	private Integer ques_seq;
	private String answer_title;
	private String answer_cn;
	
	private String ques_email;
	private String admin_email;
	private String head_code;
}
