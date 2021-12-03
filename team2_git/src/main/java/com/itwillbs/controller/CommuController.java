package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.CommuDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.service.CommuService;

@Controller
public class CommuController {
	
	//업로드 될 폴더 경로 
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private CommuService commuService;
	
	@Inject
	private ReplyService replyService;
	
	@RequestMapping(value = "/commu/insert", method = RequestMethod.GET)
	public String insert(HttpSession session){
		
		// 세션에서 정보 가져오기
		String u_id=session.getAttribute("u_id").toString();
		String nic=session.getAttribute("nic").toString();
		
		// 로그인 여부 확인
		if(u_id==null){
			return "redirect:/remember/login";
		}
		
		return "commu/insert";
		
	}
	@RequestMapping(value = "/commu/insertPro", method = RequestMethod.POST)
	public String insertPro(HttpSession session, HttpServletRequest request, MultipartFile file) throws Exception {
		// 세션에서 정보 가져오기
		String u_id=session.getAttribute("u_id").toString();
		String nic=session.getAttribute("nic").toString();
		
		// 로그인 여부 확인
		if(u_id==null){
			return "redirect:/member/login";
		}
		
		// request 정보 commuDTO에 담아 전달
		CommuDTO commuDTO = new CommuDTO();
		commuDTO.setU_id(u_id);
		commuDTO.setSubject(request.getParameter("subject"));
		commuDTO.setContent(request.getParameter("content"));
		//파일 업로드
		// 파일 이름 랜덤문자_파일이름 변경
		UUID uid=UUID.randomUUID();
		String fileName=uid.toString()+"_"+file.getOriginalFilename();
		// 업로드 파일을 복사해서 => upload 복사해서 넣기
		File targetFile=new File(uploadPath,fileName);
		FileCopyUtils.copy(file.getBytes(), targetFile);
		//BoardDTO 복사된 파일 이름 저장
		commuDTO.setFile(fileName);
		
		commuService.insertBoard(commuDTO);
		
		return "redirect:/commu/list";
	}
	@RequestMapping(value = "/commu/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request,Model model){
		// 한화면에 보여줄 글개수  10개 설정
		int pageSize=10;
		 
		//페이지 번호 가져오기 
		String pageNum=request.getParameter("pageNum");
		//페이지번호가 없으면 -> 1
		if(pageNum==null){
			pageNum="1";
		}
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<CommuDTO> commuList=commuService.getBoardList(pageDTO);
		 
		//게시판 전체 글 개수  select count(*) from board
		// int count=boardDAO.getBoardCount();
		int count = commuService.getBoardCount();
		pageDTO.setCount(count);
		 
		// 데이터 담기
		model.addAttribute("commuList",commuList);
		model.addAttribute("pageDTO",pageDTO);
		 
		 
//		/WEB-INF/views/commu/list.jsp  => 이동
		return "commu/list";
	}
	@RequestMapping(value = "/commu/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model){
		// commuDTO 인스턴스 생성
		CommuDTO commuDTO = new CommuDTO();
		commuDTO.setC_num(Integer.parseInt(request.getParameter("c_num")));
		// c_num을 저장한 commuDTO 전달하여 글정보 리턴
		commuDTO = commuService.getBoard(commuDTO);
		// replyDTO 인스턴스 생성
		ReplyDTO replyDTO = new ReplyDTO();
		// 댓글목록 불러오기
		replyDTO = replyService.getBoardList();
		
		model.addAttribute("commuDTO", commuDTO);
		model.addAttribute("replyDTO", replyDTO);
		
		return "commu/content";
	}
	@RequestMapping(value = "/commu/update", method = RequestMethod.GET)
	public String update(HttpSession session, HttpServletRequest request, Model model){
		// CommuDTO 객체 생성
		CommuDTO commuDTO = new CommuDTO();
		// 본인확인에 필요한 정보 session에서 가져오기
		commuDTO.setU_id(session.getAttribute("u_id").toString());
		// 본인확인에 필요한 글번호 request에서 가져오기
		commuDTO.setC_num(Integer.parseInt(request.getParameter("c_num")));
		
		// 본인확인
		if(commuService.numCheck(commuDTO)!=null) { // 본인일 경우
			// commuDTO 전달 후 리턴값 저장
			commuDTO = commuService.getBoard(commuDTO);
			
			model.addAttribute("commuDTO", commuDTO);
			
			return "commu/update";	
		} else { // 본인이 아닐 경우
			return "redirect:/commu/list";
		}
	}
	@RequestMapping(value = "/commu/updatePro", method = RequestMethod.POST)
	public String updatePro(HttpSession session, HttpServletRequest request, MultipartFile file) throws Exception {
		// CommuDTO 객체 생성
		CommuDTO commuDTO = new CommuDTO();
		// 본인확인에 필요한 정보 session에서 가져오기
		commuDTO.setU_id(session.getAttribute("u_id").toString());
		// 본인확인에 필요한 글번호 request에서 가져오기
		commuDTO.setC_num(Integer.parseInt(request.getParameter("c_num")));
				
		// 본인확인
		if(commuService.numCheck(commuDTO)!=null) { // 본인일 경우
			commuDTO.setSubject(request.getParameter("subject"));
			commuDTO.setContent(request.getParameter("content"));
			// 파일이 null인 경우
			if(request.getParameter("file") == null) {
				commuDTO.setFile(commuDTO.getFile());
			} else {
				//파일 업로드
				// 파일 이름 랜덤문자_파일이름 변경
				UUID uid=UUID.randomUUID();
				String fileName=uid.toString()+"_"+file.getOriginalFilename();
				// 업로드 파일을 복사해서 => upload 복사해서 넣기
				File targetFile=new File(uploadPath,fileName);
				FileCopyUtils.copy(file.getBytes(), targetFile);
				//BoardDTO 복사된 파일 이름 저장
				commuDTO.setFile(fileName);
			}
			
			commuService.insertBoard(commuDTO);
			
			return "redirect:/commu/list";
			
		} else { // 본인이 아닐 경우
			return "redirect:/commu/list";
		}
		
	}
	@RequestMapping(value = "/commu/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, HttpServletRequest request){
		
		// 글 삭제시 댓글 모두 삭제기능 추가
		
		// CommuDTO 객체 생성
		CommuDTO commuDTO = new CommuDTO();
		// 본인확인에 필요한 정보 session에서 가져오기
		commuDTO.setU_id(session.getAttribute("u_id").toString());
		// 본인확인에 필요한 글번호 request에서 가져오기
		commuDTO.setC_num(Integer.parseInt(request.getParameter("c_num")));
		
		// 본인확인
		if(commuService.numCheck(commuDTO)!=null) { // 본인일 경우
			commuService.deleteBoard(commuDTO);
			return "commu/delete";
			
		} else { // 본인이 아닐 경우
			return "redirect:/commu/list";
			
		}
	}
	
}