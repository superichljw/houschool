package com.myproject.houschool;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Interface.Attendance;
import timetable.VO.timetable_fri_VO;
import timetable.VO.timetable_mon_VO;
import timetable.VO.timetable_tue_VO;
import timetable.VO.timetable_tur_VO;
import timetable.VO.timetable_wed_VO;

@Controller
public class TimeTableController {

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	@RequestMapping("/timetableApplyPage")
	public String timetableApply() {
		return "timetable/timetableApply";
	}

	@RequestMapping("/classOfSchool")
	public String classOfSchool() {
		return "timetable/classOfSchool";
	}

	@RequestMapping("/tt_apply")
	public String tt_apply(HttpServletRequest request) {
		Attendance atd = sqlSession.getMapper(Attendance.class);

		// 타임테이블 vo 객체생성
		timetable_mon_VO monVO = new timetable_mon_VO();
		timetable_tue_VO tueVO = new timetable_tue_VO();
		timetable_wed_VO wedVO = new timetable_wed_VO();
		timetable_tur_VO turVO = new timetable_tur_VO();
		timetable_fri_VO friVO = new timetable_fri_VO();
		
		// 값 가져오기
		monVO.setSchoolName(request.getParameter("schoolName"));
		monVO.setGrade(request.getParameter("grade"));
		monVO.setBatch(request.getParameter("batch"));
		monVO.setSemester(request.getParameter("semester"));
		monVO.setSubject_mon_1st(request.getParameter("subject_mon_1st"));
		monVO.setSubject_mon_1st_teacher(request.getParameter("subject_mon_1st_teacher"));
		monVO.setSubject_mon_2nd(request.getParameter("subject_mon_2nd"));
		monVO.setSubject_mon_2nd_teacher(request.getParameter("subject_mon_2nd_teacher"));
		monVO.setSubject_mon_3rd(request.getParameter("subject_mon_3rd"));
		monVO.setSubject_mon_3rd_teacher(request.getParameter("subject_mon_3rd_teacher"));
		monVO.setSubject_mon_4th(request.getParameter("subject_mon_4th"));
		monVO.setSubject_mon_4th_teacher(request.getParameter("subject_mon_4th_teacher"));
		monVO.setSubject_mon_5th(request.getParameter("subject_mon_5th"));
		monVO.setSubject_mon_5th_teacher(request.getParameter("subject_mon_5th_teacher"));
		monVO.setSubject_mon_6th(request.getParameter("subject_mon_6th"));
		monVO.setSubject_mon_6th_teacher(request.getParameter("subject_mon_6th_teacher"));
		monVO.setSubject_mon_7th(request.getParameter("subject_mon_7th"));
		monVO.setSubject_mon_7th_teacher(request.getParameter("subject_mon_7th_teacher"));
		monVO.setSubject_mon_8th(request.getParameter("subject_mon_8th"));
		monVO.setSubject_mon_8th_teacher(request.getParameter("subject_mon_8th_teacher"));
		monVO.setSubject_mon_9th(request.getParameter("subject_mon_9th"));
		monVO.setSubject_mon_9th_teacher(request.getParameter("subject_mon_9th_teacher"));
		monVO.setSubject_mon_10th(request.getParameter("subject_mon_10th"));
		monVO.setSubject_mon_10th_teacher(request.getParameter("subject_mon_10th_teacher"));

		tueVO.setSchoolName(request.getParameter("schoolName"));
		tueVO.setGrade(request.getParameter("grade"));
		tueVO.setBatch(request.getParameter("batch"));
		tueVO.setSemester(request.getParameter("semester"));
		tueVO.setSubject_tue_1st(request.getParameter("subject_tue_1st"));
		tueVO.setSubject_tue_1st_teacher(request.getParameter("subject_tue_1st_teacher"));
		tueVO.setSubject_tue_2nd(request.getParameter("subject_tue_2nd"));
		tueVO.setSubject_tue_2nd_teacher(request.getParameter("subject_tue_2nd_teacher"));
		tueVO.setSubject_tue_3rd(request.getParameter("subject_tue_3rd"));
		tueVO.setSubject_tue_3rd_teacher(request.getParameter("subject_tue_3rd_teacher"));
		tueVO.setSubject_tue_4th(request.getParameter("subject_tue_4th"));
		tueVO.setSubject_tue_4th_teacher(request.getParameter("subject_tue_4th_teacher"));
		tueVO.setSubject_tue_5th(request.getParameter("subject_tue_5th"));
		tueVO.setSubject_tue_5th_teacher(request.getParameter("subject_tue_5th_teacher"));
		tueVO.setSubject_tue_6th(request.getParameter("subject_tue_6th"));
		tueVO.setSubject_tue_6th_teacher(request.getParameter("subject_tue_6th_teacher"));
		tueVO.setSubject_tue_7th(request.getParameter("subject_tue_7th"));
		tueVO.setSubject_tue_7th_teacher(request.getParameter("subject_tue_7th_teacher"));
		tueVO.setSubject_tue_8th(request.getParameter("subject_tue_8th"));
		tueVO.setSubject_tue_8th_teacher(request.getParameter("subject_tue_8th_teacher"));
		tueVO.setSubject_tue_9th(request.getParameter("subject_tue_9th"));
		tueVO.setSubject_tue_9th_teacher(request.getParameter("subject_tue_9th_teacher"));
		tueVO.setSubject_tue_10th(request.getParameter("subject_tue_10th"));
		tueVO.setSubject_tue_10th_teacher(request.getParameter("subject_tue_10th_teacher"));

		wedVO.setSchoolName(request.getParameter("schoolName"));
		wedVO.setGrade(request.getParameter("grade"));
		wedVO.setBatch(request.getParameter("batch"));
		wedVO.setSemester(request.getParameter("semester"));
		wedVO.setSubject_wed_1st(request.getParameter("subject_wed_1st"));
		wedVO.setSubject_wed_1st_teacher(request.getParameter("subject_wed_1st_teacher"));
		wedVO.setSubject_wed_2nd(request.getParameter("subject_wed_2nd"));
		wedVO.setSubject_wed_2nd_teacher(request.getParameter("subject_wed_2nd_teacher"));
		wedVO.setSubject_wed_3rd(request.getParameter("subject_wed_3rd"));
		wedVO.setSubject_wed_3rd_teacher(request.getParameter("subject_wed_3rd_teacher"));
		wedVO.setSubject_wed_4th(request.getParameter("subject_wed_4th"));
		wedVO.setSubject_wed_4th_teacher(request.getParameter("subject_wed_4th_teacher"));
		wedVO.setSubject_wed_5th(request.getParameter("subject_wed_5th"));
		wedVO.setSubject_wed_5th_teacher(request.getParameter("subject_wed_5th_teacher"));
		wedVO.setSubject_wed_6th(request.getParameter("subject_wed_6th"));
		wedVO.setSubject_wed_6th_teacher(request.getParameter("subject_wed_6th_teacher"));
		wedVO.setSubject_wed_7th(request.getParameter("subject_wed_7th"));
		wedVO.setSubject_wed_7th_teacher(request.getParameter("subject_wed_7th_teacher"));
		wedVO.setSubject_wed_8th(request.getParameter("subject_wed_8th"));
		wedVO.setSubject_wed_8th_teacher(request.getParameter("subject_wed_8th_teacher"));
		wedVO.setSubject_wed_9th(request.getParameter("subject_wed_9th"));
		wedVO.setSubject_wed_9th_teacher(request.getParameter("subject_wed_9th_teacher"));
		wedVO.setSubject_wed_10th(request.getParameter("subject_wed_10th"));
		wedVO.setSubject_wed_10th_teacher(request.getParameter("subject_wed_10th_teacher"));

		turVO.setSchoolName(request.getParameter("schoolName"));
		turVO.setGrade(request.getParameter("grade"));
		turVO.setBatch(request.getParameter("batch"));
		turVO.setSemester(request.getParameter("semester"));
		turVO.setSubject_tur_1st(request.getParameter("subject_tur_1st"));
		turVO.setSubject_tur_1st_teacher(request.getParameter("subject_tur_1st_teacher"));
		turVO.setSubject_tur_2nd(request.getParameter("subject_tur_2nd"));
		turVO.setSubject_tur_2nd_teacher(request.getParameter("subject_tur_2nd_teacher"));
		turVO.setSubject_tur_3rd(request.getParameter("subject_tur_3rd"));
		turVO.setSubject_tur_3rd_teacher(request.getParameter("subject_tur_3rd_teacher"));
		turVO.setSubject_tur_4th(request.getParameter("subject_tur_4th"));
		turVO.setSubject_tur_4th_teacher(request.getParameter("subject_tur_4th_teacher"));
		turVO.setSubject_tur_5th(request.getParameter("subject_tur_5th"));
		turVO.setSubject_tur_5th_teacher(request.getParameter("subject_tur_5th_teacher"));
		turVO.setSubject_tur_6th(request.getParameter("subject_tur_6th"));
		turVO.setSubject_tur_6th_teacher(request.getParameter("subject_tur_6th_teacher"));
		turVO.setSubject_tur_7th(request.getParameter("subject_tur_7th"));
		turVO.setSubject_tur_7th_teacher(request.getParameter("subject_tur_7th_teacher"));
		turVO.setSubject_tur_8th(request.getParameter("subject_tur_8th"));
		turVO.setSubject_tur_8th_teacher(request.getParameter("subject_tur_8th_teacher"));
		turVO.setSubject_tur_9th(request.getParameter("subject_tur_9th"));
		turVO.setSubject_tur_9th_teacher(request.getParameter("subject_tur_9th_teacher"));
		turVO.setSubject_tur_10th(request.getParameter("subject_tur_10th"));
		turVO.setSubject_tur_10th_teacher(request.getParameter("subject_tur_10th_teacher"));

		friVO.setSchoolName(request.getParameter("schoolName"));
		friVO.setGrade(request.getParameter("grade"));
		friVO.setBatch(request.getParameter("batch"));
		friVO.setSemester(request.getParameter("semester"));
		friVO.setSubject_fri_1st(request.getParameter("subject_fri_1st"));
		friVO.setSubject_fri_1st_teacher(request.getParameter("subject_fri_1st_teacher"));
		friVO.setSubject_fri_2nd(request.getParameter("subject_fri_2nd"));
		friVO.setSubject_fri_2nd_teacher(request.getParameter("subject_fri_2nd_teacher"));
		friVO.setSubject_fri_3rd(request.getParameter("subject_fri_3rd"));
		friVO.setSubject_fri_3rd_teacher(request.getParameter("subject_fri_3rd_teacher"));
		friVO.setSubject_fri_4th(request.getParameter("subject_fri_4th"));
		friVO.setSubject_fri_4th_teacher(request.getParameter("subject_fri_4th_teacher"));
		friVO.setSubject_fri_5th(request.getParameter("subject_fri_5th"));
		friVO.setSubject_fri_5th_teacher(request.getParameter("subject_fri_5th_teacher"));
		friVO.setSubject_fri_6th(request.getParameter("subject_fri_6th"));
		friVO.setSubject_fri_6th_teacher(request.getParameter("subject_fri_6th_teacher"));
		friVO.setSubject_fri_7th(request.getParameter("subject_fri_7th"));
		friVO.setSubject_fri_7th_teacher(request.getParameter("subject_fri_7th_teacher"));
		friVO.setSubject_fri_8th(request.getParameter("subject_fri_8th"));
		friVO.setSubject_fri_8th_teacher(request.getParameter("subject_fri_8th_teacher"));
		friVO.setSubject_fri_9th(request.getParameter("subject_fri_9th"));
		friVO.setSubject_fri_9th_teacher(request.getParameter("subject_fri_9th_teacher"));
		friVO.setSubject_fri_10th(request.getParameter("subject_fri_10th"));
		friVO.setSubject_fri_10th_teacher(request.getParameter("subject_fri_10th_teacher"));

		atd.insert_mon_tt(monVO);
		atd.insert_tue_tt(tueVO);
		atd.insert_wed_tt(wedVO);
		atd.insert_tur_tt(turVO);
		atd.insert_fri_tt(friVO);

		return "redirect:adminClassOfSchool";
	}

	@RequestMapping("/tt_show")
	public String tt_show(HttpServletRequest request, Model model) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		String schoolName = request.getParameter("schoolName");
		String grade = request.getParameter("grade");
		String batch = request.getParameter("batch");
		String semester = request.getParameter("semester");

		// 타임테이블 vo 객체생성
		timetable_mon_VO monVO = atd.get_tt_mon(schoolName, grade, batch,semester);
		timetable_tue_VO tueVO = atd.get_tt_tue(schoolName, grade, batch,semester);
		timetable_wed_VO wedVO = atd.get_tt_wed(schoolName, grade, batch,semester);
		timetable_tur_VO turVO = atd.get_tt_tur(schoolName, grade, batch,semester);
		timetable_fri_VO friVO = atd.get_tt_fri(schoolName, grade, batch,semester);
		if(monVO==null || tueVO==null || wedVO==null || turVO==null || friVO==null) {
			model.addAttribute("msg", "입력하신 학년/반/학기 에 해당하는 시간표가 없습니다.");
			return "admin/adminAlert";
		}else {
			
			model.addAttribute("tt_mon", monVO);
			model.addAttribute("tt_tue", tueVO);
			model.addAttribute("tt_wed", wedVO);
			model.addAttribute("tt_tur", turVO);
			model.addAttribute("tt_fri", friVO);
		}
		
		return "timetable/classOfSchool";
	}
	
	@RequestMapping("/tt_show_admin")
	public String tt_show_admin(HttpServletRequest request, Model model) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		String schoolName = request.getParameter("schoolName");
		String grade = request.getParameter("grade");
		String batch = request.getParameter("batch");
		String semester = request.getParameter("semester");

		// 타임테이블 vo 객체생성
		timetable_mon_VO monVO = atd.get_tt_mon(schoolName, grade, batch,semester);
		timetable_tue_VO tueVO = atd.get_tt_tue(schoolName, grade, batch,semester);
		timetable_wed_VO wedVO = atd.get_tt_wed(schoolName, grade, batch,semester);
		timetable_tur_VO turVO = atd.get_tt_tur(schoolName, grade, batch,semester);
		timetable_fri_VO friVO = atd.get_tt_fri(schoolName, grade, batch,semester);
		if(monVO==null || tueVO==null || wedVO==null || turVO==null || friVO==null) {
			model.addAttribute("msg", "입력하신 학년/반/학기 에 해당하는 시간표가 없습니다.");
			return "admin/adminAlert";
		}else {
			
			model.addAttribute("tt_mon", monVO);
			model.addAttribute("tt_tue", tueVO);
			model.addAttribute("tt_wed", wedVO);
			model.addAttribute("tt_tur", turVO);
			model.addAttribute("tt_fri", friVO);
		}
		
		return "admin/adminClassOfSchool";
	}
	
	@RequestMapping("/tt_show_mypage")
	public String tt_show_mypage(HttpServletRequest request, Model model) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		String schoolName = request.getParameter("schoolName");
		String grade = request.getParameter("grade");
		String batch = request.getParameter("batch");
		String semester = request.getParameter("semester");

		// 타임테이블 vo 객체생성
		timetable_mon_VO monVO = atd.get_tt_mon(schoolName, grade, batch,semester);
		timetable_tue_VO tueVO = atd.get_tt_tue(schoolName, grade, batch,semester);
		timetable_wed_VO wedVO = atd.get_tt_wed(schoolName, grade, batch,semester);
		timetable_tur_VO turVO = atd.get_tt_tur(schoolName, grade, batch,semester);
		timetable_fri_VO friVO = atd.get_tt_fri(schoolName, grade, batch,semester);
		if(monVO==null || tueVO==null || wedVO==null || turVO==null || friVO==null) {
			model.addAttribute("msg", "입력하신 학년/반/학기 에 해당하는 시간표가 없습니다.");
			return "admin/adminAlert";
		}else {
			
			model.addAttribute("tt_mon", monVO);
			model.addAttribute("tt_tue", tueVO);
			model.addAttribute("tt_wed", wedVO);
			model.addAttribute("tt_tur", turVO);
			model.addAttribute("tt_fri", friVO);
		}
		
		return "mypage/mypageClassOfSchool";
	}
}
