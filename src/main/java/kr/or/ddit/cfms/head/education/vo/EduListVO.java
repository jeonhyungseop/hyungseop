package kr.or.ddit.cfms.head.education.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of = "edc_seq")
@NoArgsConstructor
@AllArgsConstructor
public class EduListVO {
	private Integer edc_seq;
	private String edc_code;
	private String fran_code;
	private String edc_cp_at;
}