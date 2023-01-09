package com.spring.javawspring.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javawspring.dao.MemberDAO;
import com.spring.javawspring.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getMemberIdCheck(String mid) {
		return memberDAO.getMemberIdCheck(mid);
	}

	@Override
	public MemberVO getMemberNickNameCheck(String nickName) {
		return memberDAO.getMemberNickNameCheck(nickName);
	}

	@Override
	public int setMemberJoinOk(MemberVO vo) {
		return memberDAO.setMemberJoinOk(vo);
	}

	@Override
	public void setMemberVisitProcess(MemberVO vo) {
		//오늘 날짜 편집 
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strNow = sdf.format(now);
		
		// 오늘 처음 방문시는 오늘 방문카운트(todayCnt)를 0으로 셋팅한다. 
		if(!vo.getLastDate().substring(0,10).equals(strNow)) {
			vo.setTodayCnt(0);
		}
		int todayCnt = vo.getTodayCnt()+1;
		
		int nowTodayPoint = 0;
		if(vo.getTodayCnt() >= 5) {
			nowTodayPoint = vo.getPoint();
		}
		else {
			nowTodayPoint = vo.getPoint() + 10;
		}
		// 오늘 재방문이라면 '총방문수','오늘방문수','포인트' 누적처리
		memberDAO.setMemTotalUpdate(vo.getMid(), nowTodayPoint,todayCnt);
	}

	@Override
	public int totRecCnt() {
		return memberDAO.totRecCnt();
	}

	@Override
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize) {
		return memberDAO.getMemberList(startIndexNo,pageSize);
	}

	@Override
	public int totTermRecCnt(String mid) {
		return memberDAO.totTermRecCnt(mid);
	}

	@Override
	public ArrayList<MemberVO> getTermMemberList(int startIndexNo, int pageSize, String mid) {
		return memberDAO.getTermMemberList(startIndexNo, pageSize,mid);
	}
	
}
