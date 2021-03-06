package kr.or.ddit.cfms.fran.question.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FranQuestionVO implements Serializable{
	
	public FranQuestionVO(String head_code, String id) {
		this.head_code = head_code;
		this.ques_writer = id;
	}

	private String orsCode;
	private String oscCode;
	private String ques_del_at;
	@NotNull
	private Integer ques_seq;
	private String head_code;
	@NotNull
	private String ques_title;
	private String ques_cn;
	@NotNull
	private String ques_writer;
	private String ques_dt;
	@NotNull
	private String ques_email;
	@NotNull
	private String ques_cl_code;
	@NotNull
	private String ques_sttus_code;
	
	private String ques_hit;
	
	private int rnum;
	private int totalRecode;
	private String yymmdd;
}
