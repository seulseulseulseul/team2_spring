package com.itwill.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwill.domain.CommuDTO;
import com.itwill.domain.PageDTO;
import com.itwill.domain.ReplyDTO;
import com.itwill.service.CommuService;
import com.itwill.service.ReplyService;

@Controller
public class CommuController {
	
	//업로드 될 폴더 경로 
	@Resource(name="commuUploadPath")
	private String commuUploadPath;
	
	@Inject
	private CommuService commuService;
	
	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value = "/commu/insert", method = RequestMethod.GET)
	public String insert(HttpSession session, Model model){
		// 로그인 여부 확인
		if(session.getAttribute("id")==null){ // 비로그인
			// 알림창
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/commu/list");
			
			return "commu/alert";
			
		}
		Object su_id = session.getAttribute("u_id");
		Object st_id = session.getAttribute("t_id");
		String u_id = "";
		if(su_id==null) { // 트레이너회원
			u_id = st_id.toString();
			
		} else { // 일반회원
			u_id = su_id.toString(); 
			
		}
		model.addAttribute("nic",session.getAttribute("nic").toString());
		
		return "commu/insert";
		
	}
	@RequestMapping(value = "/commu/insertPro", method = RequestMethod.POST)
	public String insertPro(HttpSession session, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		// 로그인 여부 확인
		if(session.getAttribute("id")==null){ // 비로그인
			// 알림창
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/commu/list");
			
			return "commu/alert";
			
		}
		// 세션에서 정보 가져오기
		String nic = session.getAttribute("nic").toString();
		Object su_id = session.getAttribute("u_id");
		Object st_id = session.getAttribute("t_id");
		String u_id = "";
		if(su_id == null) { // 트레이너회원
			u_id = st_id.toString();
			
		} else { // 일반회원
			u_id = su_id.toString(); 
			
		}
		// commuDTO 
		CommuDTO commuDTO = new CommuDTO();
		
		// request 정보 commuDTO에 담아 전달
		commuDTO.setU_id(u_id);
		commuDTO.setNic(nic);
		commuDTO.setSubject(request.getParameter("subject"));
		commuDTO.setContent(request.getParameter("content"));
		
		//파일 업로드
		if(!file.getOriginalFilename().equals("")) {
			// 파일 이름 랜덤문자_파일이름 변경
			UUID uid=UUID.randomUUID();
			String fileName = uid.toString()+"_"+file.getOriginalFilename();
			// 업로드 파일을 복사해서 => upload 복사해서 넣기
			File targetFile = new File(commuUploadPath, fileName);
			FileCopyUtils.copy(file.getBytes(), targetFile);
			//BoardDTO 복사된 파일 이름 저장
			commuDTO.setFile(fileName);
			
		}
		commuService.insertBoard(commuDTO);
		
		return "redirect:/commu/list";
		
	}
	@RequestMapping(value = "/commu/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model){
		// 한화면에 보여줄 글개수  10개 설정
		int pageSize=10;
		 
		//페이지 번호 가져오기 
		String pageNum=request.getParameter("pageNum");
		//페이지번호가 없으면 -> 1
		if(pageNum==null){
			pageNum="1";
			
		}
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<CommuDTO> commuList=commuService.getBoardList(pageDTO);
		 
		// 전체 커뮤니티글 개수
		int count = commuService.getBoardCount();
		pageDTO.setCount(count);
		 
		// 데이터 담기
		model.addAttribute("commuList", commuList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "commu/list";
		
	}
	@RequestMapping(value = "/commu/searchList", method = RequestMethod.GET)
	public String list2(HttpServletRequest request, Model model){
		// 검색어 가져오기
		String search = request.getParameter("search");
		
		// 한화면에 보여줄 글개수 10개 설정
		int pageSize=10;		 
		// 페이지 번호 가져오기 
		String pageNum=request.getParameter("pageNum");
		// 페이지번호가 없으면 -> 1
		if(pageNum==null){
			pageNum="1";
			
		}
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setSearch(search);
		
		List<CommuDTO> commuList=commuService.getSearchList(pageDTO);
		 
		// 검색 결과 커뮤니티글 개수
		int count = commuService.getSearchCount(search);
		pageDTO.setCount(count);
		 
		// 데이터 담기
		model.addAttribute("commuList", commuList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "commu/searchList";
		
	}
	@RequestMapping(value = "/commu/content", method = RequestMethod.GET)
	public String content(CommuDTO commuDTO, PageDTO pageDTO, HttpServletRequest request, Model model){
		// 커뮤니티글 번호 저장
		int c_num = 0;
		if(request.getParameter("c_num")!=null) {
			c_num = Integer.parseInt(request.getParameter("c_num"));
			
		}
		// 조회수 +1
		commuService.updateReadcount(c_num);
		// c_num을 저장한 commuDTO 전달하여 글정보 불러오기
		commuDTO = commuService.getBoard(c_num);
		
		// 한화면에 보여줄 댓글개수 10개 설정
		int pageSize=10;
		// 댓글 페이지번호 가져오기 
		String pageNum=request.getParameter("pageNum");
		// 페이지번호가 없으면 -> 1
		if(pageNum==null){
			pageNum="1";
			
		}
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setC_num(c_num);
		
		// 댓글목록 불러오기
		List<ReplyDTO> replyList = replyService.getBoardList(pageDTO);
		
		// 커뮤니티글 전체 댓글 개수
		int count = replyService.getBoardCount(c_num);
		pageDTO.setCount(count);
		
		model.addAttribute("commuDTO", commuDTO);
		model.addAttribute("replyList", replyList);
		
		return "commu/content";
		
	}
	@RequestMapping(value = "/commu/update", method = RequestMethod.GET)
	public String update(CommuDTO commuDTO, CommuDTO commuDTO2, HttpSession session, HttpServletRequest request, Model model){
		int c_num =0;
		if(request.getParameter("c_num")!=null) {
			c_num = Integer.parseInt(request.getParameter("c_num"));
			
		}
		// 로그인 여부 확인
		if(session.getAttribute("id")==null){ // 비로그인
			// 알림창
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			
			return "commu/alert";
			
		} else {
			// 본인 확인에 필요한 정보 가져오기
			Object su_id = session.getAttribute("u_id");
			Object st_id = session.getAttribute("t_id");
			String u_id = "";
			if(su_id==null) { // 트레이너회원
				u_id = st_id.toString();
				
			} else { // 일반회원
				u_id = su_id.toString(); 
				
			}
			commuDTO.setC_num(c_num);
			commuDTO.setU_id(u_id);
			
			// 본인확인
			commuDTO2 = commuService.numCheck(commuDTO);
			if(commuDTO2!=null) { // 본인일 경우
				// commuDTO 전달
				model.addAttribute("commuDTO", commuDTO2);
				return "commu/update";	
				
			} else { // 본인이 아닐 경우
				// 알람창
				model.addAttribute("msg", "자신의 글만 수정할 수 있습니다.");
				model.addAttribute("url", "/commu/content?c_num="+c_num);
				return "commu/alert";
			}	
		}
	}
	@RequestMapping(value = "/commu/updatePro", method = RequestMethod.POST)
	public String updatePro(Model model, HttpSession session, HttpServletRequest request, MultipartFile file) throws Exception {
		// request에서 글번호 가져오기
		int c_num = 0;
		if(request.getParameter("c_num")!=null) {
			c_num = Integer.parseInt(request.getParameter("c_num"));
			
		}
		// 로그인 여부
		if(session.getAttribute("id")==null) { // 비로그인
			// 알림창
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			return "commu/alert";
			
		}
		// 세션에서 정보 가져오기
		Object su_id = session.getAttribute("u_id");
		Object st_id = session.getAttribute("t_id");
		String u_id = "";
		if(su_id==null) { // 트레이너회원
			u_id = st_id.toString();
			
		} else { // 일반회원
			u_id = su_id.toString(); 
			
		}
		CommuDTO commuDTO = new CommuDTO();
		CommuDTO commuDTO2 = new CommuDTO();
		commuDTO.setC_num(c_num);
		commuDTO.setU_id(u_id);
				
		// 본인확인
		commuDTO2 = commuService.numCheck(commuDTO);
		if(commuDTO2 != null) { // 본인일 경우
			commuDTO.setSubject(request.getParameter("subject"));
			commuDTO.setContent(request.getParameter("content"));
			System.out.println(file.getOriginalFilename().length());
			if(file.getOriginalFilename().length()!=0) { // 파일을 수정하는 경우
				// 파일 이름 랜덤문자_파일이름 변경
				UUID uid=UUID.randomUUID();
				String fileName=uid.toString()+"_"+file.getOriginalFilename();
				// 업로드 파일을 복사해서 => upload 복사해서 넣기
				File targetFile=new File(commuUploadPath,fileName);
				FileCopyUtils.copy(file.getBytes(), targetFile);
				//BoardDTO 복사된 파일 이름 저장
				commuDTO.setFile(fileName);
				
			} else { // 파일 수정하지 않는 경우
				commuDTO.setFile(commuDTO2.getFile());
				
			}
			commuService.updateBoard(commuDTO);
			
			// 알림창
			model.addAttribute("msg", "커뮤니티글이 수정되었습니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			
		} else { // 본인이 아닐 경우
			// 알람창
			model.addAttribute("msg", "자신의 글만 수정할 수 있습니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			
		}
		return "commu/alert";
		
	}
	@RequestMapping(value = "/commu/deletePro", method = RequestMethod.GET)
	public String deletePro(CommuDTO commuDTO, RedirectAttributes ra, HttpSession session, HttpServletRequest request, Model model){
		// request에서 글번호 가져오기
		int c_num = 0;
		if(request.getParameter("c_num")!=null) {
			c_num = Integer.parseInt(request.getParameter("c_num"));
			
		}
		// 로그인 여부
		if(session.getAttribute("id")==null) { // 비로그인
			// 알림창
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			return "commu/alert";
			
		}
		// 세션에서 정보 가져오기
		Object su_id = session.getAttribute("u_id");
		Object st_id = session.getAttribute("t_id");
		String u_id = "";
		if(su_id==null) { // 트레이너회원
			u_id = st_id.toString();
			
		} else { // 일반회원
			u_id = su_id.toString(); 
			
		}
		// 본인확인에 필요한 글번호 request에서 가져오기
		commuDTO.setC_num(c_num);
		commuDTO.setU_id(u_id);
		
		// 본인확인
		if(commuService.numCheck(commuDTO)!=null) { // 본인일 경우
			// 커뮤니티글 삭제
			commuService.deleteBoard(c_num);
			// 커뮤니티글에 속한 댓글 모두 삭제
			replyService.deleteBoardAll(c_num);
			// 알림창
			model.addAttribute("msg", "커뮤니티글이 삭제되었습니다.");
			model.addAttribute("url", "/commu/list");
			
		} else { // 본인이 아닐 경우
			// 알림창
			model.addAttribute("msg", "자신의 글만 삭제할 수 있습니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			
		}
		return "commu/alert";
		
	}
//	댓글기능
	// 커뮤니티글에 댓글작성
	@RequestMapping(value = "/commu/insertReply", method = RequestMethod.POST)
	public String insert(ReplyDTO replyDTO, ReplyDTO replyDTO2, Model model, HttpSession session, HttpServletRequest request) {
		// 커뮤니티글 번호 가져오기
		int c_num = 0;
		if(request.getParameter("c_num")!=null) {
			c_num = Integer.parseInt(request.getParameter("c_num"));
			
		}
		// 로그인 여부 확인
		if(session.getAttribute("id")==null){ // 비로그인
			// 알람창
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			return "commu/alert";
			
		}
		// 세션에서 정보 가져오기
		String nic = session.getAttribute("nic").toString();
		Object su_id = session.getAttribute("u_id");
		Object st_id = session.getAttribute("t_id");
		String u_id = "";
		if(su_id==null) { // 트레이너회원
			u_id = st_id.toString();
			
		} else { // 일반회원
			u_id = su_id.toString();
			
		}
		// 댓글 정보 replyDTO에 저장
		replyDTO.setU_id(u_id);
		replyDTO.setNic(nic);
		replyDTO.setC_num(c_num);
		replyDTO.setContent(request.getParameter("content"));
		replyDTO.setParent(0); // 부모댓글 없음
		replyDTO.setDepth(0); // 깊이 없음
		
		// replyDTO 전달하여 댓글 작성
		replyDTO2 = replyService.insertBoard(replyDTO);
		
		// 작성한 댓글의 페이지 불러오기 
		int currentPage = replyService.getReplyPage(replyDTO2);
		
		return "redirect:/commu/content?c_num="+c_num+"&pageNum="+currentPage;
	}
	// 댓글에 댓글작성(대댓글)
	@RequestMapping(value = "/commu/insertReply2", method = RequestMethod.POST)
	public String insert2(ReplyDTO replyDTO, ReplyDTO replyDTO2, Model model, HttpSession session, HttpServletRequest request) {
		// 부모댓글 정보 가져오기
		int r_num = 0;
		int c_num = 0;
		if(request.getParameter("c_num")!=null) {
			c_num = Integer.parseInt(request.getParameter("c_num"));
			
		}
		if(request.getParameter("r_num")!=null) {
			r_num = Integer.parseInt(request.getParameter("r_num"));
			
		}
		// 로그인 여부 확인
		if(session.getAttribute("id")==null){ // 비로그인
			// 알람창
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			return "commu/alert";
			
		}
		// 세션에서 정보 가져오기
		String nic = session.getAttribute("nic").toString();
		Object su_id = session.getAttribute("u_id");
		Object st_id = session.getAttribute("t_id");
		String u_id = "";
		if(su_id==null) { // 트레이너회원
			u_id = st_id.toString();
			
		} else { // 일반회원
			u_id = su_id.toString();
			
		}
		// 부모댓글 정보 가져오기
		replyDTO = replyService.getBoard(r_num);
		int r_order = replyDTO.getR_order();
		int depth = replyDTO.getDepth();
		
		// 댓글 순서 재정렬
		replyService.reOrder(r_order); // 부모댓글보다 r_order가 큰 댓글들 r_order +1
		
		// 대댓글 정보 replyDTO2에 저장
		replyDTO2.setU_id(u_id); // 작성자 아이디
		replyDTO2.setNic(nic); // 작성자 닉네임
		replyDTO2.setC_num(c_num); // 커뮤니티글 번호
		replyDTO2.setParent(r_num); // 부모댓글 번호
		replyDTO2.setR_order(r_order +1); // 부모댓글 순서 +1
		replyDTO2.setDepth(depth +1); // 부모댓글 깊이 +1
		replyDTO2.setContent(request.getParameter("content")); // 글내용
		
		// replyDTO2 전달하여 댓글 작성
		replyService.insertBoard2(replyDTO2);
		
		// 작성한 댓글의 페이지 불러오기 
		int currentPage = replyService.getReplyPage(replyDTO2);
		
		return "redirect:/commu/content?c_num="+c_num+"&pageNum="+currentPage;
	}
	// 댓글 삭제
	@RequestMapping(value = "/commu/deleteReply", method = RequestMethod.GET)
	public String delete(ReplyDTO replyDTO, ReplyDTO replyDTO2, Model model, HttpSession session, HttpServletRequest request) {
		// request에서 글번호, 댓글번호 가져오기
		int c_num = 0;
		int r_num = 0;
		if(request.getParameter("c_num")!=null) {
			c_num = Integer.parseInt(request.getParameter("c_num"));
			System.out.println(c_num);
		}
		if(request.getParameter("r_num")!=null) {
			r_num = Integer.parseInt(request.getParameter("r_num"));
			System.out.println(r_num);
		}
		// 로그인 여부
		if(session.getAttribute("id")==null) { // 비로그인
			// 알림창
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			return "commu/alert";
			
		}
		// 세션에서 정보 가져오기
		Object su_id = session.getAttribute("u_id");
		Object st_id = session.getAttribute("t_id");
		String u_id = "";
		if(su_id==null) { // 트레이너회원
			u_id = st_id.toString();
			
		} else { // 일반회원
			u_id = su_id.toString();
			
		}
		// 본인확인에 필요한 글번호 request에서 가져오기
		replyDTO.setR_num(r_num);
		replyDTO.setU_id(u_id);
		
		// 본인확인
		replyDTO2 = replyService.numCheck(replyDTO);
		if(replyDTO2 == null) {
			// 알림창
			model.addAttribute("msg", "자신의 글만 삭제할 수 있습니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			
		} else {
			if(replyService.isNoReply(r_num) == 1) { // 대댓글이 있는 경우
				// 알림창
				model.addAttribute("msg", "댓글이 달려있어 삭제할 수 없습니다.");
				model.addAttribute("url", "/commu/content?c_num="+c_num);
				
			} else { // 대댓글이 없는 경우
				replyService.deleteBoard(r_num);
				
				// 알림창
				model.addAttribute("msg", "댓글이 삭제되었습니다.");
				model.addAttribute("url", "/commu/content?c_num="+c_num);
				
			}
		}
		return "commu/alert";
		
	}
	// 댓글 수정
	@RequestMapping(value = "/commu/updateReply", method = RequestMethod.GET)
	public String update(ReplyDTO replyDTO, ReplyDTO replyDTO2, HttpSession session, HttpServletRequest request, Model model){
		// request에서 글번호, 댓글번호 가져오기
		int c_num = 0;
		int r_num = 0;
		if(request.getParameter("c_num")!=null) {
			c_num = Integer.parseInt(request.getParameter("c_num"));
			
		}
		if(request.getParameter("r_num")!=null) {
			r_num = Integer.parseInt(request.getParameter("r_num"));
			
		}
		// 로그인 여부
		if(session.getAttribute("id")==null) { // 비로그인
			// 알림창
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			return "commu/alert";
			
		}
		// 세션에서 정보 가져오기
		Object su_id = session.getAttribute("u_id");
		Object st_id = session.getAttribute("t_id");
		String u_id = "";
		if(su_id==null) { // 트레이너회원
			u_id = st_id.toString();
			
		} else { // 일반회원
			u_id = su_id.toString(); 
			
		}
		// 본인확인에 필요한 글번호 request에서 가져오기
		replyDTO.setR_num(r_num);
		replyDTO.setU_id(u_id);
		
		// 본인확인
		replyDTO2 = replyService.numCheck(replyDTO);
		if(replyDTO2 == null) {
			// 알림창
			model.addAttribute("msg", "자신의 글만 수정할 수 있습니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			return "commu/alert";
			
		} else {
			// request에서 댓글 정보 가져오기
			replyDTO.setContent(request.getParameter("content"));
			// replyDTO 전달
			replyService.updateBoard(replyDTO);
			
			// 알림창
			model.addAttribute("msg", "댓글이 삭제되었습니다.");
			model.addAttribute("url", "/commu/content?c_num="+c_num);
			return "commu/alert"; 
		
		}
	}
}