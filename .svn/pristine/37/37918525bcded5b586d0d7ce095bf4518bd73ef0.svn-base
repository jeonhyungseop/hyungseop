package kr.or.ddit.cfms.commons.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="board_seq")
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardVO implements Serializable{
	private Integer rnum;
	@NotNull
	private Integer board_seq;
	@NotNull
	private String head_code;
	@NotBlank
	private String board_title;
	private String board_cn;
	@NotNull
	private String board_writer_tycode;
	@NotBlank
	private String board_writer;
	private String board_time;
	private Integer board_hit;
	private String board_tycode;
	private String att_fileno;
	private String board_se_code;
	private int startAttNo;
	private List<AttachfileVO> attatchList;
	private MultipartFile[] bo_files;
	
	public void setBo_files(MultipartFile[] bo_files) {
		this.bo_files = bo_files;
		if(bo_files!=null) {
			List<AttachfileVO> attatchList = new ArrayList<>();
			for(MultipartFile file : bo_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttachfileVO(file));
			}
			if(attatchList.size()>0)
				this.attatchList = attatchList;
		}
	}
	private int[] delAttNos;
}
