package com.itbank.student;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.student.dto.StudentDTO;
import com.itbank.student.service.StudentMapper;

@Controller
public class StudentController {
	
	@Autowired
	private StudentMapper studentMapper;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "index";
	}
	
	@RequestMapping("/index_student.do")
	public String student() {
		return "student/student";
	}

	@RequestMapping("/list_student.do")
	public String listStudent(HttpServletRequest req) {
		List<StudentDTO> list = studentMapper.listStudent();
		req.setAttribute("listStudent", list);
		return "student/list";
	}  
	
	@RequestMapping("/delete_student.do")
	public String deleteStudent(HttpServletRequest req, @RequestParam String id) {
		int res = studentMapper.deleteStudent(id);
		String msg = null, url = null;
		if (res>0) {
			msg = "학생삭제 성공!! 학생목록페이지로 이동합니다.";
			url = "list_student.do";
		}else {
			msg = "학생삭제 실패!! 학생관리페이지로 이동합니다.";
			url = "index_student.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/insert_student.do")
	public String insertStudent(HttpServletRequest req, @ModelAttribute StudentDTO dto) {
		int res = studentMapper.insertStudent(dto);
		String msg = null, url = null;
		if (res>0) {
			msg = "학생등록 성공!! 학생목록페이지로 이동합니다.";
			url = "list_student.do";
		}else {
			msg = "학생등록 실패!! 학생관리페이지로 이동합니다.";
			url = "index_student.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	@RequestMapping("/find_student.do")
	public String findStudent(HttpServletRequest req, @RequestParam String name) {
		List<StudentDTO> list = studentMapper.findStudent(name);
		req.setAttribute("listStudent", list);
		return "student/list";
	}
}
