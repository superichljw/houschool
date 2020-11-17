package com.myproject.houschool;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Interface.Attendance;
import houschool.VO.mediaVO;
import util.UploadSaveManager;

@Controller
public class MediaCont {
	public MediaCont() {
		System.out.println("---------------MediaCont() 객체생성됨");
		// 확인용에는 절대 void 적지말기
	}

	@Autowired
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	@Resource(name = "mediaUloadPath")
	private String mediaUloadPath;

	
	@RequestMapping(value = "/mediaCreate", method = RequestMethod.GET)
	public String createForm() {
		return "media/createForm";
	}
	

	// 1) Insert Data
	@RequestMapping(value = "/mediaCreate", method = RequestMethod.POST)
	public ModelAndView createProc(mediaVO mvo, HttpServletRequest req) {
		System.out.println(mvo);
		// 1) pom.xml -> file 업로드/다운로드 관련 의존성추가
		// 2) mediaVO -> posterMF, filenameMF 필드 추가, getter setter 함수 생성
		// 3) servlet-context.xml에 스프링빈 등록

		Attendance atd = sqlSession.getMapper(Attendance.class);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mediaList");
		mav.addObject("root", mediaUloadPath); // videoclass
//		mav.addObject("root",Utility.getRoot());

		// 전송된 파일 처리
		// -> 실제 파일은 /media/storage폴더에 저장
		// -> 저장된 파일관련 정보는 media테이블에 저장
		// 파일에 저장될 실제 물리적인 경로
//		String basicPath = req.getRealPath("/resources/storage");
		String basicPath = mediaUloadPath;
		// 1)<input type='file' name='posterMF'>
		// 파일 가져오기
		MultipartFile posterMF = mvo.getPosterMF();
		// 파일 저장하고 리네임된 파일명 반환
		String poster = UploadSaveManager.saveFileSpring30(posterMF, basicPath); // 파일명과 경로명
		// 리네임된 파일명 mvo객체 담기
		mvo.setPoster(poster);

		// 2) <input type='file' name='filenameMF'>
		MultipartFile filenameMF = mvo.getFilenameMF();
		String filename = UploadSaveManager.saveFileSpring30(filenameMF, basicPath);
		mvo.setFilename(filename);
		mvo.setFilesize(filenameMF.getSize());

		atd.create(mvo);
		int cnt = 1;
		if (cnt == 0) {
			mav.addObject("msg1", "<p>수업영상등록 실패!</p>");
//			mav.addObject("img", "<img src='../images/fail.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"mediaList\"'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"mediaCreate\"'>");

		} else {
			mav.addObject("msg1", "<p>수업영상등록 성공!</p>");
//			mav.addObject("img", "<img src='../images/sound.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"mediaList\"'>");
		} // if end
		return mav;
	}

	// 2) List
	@RequestMapping("/mediaList")
	public ModelAndView list() {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("media/list");
		mav.addObject("list", atd.list());
//		mav.addObject("root",Utility.getRoot());
		mav.addObject("root", mediaUloadPath); // root
		return mav;
	}

	// 3) Read
	@RequestMapping("/mediaRead")
	public ModelAndView read(mediaVO mvo) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		ModelAndView mav = new ModelAndView();

		int mediano = mvo.getMediano();
		mvo = atd.read(mediano);

		if (mvo != null) {
			String filename = mvo.getFilename();
			filename = filename.toLowerCase();
			if (filename.endsWith(".mp3")) {
				mav.setViewName("media/readMP3");
			} else if (filename.endsWith(".mp4")) {
				mav.setViewName("media/readMP4");
			} // if end
		} // if end
		mav.addObject("mvo", mvo);
		return mav;
	}// read end

	// 4) Update
	@RequestMapping(value = "/mediaUpdate", method = RequestMethod.GET)
	public ModelAndView updateForm(mediaVO mvo) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("media/updateForm");
		mav.addObject("mvo", atd.read(mvo.getMediano()));
		return mav;
	}

	@RequestMapping(value = "/mediaUpdate", method = RequestMethod.POST)
	public ModelAndView updateProc(mediaVO mvo, HttpServletRequest req) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("media/msgView");
		String basePath = mediaUloadPath;

		// 수정전 지정된 기존의 정보 가져오기
		mediaVO oldmvo = atd.read(mvo.getMediano());

		//////////////////////////////////////////////
		// --------- 파일을 수정할 것인지? --------- //
		MultipartFile posterMF = mvo.getPosterMF();
		if (posterMF.getSize() > 0) {
			// 1)파일 크키가 0보다 큼 = 파일이 잘 전송됨
			// 2)기존파일 삭제

			UploadSaveManager.deleteFile(basePath, oldmvo.getPoster());
			String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
			mvo.setPoster(poster);

		} else {
			mvo.setPoster(oldmvo.getPoster());
		}

		MultipartFile filenameMF = mvo.getFilenameMF();
		if (filenameMF.getSize() > 0) {
			UploadSaveManager.deleteFile(basePath, oldmvo.getFilename());
			String filename = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
			mvo.setFilename(filename);
			mvo.setFilesize(filenameMF.getSize());
		} else {
			mvo.setFilename(oldmvo.getFilename());
			mvo.setFilesize(oldmvo.getFilesize());
		} // if end
		atd.update(mvo);
		int cnt = 1;
		if (cnt == 0) {
			mav.addObject("msg1", "<p>수업영상수정실패!!</p>");
//			mav.addObject("img", "<img src='../images/fail.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"mediaList\"'>");
			mav.addObject("link2", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
		} else {
			mav.addObject("msg1", "<p>수업영상수정성공~~</p>");
//			mav.addObject("img", "<img src='../images/sound.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"mediaList\"'>");
		} // if end
		return mav;
	}

	// 5) delete
	@RequestMapping(value = "/mediaDelete", method = RequestMethod.GET)
	public ModelAndView deleteForm(mediaVO mvo) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("media/deleteForm");
		mav.addObject("mvo", atd.read(mvo.getMediano()));
		return mav;
	}

	@RequestMapping(value = "/mediaDelete", method = RequestMethod.POST)
	public ModelAndView delete(mediaVO mvo) {
		Attendance atd = sqlSession.getMapper(Attendance.class);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("media/msgView");
		atd.delete(mvo);
		int cnt = 1;
		if (cnt == 0) {
			mav.addObject("msg1", "<p>수업영상삭제실패!!</p>");
//			mav.addObject("img", "<img src='../images/fail.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"mediaList\"'>");
			mav.addObject("link2", "<input type='button' value='다시시도' onclick='javascript:history.back()'>");
		} else {
			mav.addObject("msg1", "<p>수업영상삭제성공~~</p>");
//			mav.addObject("img", "<img src='../images/sound.png'>");
			mav.addObject("link1", "<input type='button' value='목록으로' onclick='location.href=\"mediaList\"'>");
		} // if end
		return mav;
	}
}