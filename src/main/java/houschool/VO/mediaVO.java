package houschool.VO;

import org.springframework.web.multipart.MultipartFile;

public class mediaVO {
	private int mediano;
	private String title;
	private String poster;
	private String filename;
	private long filesize;
	private String schoolName;
	private String schoolAdres;
	private String classType;
	private String userId;
	private String rdate;
	// --------------------------------------------------------------------
	// 스프링파일 객체 멤버변수
	// <input type='file' name='posterMF' size='50'>
	private MultipartFile posterMF;
	// <input type='file' name='filenameMF' size='50'>
	private MultipartFile filenameMF;

	// --------------------------------------------------------------------
	public int getMediano() {
		return mediano;
	}

	public void setMediano(int mediano) {
		this.mediano = mediano;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public MultipartFile getPosterMF() {
		return posterMF;
	}

	public void setPosterMF(MultipartFile posterMF) {
		this.posterMF = posterMF;
	}

	public MultipartFile getFilenameMF() {
		return filenameMF;
	}

	public void setFilenameMF(MultipartFile filenameMF) {
		this.filenameMF = filenameMF;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getSchoolAdres() {
		return schoolAdres;
	}

	public void setSchoolAdres(String schoolAdres) {
		this.schoolAdres = schoolAdres;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	@Override
	public String toString() {
		return "mediaVO [mediano=" + mediano + ", title=" + title + ", poster=" + poster + ", filename=" + filename
				+ ", filesize=" + filesize + ", schoolName=" + schoolName + ", schoolAdres=" + schoolAdres
				+ ", classType=" + classType + ", userId=" + userId + ", rdate=" + rdate + ", posterMF=" + posterMF
				+ ", filenameMF=" + filenameMF + "]";
	}

}
