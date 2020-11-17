package Interface;

import java.util.ArrayList;

import houschool.VO.boardVO;
import houschool.VO.mediaVO;
import houschool.VO.memberVO;
import houschool.VO.schoolVO;
import houschool.VO.slideVO;
import timetable.VO.timetable_fri_VO;
import timetable.VO.timetable_mon_VO;
import timetable.VO.timetable_tue_VO;
import timetable.VO.timetable_tur_VO;
import timetable.VO.timetable_wed_VO;

public interface Attendance {
	public memberVO personalLogin(String id, String pw);

	public schoolVO schoolLogin(String id, String pw);

	public void schoolSignup(schoolVO svo);

	public void personalSignup(memberVO mvo);

	public int schoolIdCheck(String schoolId);

	public int personalIdCheck(String userid);

	public void insert_mon_tt(timetable_mon_VO monVO);

	public void insert_tue_tt(timetable_tue_VO tueVO);

	public void insert_wed_tt(timetable_wed_VO wedVO);

	public void insert_tur_tt(timetable_tur_VO turVO);

	public void insert_fri_tt(timetable_fri_VO friVO);

	public timetable_mon_VO get_tt_mon(String schoolName, String grade, String batch, String semester);

	public timetable_tue_VO get_tt_tue(String schoolName, String grade, String batch, String semester);

	public timetable_wed_VO get_tt_wed(String schoolName, String grade, String batch, String semester);

	public timetable_tur_VO get_tt_tur(String schoolName, String grade, String batch, String semester);

	public timetable_fri_VO get_tt_fri(String schoolName, String grade, String batch, String semester);

	public void board_write(boardVO bvo);

	public ArrayList<boardVO> selectBoard(String page, String pageDataCount);

	public int dataCount();

	public boardVO selectOneBoardByNum(String board_num);

	public ArrayList<memberVO> getTeacherList(String schoolName);

	public ArrayList<memberVO> getStudentList(String schoolName);

	// 1)create
	public void create(mediaVO mvo);

	// 2)list
	public ArrayList<mediaVO> list();

	// 3)read
	public mediaVO read(int mediano);

	// 4)update
	public void update(mediaVO mvo);

	// 5)delete
	public void delete(mediaVO mvo);
	
	public ArrayList<mediaVO> select4_schoolClass();
	public ArrayList<mediaVO> select4_publicClass();
	public ArrayList<mediaVO> loginuser_schoolClass_(String schoolName, String schoolAdres);
	
	//slidechange
	// 학교 회원가입시 기본 슬라이드 4개가 테이블에 입력됨
	public void createSlide(String schoolName, String schoolAdres, String slideno, String slideImg);
	// 이후 관리자 페이지에서 변경을 하게될 경우, 슬라이드 업데이트를 통해 슬라이드 변경
	public void updateSlide(slideVO svo);
	
	public slideVO readSlide_1(String schoolName, String schoolAdres);
	public slideVO readSlide_2(String schoolName, String schoolAdres);
	public slideVO readSlide_3(String schoolName, String schoolAdres);
	public slideVO readSlide_4(String schoolName, String schoolAdres);
	

}
