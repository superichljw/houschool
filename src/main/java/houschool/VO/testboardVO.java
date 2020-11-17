package houschool.VO;

public class testboardVO {
	private int AHLnum;
	private String AHLtype;
	private String AHLdate;
	private String AHLstatus;
	private String AHLtel;
	private String AHLadd1;
	private String AHLadd2;
	private String AHLpostcode;
	private String AHLname;
	
	@Override
	public String toString() {
		return "PetClinicSearch [AHLnum=" + AHLnum + ", AHLtype=" + AHLtype + ", AHLdate=" + AHLdate + ", AHLstatus="
				+ AHLstatus + ", AHLtel=" + AHLtel + ", AHLadd1=" + AHLadd1 + ", AHLadd2=" + AHLadd2 + ", AHLpostcode="
				+ AHLpostcode + ", AHLname=" + AHLname + "]";
	}
	
	public testboardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public testboardVO(int aHLnum, String aHLtype, String aHLdate, String aHLstatus, String aHLtel, String aHLadd1,
			String aHLadd2, String aHLpostcode, String aHLname) {
		super();
		AHLnum = aHLnum;
		AHLtype = aHLtype;
		AHLdate = aHLdate;
		AHLstatus = aHLstatus;
		AHLtel = aHLtel;
		AHLadd1 = aHLadd1;
		AHLadd2 = aHLadd2;
		AHLpostcode = aHLpostcode;
		AHLname = aHLname;
	}
	
	public int getAHLnum() {
		return AHLnum;
	}
	public void setAHLnum(int aHLnum) {
		AHLnum = aHLnum;
	}
	public String getAHLtype() {
		return AHLtype;
	}
	public void setAHLtype(String aHLtype) {
		AHLtype = aHLtype;
	}
	public String getAHLdate() {
		return AHLdate;
	}
	public void setAHLdate(String aHLdate) {
		AHLdate = aHLdate;
	}
	public String getAHLstatus() {
		return AHLstatus;
	}
	public void setAHLstatus(String aHLstatus) {
		AHLstatus = aHLstatus;
	}
	public String getAHLtel() {
		return AHLtel;
	}
	
	public void setAHLtel(String aHLtel) {
		AHLtel = aHLtel;
	}
	public String getAHLadd1() {
		return AHLadd1;
	}
	public void setAHLadd1(String aHLadd1) {
		AHLadd1 = aHLadd1;
	}
	public String getAHLadd2() {
		return AHLadd2;
	}
	public void setAHLadd2(String aHLadd2) {
		AHLadd2 = aHLadd2;
	}
	public String getAHLpostcode() {
		return AHLpostcode;
	}
	public void setAHLpostcode(String aHLpostcode) {
		AHLpostcode = aHLpostcode;
	}
	public String getAHLname() {
		return AHLname;
	}
	public void setAHLname(String aHLname) {
		AHLname = aHLname;
	}
}
