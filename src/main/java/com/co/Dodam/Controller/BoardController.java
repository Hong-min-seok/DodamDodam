package com.co.Dodam.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.co.Dodam.Dto.BoardDTO;
import com.co.Dodam.Service.Board.BoardCommentDeleteService;
import com.co.Dodam.Service.Board.BoardCommentWriteService;
import com.co.Dodam.Service.Board.BoardDeleteService;
import com.co.Dodam.Service.Board.BoardDetailService;
import com.co.Dodam.Service.Board.BoardHitUpService;
import com.co.Dodam.Service.Board.BoardLikeService;
import com.co.Dodam.Service.Board.BoardListService;
import com.co.Dodam.Service.Board.BoardModifyProcessService;
import com.co.Dodam.Service.Board.BoardModifyService;
import com.co.Dodam.Service.Board.BoardWriteService;

@Controller
public class BoardController {

	@Autowired
	BoardWriteService BoardWriteService;
	@Autowired
	BoardDetailService BoardDetailService;
	@Autowired
	BoardCommentWriteService BoardCommentWriteService;
	@Autowired
	BoardCommentDeleteService BoardCommentDeleteService;
	@Autowired
	BoardLikeService BoardLikeService;
	@Autowired
	BoardDeleteService BoardDeleteService;
	@Autowired
	BoardModifyService BoardModifyService;
	@Autowired
	BoardModifyProcessService BoardModifyProcessService;
	@Autowired
	BoardListService boardlist;
	@Autowired
	BoardHitUpService BoardHitUpService;
	

	@RequestMapping("/boardlist")
	public String BoardList(HttpServletRequest request, Model model) {

		ArrayList<BoardDTO> list = boardlist.getboardlist(request);
		model.addAttribute("board", list);

		return "Board/boardlist";
	}

	@RequestMapping("BoardWrite")
	public String BoardWrite(HttpServletRequest request, Model model) {

		return "Board/boardwrite";
	}

	@Resource(name = "uploadPath")
	String uploadPath;

	@RequestMapping("BoardWriteProcess")
	public String BoardWriteProcess(HttpServletRequest request, MultipartFile file, Model model) throws IOException {

		BoardWriteService.boardWrite(request, model, file);

		return "redirect:boardlist?page=1";
	}

	@RequestMapping("BoardDetail")
	public String BoardDetail(HttpServletRequest request, Model model) {

		BoardHitUpService.hitUp(request);
		BoardLikeService.likeUp(request, model);
		BoardDetailService.boardDetail(request, model);

		return "Board/boardDetail";
	}

	@RequestMapping("BoardDelete")
	public String BoardDelete(HttpServletRequest request) {

		BoardDeleteService.boardDelete(request);

		return "redirect:boardlist?page=1";
	}

	@RequestMapping("BoardModify")
	public String BoardModify(HttpServletRequest request, Model model) {

		BoardModifyService.boardModify(request, model);

		return "Board/boardModify";
	}

	@RequestMapping("BoardModifyProcess")
	public String BoardModifyProcess(HttpServletRequest request, MultipartFile file, Model model) throws IOException {

		BoardModifyProcessService.boardModifyProcess(request, file);

		return "redirect:BoardDetail?index=" + request.getParameter("index");
	}

	@RequestMapping(value = "/insertComment", method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> insertComment(@RequestBody Map<String, Object> info) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		retVal = BoardCommentWriteService.boardCommentWrite(info);

		return retVal;
	}

	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> deleteComment(@RequestBody Map<String, Object> info) {

		Map<String, Object> retVal = new HashMap<String, Object>();
		System.out.println(info.toString());
		BoardCommentDeleteService.boardCommentDelete(info);

		return retVal;
	}

	@RequestMapping(value = "/BoardlikeUp", method = RequestMethod.POST, produces = { "application/json" })
	public @ResponseBody Map<String, Object> BoardlikeUp(@RequestBody Map<String, Object> info) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		System.out.println("index: : " + info.get("index"));

		retVal = BoardLikeService.likeUp(info);

		return retVal;
	}

}
