package com.spring.javawspring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javawspring.vo.GuestVO;

public interface GuestDAO {

	ArrayList<GuestVO> getGuestList(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	void setGuestInput(@Param("vo") GuestVO vo);

	int totRecCnt();

}
