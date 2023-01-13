package com.spring.javawspring.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javawspring.vo.BoardReplyVO;
import com.spring.javawspring.vo.BoardVO;
import com.spring.javawspring.vo.GoodVO;

public interface BoardDAO {

	public int totRecCnt();

	public List<BoardVO> getBoardList(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public int setBoardInput(@Param("vo") BoardVO vo);

	public void setBoardReadNum(@Param("idx") int idx);

	public BoardVO getBoardContent(@Param("idx") int idx);

	public void setBoardGoodPlus(@Param("idx") int idx);

	public void setGoodPlusMinus(@Param("idx") int idx,@Param("goodCnt") int goodCnt);

	public void boardGoodFlagCheck(@Param("idx") int idx,@Param("gFlag") int gFlag);

	public GoodVO getBoardGoodCheck(@Param("partIdx") int partIdx,@Param("part") String part,@Param("mid") String mid);

	public ArrayList<BoardVO> getPrevNext(@Param("idx") int idx);

	public void setBoardDeleteOk(@Param("idx") int idx);

	public void setBoardUpdateOk(@Param("vo") BoardVO vo);

	public void boardGoodDbCheck(@Param("vo") GoodVO vo);

	public void newGoodDbCheck(@Param("vo") GoodVO vo);

	public void setBoardReplyInput(@Param("replyVo") BoardReplyVO replyVo);

	public List<BoardReplyVO> getBoardReply(@Param("idx") int idx);

	public void setBoardReplyDeleteOk(@Param("idx") int idx);

	public String getMaxLevelOrder(@Param("boardIdx") int boardIdx);

	public void setLevelOrderPlusUpdate(@Param("replyVo") BoardReplyVO replyVo);

	public void setBoardReplyInput2(@Param("replyVo") BoardReplyVO replyVo);

	public List<BoardVO> getBoardSearch(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize,@Param("search") String search,@Param("searchString") String searchString);

	public int totSearchCnt(@Param("search") String part,@Param("searchString") String search);

	public void setBoardReplyUpdate(@Param("idx") int idx,@Param("content") String content);

	public int getNewBoardCount(@Param("today") String today);




}
