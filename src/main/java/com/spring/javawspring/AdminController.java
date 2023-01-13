package com.spring.javawspring;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javawspring.pagination.PageProcess;
import com.spring.javawspring.pagination.PageVO;
import com.spring.javawspring.service.AdminService;
import com.spring.javawspring.service.BoardService;
import com.spring.javawspring.service.MemberService;
import com.spring.javawspring.vo.BoardVO;
import com.spring.javawspring.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping(value="/adminMain",method=RequestMethod.GET)
	public String adminMainGet() {
		return "admin/adminMain";
	}
	@RequestMapping(value="/adminContent",method=RequestMethod.GET)
	public String adminContentGet(Model model) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		//오늘 쓴글 가져오기
		int todayBoard = boardService.getNewBoardCount(today);
		
		//오늘 가입자 가져오기
		int todayMember = adminService.getNewMemberCount(today);
		
		System.out.println(today);
		
		model.addAttribute("boardCnt", todayBoard);
		model.addAttribute("memberCnt", todayMember);
		return "admin/adminContent";
	}
	@RequestMapping(value="/adminLeft",method=RequestMethod.GET)
	public String adminLeftGet() {
		return "admin/adminLeft";
	}
	@RequestMapping(value="/member/adminMemberList", method = RequestMethod.GET)
	public String adminMemberListGet(Model model,
			@RequestParam(name="mid",defaultValue="", required = false)String mid,
			@RequestParam(name="pag",defaultValue="1", required = false)int pag,
			@RequestParam(name="pagSize",defaultValue="3", required = false)int pageSize) {
		
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "member","","");
		
		ArrayList<MemberVO> vos = memberService.getMemberList(pageVO.getStartIndexNo(),pageSize);
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		
		
		model.addAttribute("mid",mid);
	 		
		
		return "admin/member/adminMemberList";
	}
	//회원 등급 변경하기
	@ResponseBody
	@RequestMapping(value="/member/adminMemberLevel", method=RequestMethod.POST)
	public String adminMemberLevelPost(int idx, int level) {
		int res = adminService.setMemberLevelCheck(idx,level);
		
		return res+"";
	}
	//ckeditor폴더의 파일리스트 보여주기
	@RequestMapping(value="file/fileList",method = RequestMethod.GET)
	public String fileListGet(HttpServletRequest request,Model model) {
		String realPath = request.getRealPath("resources/data/ckeditor/");
		
		String [] files = new File(realPath).list();
		
		model.addAttribute("files", files);
		
		return "admin/file/fileList";
	}
	@ResponseBody
	@RequestMapping(value="/fileSelectDelete", method=RequestMethod.POST)
	public String fileSelectDeletePost(HttpServletRequest request,String delItems) {
		//System.out.println("delItems: "+delItems);
		String realPath = request.getRealPath("/resources/data/ckeditor/");
		delItems = delItems.substring(0,delItems.length()-1);
		
		String [] fileNames = delItems.split("/");
		for(String fileName:fileNames) {
			String realPathFile = realPath+fileName;
			new File(realPathFile).delete();
		}
		
		return "1";
	}
	@RequestMapping(value="/board/adminBoardList", method = RequestMethod.GET)
	public String adminBoardListGet(Model model,
					@RequestParam(name="pag", defaultValue = "1", required=false)int pag,
					@RequestParam(name="pageSize", defaultValue = "5", required=false)int pageSize) {
				PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "board", "", "");
				
				List<BoardVO> vos = boardService.getBoardList(pageVO.getStartIndexNo(),pageSize);
				
				model.addAttribute("vos", vos);
				model.addAttribute("pageVO", pageVO);
		
		
		return "admin/board/adminBoardList";
	}
	@ResponseBody
	@RequestMapping(value="/board/adminBoardDelete",method=RequestMethod.POST)
	public String adminBoardDeletePost(String delItems) {
		delItems = delItems.substring(0, delItems.length()-1);
		String [] items = delItems.split("/");
		
		for(String item : items) {
			int idx = Integer.parseInt(item);
			boardService.setBoardDeleteOk(idx);
		}
		
		return "1";
	}
	
}
