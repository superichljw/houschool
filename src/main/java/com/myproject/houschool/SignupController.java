package com.myproject.houschool;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Interface.Attendance;
import houschool.VO.memberVO;
import houschool.VO.schoolVO;

@Controller
public class SignupController {

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	// 회원가입
	@RequestMapping(value = "/page_signup")
	public String signuppage() {
		return "signup/signup_main";
	}

	@RequestMapping(value = "/page_signup_group")
	public String page_signup_group() {
		return "signup/signup_group";
	}

	@RequestMapping(value = "/signup_group", method = RequestMethod.GET)
	public String signup_group(HttpServletRequest request) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		schoolVO svo = new schoolVO();
		svo.setType(request.getParameter("type"));
		svo.setSchoolName(request.getParameter("group-name"));
		svo.setSchoolAdres(request.getParameter("group-adres"));
		svo.setUserId(request.getParameter("userid"));
		svo.setUserPw(request.getParameter("pw"));
		svo.setUserPhone(request.getParameter("phone"));
		svo.setUserDate(request.getParameter("birth"));
		svo.setUserEmail(request.getParameter("email"));
		svo.setUserName(request.getParameter("userName"));
		atd.schoolSignup(svo);
		
		String schoolName = svo.getSchoolName();
		String schoolAdres = svo.getSchoolAdres();
		String slideno1 = "1";
		String slideImg1 = "mainSlide1_eng.jpg";
		atd.createSlide(schoolName, schoolAdres, slideno1, slideImg1);
		
		String slideno2 = "2";
		String slideImg2 = "mainSlide1_kor.jpg";
		atd.createSlide(schoolName, schoolAdres, slideno2, slideImg2);
		
		String slideno3 = "3";
		String slideImg3 = "mainSlide2_eng.jpg";
		atd.createSlide(schoolName, schoolAdres, slideno3, slideImg3);
		
		String slideno4 = "4";
		String slideImg4 = "mainSlide2_kor.jpg";
		atd.createSlide(schoolName, schoolAdres, slideno4, slideImg4);
		
		
		return "redirect:main";
	}

	@RequestMapping(value = "/page_signup_personal")
	public String page_signup_personal() {

		return "signup/signup_personal";
	}

	@RequestMapping(value = "/signup_personal", method = RequestMethod.GET)
	public String signup_personal(HttpServletRequest request) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		memberVO mvo = new memberVO();
		mvo.setType(request.getParameter("type"));
		mvo.setSchoolName(request.getParameter("group-name"));
		mvo.setSchoolAdres(request.getParameter("group-adres"));
		mvo.setUserId(request.getParameter("userid"));
		mvo.setUserPw(request.getParameter("pw"));
		mvo.setUserName(request.getParameter("name"));
		String adres = request.getParameter("postcode") + " " + request.getParameter("address") + " "
				+ request.getParameter("detailAdd");
		mvo.setUserAdres(adres);
		mvo.setUserPhone(request.getParameter("phone"));
		mvo.setUserDate(request.getParameter("birth"));
		mvo.setUserEmail(request.getParameter("email"));
		mvo.setGrade(request.getParameter("grade"));
		mvo.setBatch(request.getParameter("batch"));
		mvo.setClassnum(request.getParameter("classnum"));
		mvo.setMajor(request.getParameter("major"));
		atd.personalSignup(mvo);
		return "redirect:main";
	}

	@RequestMapping(value = "/school_search", method = RequestMethod.GET)
	public String school_search() {
		return "signup/school_search";
	}

	// 중복확인
	@RequestMapping("/school_id_check")
	public String id_check(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		Attendance atd = sqlSession.getMapper(Attendance.class);
		int result = atd.schoolIdCheck(userid);
		if (result == 0) {
			result = -1;
		}
		model.addAttribute("userid", userid);
		model.addAttribute("result", result);
		return "signup/idcheck";
	}

	@RequestMapping("/personal_id_check")
	public String personal_id_check(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		Attendance atd = sqlSession.getMapper(Attendance.class);
		int result = atd.personalIdCheck(userid);
		if (result == 0) {
			result = -1;
		}
		model.addAttribute("userid", userid);
		model.addAttribute("result", result);
		return "signup/idcheck";
	}
}
