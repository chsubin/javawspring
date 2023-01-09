package com.spring.javawspring.study;

import java.util.ArrayList;

import com.spring.javawspring.vo.GuestVO;

public interface StudyService {

	public String[] getCityStringArr(String dodo);

	public ArrayList<String> getCityArrayListArr(String dodo);

	public GuestVO getGuestMid(String mid);

	public ArrayList<GuestVO> getGuestNames(String mid);

	public ArrayList<GuestVO> getGuestSearch(String search, String searchfield);
	
}
