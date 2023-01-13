package com.spring.javawspring.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javawspring.dao.BoardDAO;
import com.spring.javawspring.dao.GuestDAO;
import com.spring.javawspring.dao.MemberDAO;

@Service
public class PageProcess {
	@Autowired
	GuestDAO guestDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	BoardDAO boardDAO;

	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String search) {
		PageVO pageVO= new PageVO();
		int totRecCnt=0;
		
		if(section.equals("member")) {
		totRecCnt =memberDAO.totRecCnt();
		}
		else if(section.equals("guest")) {
			totRecCnt =guestDAO.totRecCnt();
		}
		else if(section.equals("guest")) {
			totRecCnt =guestDAO.totRecCnt();
		}
		else if(section.equals("board")) {
			totRecCnt =boardDAO.totRecCnt();
			if(!part.equals("")) {
				totRecCnt= boardDAO.totSearchCnt(part,search);
			}
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setBlockSize(blockSize);
		pageVO.setCurBlock(curBlock);
		pageVO.setLastBlock(lastBlock);
		
		
		return pageVO;
	}
	
	
	
	
}
