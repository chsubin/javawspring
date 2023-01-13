package com.spring.javawspring.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.common.JavawspringProvide;
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
	public int setMemberJoinOk(MultipartFile fName, MemberVO vo) {
		//업로드된 사진을 서버 파일시스템에 저장시켜준다.
		int res=0;
		try {
			String oFileName = fName.getOriginalFilename();
			if(oFileName.equals("")) {
				vo.setPhoto("noimage.jpg");
			}
			
			else {
				UUID uid = UUID.randomUUID();
				String saveFileName = uid + "_" +oFileName;
				
				JavawspringProvide ps = new JavawspringProvide(); 
				ps.writeFile(fName,saveFileName,"member");
				vo.setPhoto(saveFileName);
			}
			memberDAO.setMemberJoinOk(vo);
			res=1;
			
		} catch (IOException e) {
			e.getMessage();
		}
		return res;
		
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

	@Override
	public void setMemberPwdUpdate(String mid, String pwd) {
		memberDAO.setMemberPwdUpdate(mid,pwd);
	}

	@Override
	public int setMemberUpdate(MultipartFile fName, MemberVO vo) {
		int res=0;
		try {
		String mid = vo.getMid();
		MemberVO originVo = memberDAO.getMemberIdCheck(mid);
		//새로운 사진이 없는경우 전에 서버에 저장된 파일 그대로 쓴다.
		if(vo.getPhoto().equals("noimage.jpg")) {
			vo.setPhoto(originVo.getPhoto());
		}
		//새로운 파일이 있는경우 서버에 저장된 파일 삭제 후.. 새로 서버에 저장한다.
		else {
			String oFileName = fName.getOriginalFilename();
			
			String imgFile = originVo.getPhoto();

			JavawspringProvide ps = new JavawspringProvide();
			ps.deleteFile(imgFile,"member");
			
			UUID uid = UUID.randomUUID();
			String saveFileName = uid + "_" +oFileName;

			ps.writeFile(fName,saveFileName,"member");
			vo.setPhoto(saveFileName);
		}
		memberDAO.setMemberUpdate(vo);
		res=1;
		} catch (IOException e) {
			e.printStackTrace();
		} return res;
	}
	
}
