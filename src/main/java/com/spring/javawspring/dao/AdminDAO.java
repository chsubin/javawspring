package com.spring.javawspring.dao;

import org.apache.ibatis.annotations.Param;

public interface AdminDAO {

	public int setMemberLevelCheck(@Param("idx") int idx,@Param("level") int level);

	public int getNewMemberCount(@Param("today") String today);
	
	

}