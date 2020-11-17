package com.myproject.houschool;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Interface.Attendance;
import board_paging.board_paging;
import houschool.VO.Room;
import houschool.VO.boardVO;
import houschool.VO.mediaVO;
import houschool.VO.memberVO;
import houschool.VO.schoolVO;
import houschool.VO.slideVO;
import util.UploadSaveManager;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	@Resource(name = "mediaUloadPath")
	private String mediaUloadPath;

	@Resource(name = "slideUloadPath")
	private String slideUloadPath;

	List<Room> roomList = new ArrayList<Room>();
	static int roomNumber = 0;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "redirect:main";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpSession session) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("list", atd.select4_schoolClass());
		mav.addObject("publicList", atd.select4_publicClass());

//		mav.addObject("root",Utility.getRoot());
		mav.addObject("root", mediaUloadPath); // root
		return mav;
	}

	
	
//������ ������
	@RequestMapping("/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}

	@RequestMapping("/adminInfoModifyPage")
	public String adminInfoModifyPage() {
		return "admin/adminInfoModifyPage";
	}

	@RequestMapping("/adminTeacherInfoPage")
	public String adminTeacherInfoPage(HttpServletRequest request, Model model) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		String schoolName = request.getParameter("schoolName");
		ArrayList<memberVO> list = atd.getTeacherList(schoolName);
		model.addAttribute("teacher_list", list);
		return "admin/adminTeacherInfoPage";
	}

	@RequestMapping("/adminStudentInfoPage")
	public String adminStudentInfoPage(HttpServletRequest request, Model model) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		String schoolName = request.getParameter("schoolName");
		ArrayList<memberVO> list = atd.getStudentList(schoolName);
		model.addAttribute("student_list", list);
		return "admin/adminStudentInfoPage";
	}

	@RequestMapping("/adminClassOfSchool")
	public String adminClassOfSchool(HttpServletRequest request, Model model) {
		return "admin/adminClassOfSchool";
	}

	@RequestMapping("/adminTimetableApply")
	public String adminTimetableApply() {
		return "admin/adminTimetableApply";
	}

	@RequestMapping("/adminSlideChangePage")
	public String adminSlideChangePage() {
		return "admin/adminSlideChange";
	}

	//mypage for student and teacher
	@RequestMapping("/mypageMain")
	public String mypageMain() {
		return "mypage/mypageMain";
	}
	
	@RequestMapping("/mypageModify")
	public String mypageModify() {
		return "mypage/mypageModify";
		
	}
	@RequestMapping("/mypageClassOfSchool")
	public String mypageClassOfSchool(HttpServletRequest request, Model model) {
		return "mypage/mypageClassOfSchool";
	}
	
	@RequestMapping("/mypageStudentInfoPage")
	public String mypageStudentInfoPage(HttpServletRequest request, Model model) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		String schoolName = request.getParameter("schoolName");
		ArrayList<memberVO> list = atd.getStudentList(schoolName);
		model.addAttribute("student_list", list);
		return "mypage/mypageStudentInfoPage";
	}
	
	@RequestMapping("/mypageTimetableApply")
	public String mypageTimetableApply() {
		return "mypage/mypageTimetableApply";
	}
	
	
	// ���� �⺻ �����̵� 4���� �б� ȸ�����Խ� ���� �ǰ�, �� ���� �����̵� ������Ʈ
	@RequestMapping(value = "/slideChange", method = RequestMethod.POST)
	public ModelAndView createProc(slideVO svo, HttpServletRequest req) {
		Attendance atd = sqlSession.getMapper(Attendance.class);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main");
		mav.addObject("root", slideUloadPath); // videoclass

		String basicPath = slideUloadPath;

		MultipartFile slideMF = svo.getSlideMF();
		// ���� �����ϰ� �����ӵ� ���ϸ� ��ȯ
		String slideImg = UploadSaveManager.saveFileSpring30(slideMF, basicPath); // ���ϸ�� ��θ�
		// �����ӵ� ���ϸ�svo��ü ���
		svo.setSlideImg(slideImg);
		atd.updateSlide(svo);
		return mav;
	}

//�Խ���
	@RequestMapping(value = "/board")
	public String board(HttpServletRequest request, Model model) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		String page = (String) request.getParameter("page");
		String pageDataCount = (String) request.getParameter("pageDataCount");
		if (page == null) {
			page = "1";//
		}
		if (pageDataCount == null) {
			pageDataCount = "10";//
		}
		model.addAttribute("board_list", atd.selectBoard(page, pageDataCount));
		int totalDataCount = atd.dataCount();
		board_paging paging = new board_paging();
		paging.makePage(Integer.parseInt(page), Integer.parseInt(pageDataCount), totalDataCount);
		model.addAttribute("board_page", paging);
		return "board/board";
	}

	@RequestMapping("/board_write_page")
	public String board_write_page() {
		return "board/board_write";
	}

	@RequestMapping(value = "/board_write", method = { RequestMethod.GET, RequestMethod.POST })
	public String board_write(boardVO bvo) throws IOException {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		String fileName = null;
		String orgFileName = null;
		MultipartFile uploadFile = bvo.getUploadFile();
		System.out.println(bvo.getUploadFile());
		if (!uploadFile.isEmpty() || uploadFile != null) {
			orgFileName = uploadFile.getOriginalFilename();
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // Ȯ���� ���ϱ�
			UUID uuid = UUID.randomUUID(); // UUID ���ϱ�
			fileName = uuid + "." + ext;
			uploadFile.transferTo(
					new File("D:\\workspace_spring\\houschool\\src\\main\\webapp\\resources\\fileUpload\\" + fileName));
			bvo.setBoard_uuidFileName(fileName);
			bvo.setBoard_orgFileName(orgFileName);
		}
		atd.board_write(bvo);
		return "redirect:board";
	}

	@RequestMapping(value = "/board_download")
	public void board_download(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// String path = request.getSession().getServletContext().getRealPath("������");

		String filename = request.getParameter("fileName");

		String realFilename = "";
		System.out.println(filename);

		try {
			String browser = request.getHeader("User-Agent");
			// ���� ���ڵ�
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else {
				filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}
		realFilename = "D:\\workspace_spring\\houschool\\src\\main\\webapp\\resources\\fileUpload\\" + filename;

		System.out.println(realFilename);
		File file1 = new File(realFilename);
		if (!file1.exists()) {
			return;
		}

		// ���ϸ� ����
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFilename);

			int ncount = 0;
			byte[] bytes = new byte[512];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (Exception e) {
			System.out.println("FileNotFoundException : " + e);
		}
	}

	@RequestMapping("/board_content_view")
	public String board_content_view(HttpServletRequest request, Model model) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		boardVO bVo = atd.selectOneBoardByNum(request.getParameter("board_num"));
		model.addAttribute("bView", bVo);
		return "board/board_view";
	}

	// �α���
	@RequestMapping(value = "/loginMain")
	public String loginMain() {
		return "login/loginMain";
	}

	@RequestMapping("/page_login_group")
	public String page_login_group() {
		return "login/schoolLogin";
	}

	@RequestMapping("/page_login_personal")
	public String page_login_personal() {
		return "login/personalLogin";
	}

	@RequestMapping(value = "/schoolLogin", method = RequestMethod.GET)
	public String schoolLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		schoolVO svo = atd.schoolLogin(request.getParameter("id"), request.getParameter("pw"));
		
		if (svo == null) {
			model.addAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.");
			return "login/loginAlert";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", svo);
			String schoolName = svo.getSchoolName();
			String schoolAdres = svo.getSchoolAdres();

			slideVO svo1 = atd.readSlide_1(schoolName, schoolAdres);
			slideVO svo2 = atd.readSlide_2(schoolName, schoolAdres);
			slideVO svo3 = atd.readSlide_3(schoolName, schoolAdres);
			slideVO svo4 = atd.readSlide_4(schoolName, schoolAdres);
			
			session.setAttribute("slide1", svo1);
			session.setAttribute("slide2", svo2);
			session.setAttribute("slide3", svo3);
			session.setAttribute("slide4", svo4);
			
			session.setAttribute("myschoolList", atd.loginuser_schoolClass_(schoolName, schoolAdres));
		}
		return "redirect:main";
	}

	@RequestMapping(value = "/personalLogin", method = RequestMethod.GET)
	public String personalLogin(HttpServletRequest request, Model model) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		memberVO mvo = atd.personalLogin(request.getParameter("id"), request.getParameter("pw"));
		if (mvo == null) {
			model.addAttribute("msg", "���̵� �Ǵ� ��й�ȣ�� �߸� �Է��ϼ̽��ϴ�.");
			return "login/loginAlert";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mvo);
			
			String schoolName = mvo.getSchoolName();
			String schoolAdres = mvo.getSchoolAdres();
			
			slideVO svo1 = atd.readSlide_1(schoolName, schoolAdres);
			slideVO svo2 = atd.readSlide_2(schoolName, schoolAdres);
			slideVO svo3 = atd.readSlide_3(schoolName, schoolAdres);
			slideVO svo4 = atd.readSlide_4(schoolName, schoolAdres);
			
			session.setAttribute("slide1", svo1);
			session.setAttribute("slide2", svo2);
			session.setAttribute("slide3", svo3);
			session.setAttribute("slide4", svo4);
			
			session.setAttribute("myschoolList", atd.loginuser_schoolClass_(schoolName, schoolAdres));
		}
		return "redirect:main";
	}

	// �α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main";
	}

	// rtc �׽�Ʈ��
	@RequestMapping(value = "/rtc/{rType}/{rId}", method = RequestMethod.GET)
	public String rtc(HttpServletRequest request, @PathVariable("rType") String rType, @PathVariable("rId") String rId,
			Model model) {
		String url = request.getRequestURL().toString();
		model.addAttribute("roomType", rType);
		model.addAttribute("roomId", rId);
		System.out.println(rType);
		System.out.println(rId);
		System.out.println(url);
		if (rType.equals("host")) {
			return "host";
		} else {
			return "room";
		}
	}

	@RequestMapping(value = "/rtc", method = RequestMethod.GET)
	public String rtc2() {

		return "rtc";
	}

	@RequestMapping(value = "/chatroom_list", method = RequestMethod.GET)
	public String chatroom_list() {
		return "chatroom_list";
	}

	// �� ����

	@RequestMapping(value = "/createRoom", method = RequestMethod.POST)
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params) {
		String roomName = (String) params.get("roomName");
		String userId = (String) params.get("userId");
		System.out.println(userId);

		if (roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			room.setUserid(userId);
			roomList.add(room);
		}
		return roomList;
	}

//	@RequestMapping(value = "/createRoom", method = RequestMethod.POST)
//	public String createRoom(@RequestParam HashMap<Object, Object> params) {
//		String roomName = (String) params.get("roomName");
//		if (roomName != null && !roomName.trim().equals("")) {
//			Room room = new Room();
//			room.setRoomNumber(++roomNumber);
//			room.setRoomName(roomName);
//			roomList.add(room);
//		}
//		return "redirect:chatroom_list";
//	}
	// �� ���� ��������

	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params) {
		return roomList;
	}

	@RequestMapping(value = "/createChatroomPopup", method = RequestMethod.GET)
	public String createChatroomPopup() {
		return "createChatroomPopup";
	}

	@RequestMapping("/gridtest")
	public String gridtest() {
		return "gridtest";
	}
}
