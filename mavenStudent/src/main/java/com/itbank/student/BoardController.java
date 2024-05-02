package com.itbank.student;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.student.dto.BoardDTO;
import com.itbank.student.service.BoardMapper;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper boardMapper;

	@RequestMapping("/list_board.do")
	public ModelAndView listBoard() {
		List<BoardDTO> list = boardMapper.listBoard();
		return new ModelAndView("board/list", "listBoard", list);
	}

	@RequestMapping(value = "/write_board.do", method = RequestMethod.GET)
	public String writeFormBoard() {
		return "board/writeForm";
	}

	@RequestMapping(value = "/write_board.do", method = RequestMethod.POST)
	public String writeProBoard(HttpServletRequest req, @ModelAttribute BoardDTO dto) {
		dto.setIp(req.getRemoteAddr());
		int res = boardMapper.insertBoard(dto);
		String msg = null, url = null;
		if (res > 0) {
			msg = "�Խñ��� ��� �Ǿ����ϴ�. �Խñ۸���������� �̵��մϴ�.";
			url = "list_board.do";
		} else {
			msg = "�Խñ۵���� �����Ͽ����ϴ�. �Խñ۵���������� �̵��մϴ�.";
			url = "write_board.do";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}

	@RequestMapping("/content_board.do")
	public String contentBoard(HttpServletRequest req, @RequestParam int num) {
		BoardDTO dto = boardMapper.getBoard(num, "content");
		req.setAttribute("getBoard", dto);
		return "board/content";
	}

	@RequestMapping(value = "/delete_board.do", method = RequestMethod.GET)
	public String deleteFormBoard() {
		return "board/deleteForm";
	}

	@RequestMapping(value = "/delete_board.do", method = RequestMethod.POST)
	public ModelAndView deleteProBoard(HttpServletRequest req, @RequestParam Map<String, String> params) {
		int res = boardMapper.deleteBoard(Integer.parseInt(params.get("num")), params.get("passwd"));
		ModelAndView mav = new ModelAndView("message");
		if (res > 0) {
			mav.addObject("msg", "�ۻ��� ����!! �۸���������� �̵��մϴ�.");
			mav.addObject("url", "list_board.do");
		} else if (res < 0) {
			req.setAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���!!");
			req.setAttribute("url", "delete_board.do?num=" + params.get("num"));
		} else {
			req.setAttribute("msg", "�ۻ��� ����!! �ۺ����������� �̵��մϴ�.");
			req.setAttribute("url", "content_board.do?num=" + params.get("num"));
		}
		return mav;
	}

	@RequestMapping(value = "/update_board.do", method = RequestMethod.GET)
	public String updateFormBoard(HttpServletRequest req, @RequestParam int num) {
		BoardDTO dto = boardMapper.getBoard(num, "update");
		req.setAttribute("getBoard", dto);
		return "board/updateForm";
	}

	@RequestMapping(value = "/update_board.do", method = RequestMethod.POST)
	public ModelAndView updateProBoard(HttpServletRequest req, @ModelAttribute BoardDTO dto) {
		dto.setIp(req.getRemoteAddr());
		int res = boardMapper.updateBoard(dto);
		ModelAndView mav = new ModelAndView("message");
		if (res > 0) {
			mav.addObject("msg", "�ۼ��� ����!! �۸���������� �̵��մϴ�.");
			mav.addObject("url", "list_board.do");
		} else if (res < 0) {
			req.setAttribute("msg", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���!!");
			req.setAttribute("url", "update_board.do?num=" + dto.getNum());
		} else {
			req.setAttribute("msg", "�ۼ��� ����!! �ۺ����������� �̵��մϴ�.");
			req.setAttribute("url", "content_board.do?num=" + dto.getNum());
		}
		return mav;
	}
}