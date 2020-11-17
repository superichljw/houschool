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
		System.out.println("---------------MediaCont() ��ü������");
		// Ȯ�ο뿡�� ���� void ��������
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
		// 1) pom.xml -> file ���ε�/�ٿ�ε� ���� �������߰�
		// 2) mediaVO -> posterMF, filenameMF �ʵ� �߰�, getter setter �Լ� ����
		// 3) servlet-context.xml�� �������� ���

		Attendance atd = sqlSession.getMapper(Attendance.class);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mediaList");
		mav.addObject("root", mediaUloadPath); // videoclass
//		mav.addObject("root",Utility.getRoot());

		// ���۵� ���� ó��
		// -> ���� ������ /media/storage������ ����
		// -> ����� ���ϰ��� ������ media���̺� ����
		// ���Ͽ� ����� ���� �������� ���
//		String basicPath = req.getRealPath("/resources/storage");
		String basicPath = mediaUloadPath;
		// 1)<input type='file' name='posterMF'>
		// ���� ��������
		MultipartFile posterMF = mvo.getPosterMF();
		// ���� �����ϰ� �����ӵ� ���ϸ� ��ȯ
		String poster = UploadSaveManager.saveFileSpring30(posterMF, basicPath); // ���ϸ�� ��θ�
		// �����ӵ� ���ϸ� mvo��ü ���
		mvo.setPoster(poster);

		// 2) <input type='file' name='filenameMF'>
		MultipartFile filenameMF = mvo.getFilenameMF();
		String filename = UploadSaveManager.saveFileSpring30(filenameMF, basicPath);
		mvo.setFilename(filename);
		mvo.setFilesize(filenameMF.getSize());

		atd.create(mvo);
		int cnt = 1;
		if (cnt == 0) {
			mav.addObject("msg1", "<p>���������� ����!</p>");
//			mav.addObject("img", "<img src='../images/fail.png'>");
			mav.addObject("link1", "<input type='button' value='�������' onclick='location.href=\"mediaList\"'>");
			mav.addObject("link1", "<input type='button' value='�������' onclick='location.href=\"mediaCreate\"'>");

		} else {
			mav.addObject("msg1", "<p>���������� ����!</p>");
//			mav.addObject("img", "<img src='../images/sound.png'>");
			mav.addObject("link1", "<input type='button' value='�������' onclick='location.href=\"mediaList\"'>");
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

		// ������ ������ ������ ���� ��������
		mediaVO oldmvo = atd.read(mvo.getMediano());

		//////////////////////////////////////////////
		// --------- ������ ������ ������? --------- //
		MultipartFile posterMF = mvo.getPosterMF();
		if (posterMF.getSize() > 0) {
			// 1)���� ũŰ�� 0���� ŭ = ������ �� ���۵�
			// 2)�������� ����

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
			mav.addObject("msg1", "<p>���������������!!</p>");
//			mav.addObject("img", "<img src='../images/fail.png'>");
			mav.addObject("link1", "<input type='button' value='�������' onclick='location.href=\"mediaList\"'>");
			mav.addObject("link2", "<input type='button' value='�ٽýõ�' onclick='javascript:history.back()'>");
		} else {
			mav.addObject("msg1", "<p>���������������~~</p>");
//			mav.addObject("img", "<img src='../images/sound.png'>");
			mav.addObject("link1", "<input type='button' value='�������' onclick='location.href=\"mediaList\"'>");
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
			mav.addObject("msg1", "<p>���������������!!</p>");
//			mav.addObject("img", "<img src='../images/fail.png'>");
			mav.addObject("link1", "<input type='button' value='�������' onclick='location.href=\"mediaList\"'>");
			mav.addObject("link2", "<input type='button' value='�ٽýõ�' onclick='javascript:history.back()'>");
		} else {
			mav.addObject("msg1", "<p>���������������~~</p>");
//			mav.addObject("img", "<img src='../images/sound.png'>");
			mav.addObject("link1", "<input type='button' value='�������' onclick='location.href=\"mediaList\"'>");
		} // if end
		return mav;
	}
}