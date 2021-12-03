package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class BoardController {
	
	//업로드 될 폴더 경로 
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// BoardService boardService=new BoardServiceImpl() 객체생성
	@Inject
	private BoardService boardService;

	// http://localhost:8181/myweb/board/write
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public String insert() {
//		/WEB-INF/views/board/writeForm.jsp  => 이동
		
		return "board/writeForm";
	}
	
	// http://localhost:8181/myweb/board/writePro
	@RequestMapping(value = "/board/writePro", method = RequestMethod.POST)
	public String insertPro(BoardDTO boardDTO) {
		
		System.out.println(" BoardController  insertPro ");
		
		boardService.insertBoard(boardDTO);
		
		return "redirect:/board/list";
	}
	
	// http://localhost:8181/myweb/board/list
	// http://localhost:8181/myweb/board/list?pageNum=2
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request,Model model) {
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
		
		 List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		 
		//게시판 전체 글 개수  select count(*) from board
		// int count=boardDAO.getBoardCount();
		 int count = boardService.getBoardCount();
		 pageDTO.setCount(count);
		 
		 // 데이터 담기
		 model.addAttribute("boardList",boardList);
		 model.addAttribute("pageDTO",pageDTO);
		 
		 
//		/WEB-INF/views/board/list.jsp  => 이동
		return "board/list";
	}
	
	// http://localhost:8181/myweb/board/fwrite
	@RequestMapping(value = "/board/fwrite", method = RequestMethod.GET)
	public String finsert() {
//		/WEB-INF/views/board/fwriteForm.jsp  => 이동
		
		return "board/fwriteForm";
	}
	
	// http://localhost:8181/myweb/board/fwritePro
	@RequestMapping(value = "/board/fwritePro", method = RequestMethod.POST)
	public String finsertPro(HttpServletRequest request, MultipartFile file) throws Exception {
		
		System.out.println(" BoardController  finsertPro ");
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setName(request.getParameter("name"));
		boardDTO.setPass(request.getParameter("pass"));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		//파일 업로드
		// 파일 이름 랜덤문자_파일이름 변경
		UUID uid=UUID.randomUUID();
		String fileName=uid.toString()+"_"+file.getOriginalFilename();
		System.out.println(fileName);
		// 업로드 파일을 복사해서 => upload 복사해서 넣기
		File targetFile=new File(uploadPath,fileName);
		FileCopyUtils.copy(file.getBytes(), targetFile);
		//BoardDTO 복사된 파일 이름 저장
		boardDTO.setFile(fileName);
				
		boardService.insertBoard(boardDTO);
		
		return "redirect:board/list";
	}
	
}
