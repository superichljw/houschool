package houschool.VO;

import org.springframework.web.multipart.MultipartFile;

public class slideVO {
	private int slideorder;
	private String slideno;
	private String schoolName;
	private String schoolAdres;
	private String slideImg;
	private MultipartFile slideMF;

	public int getSlideorder() {
		return slideorder;
	}

	public void setSlideorder(int slideorder) {
		this.slideorder = slideorder;
	}

	public String getSlideno() {
		return slideno;
	}

	public void setSlideno(String slideno) {
		this.slideno = slideno;
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

	public String getSlideImg() {
		return slideImg;
	}

	public void setSlideImg(String slideImg) {
		this.slideImg = slideImg;
	}

	public MultipartFile getSlideMF() {
		return slideMF;
	}

	public void setSlideMF(MultipartFile slideMF) {
		this.slideMF = slideMF;
	}

	@Override
	public String toString() {
		return "slideVO [slideorder=" + slideorder + ", slideno=" + slideno + ", schoolName=" + schoolName
				+ ", schoolAdres=" + schoolAdres + ", slideImg=" + slideImg + ", slideMF=" + slideMF + "]";
	}

}
