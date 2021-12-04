package com.itwillbs.service;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO replyDAO;
	
	// 댓글 작성
	@Override
	public void insertBoard(ReplyDTO replyDTO) {
		// 조회수 0, 작성시간 입력
		replyDTO.setReadcount(0);
		replyDTO.setDate(new Timestamp(System.currentTimeMillis()));
		// 댓글 번호 설정
		if(replyDAO.getMaxNum()==null) {
			//글이 없는경우 1로 설정
			replyDTO.setR_num(1);
		} else {
			// 글이 있으면 max(r_num)+1
			replyDTO.setR_num(replyDAO.getMaxNum()+1);
		}
		
		replyDTO.insertBoard(replyDTO);
	}
	// 댓글 목록 불러오기
	@Override
	public List<ReplyDTO> getBoardList(int c_num, PageDTO pageDTO) {
		// pageSize, pageNum 담아옴
		// currentPage startRow endRow
		int currentPage=Integer.parseInt(pageDTO.getPageNum());
		int startRow=(currentPage-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setStartRow(startRow-1); // 디비 startRow-1
		pageDTO.setEndRow(endRow);
		
		return replyDAO.getBoardList(pageDTO);
	}
	// 댓글 수정
	@Override
	public void updateBoard(ReplyDTO replyDTO) {
		replyDAO.updateBoard(replyDTO);
	}
	// 댓글 삭제
	@Override
	public void deleteBoard(int r_num) {
		replyDAO.deleteBoard(r_num);
	}
	// 커뮤니티글 삭제 시 모든 댓글 삭제
	@Override
	public void deleteBoardAll(int c_num) {
		replyDAO.deleteBoardAll(c_num);
	}
	// 커뮤니티글의 댓글 개수
	@Override
	public Integer getBoardCount(int c_num) {
		return replyDAO.getBoardCount(c_num);
	}
	// 본인 확인
	@Override
	public ReplyDTO numCheck(ReplyDTO replyDTO) {
		return replyDAO.numCheck(replyDTO);
	}

}
