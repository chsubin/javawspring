package com.spring.javawspring.service;

import java.util.ArrayList;

import com.spring.javawspring.vo.GuestVO;

public interface GuestService {

	public ArrayList<GuestVO> getGuestList(int startIndexNo, int pageSize);

	public void setGuestInput(GuestVO vo);

	public int totRecCnt();

	
}
