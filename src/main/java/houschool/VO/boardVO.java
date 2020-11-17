package houschool.VO;

import org.springframework.web.multipart.MultipartFile;

public class boardVO {
	private int board_num;
	private String board_category;
	private String board_title;
	private String board_author;
	private String board_content;
	private String board_date;
	private String board_orgFileName;
	private String board_uuidFileName;
	private MultipartFile uploadFile;
	
	public String getBoard_orgFileName() {
		return board_orgFileName;
	}
	public void setBoard_orgFileName(String board_orgFileName) {
		this.board_orgFileName = board_orgFileName;
	}
	public String getBoard_uuidFileName() {
		return board_uuidFileName;
	}
	public void setBoard_uuidFileName(String board_uuidFileName) {
		this.board_uuidFileName = board_uuidFileName;
	}
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_author() {
		return board_author;
	}
	public void setBoard_author(String board_author) {
		this.board_author = board_author;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
}
