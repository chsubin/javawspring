package com.spring.javawspring.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BoardVO {
	private int idx;
	private String nickName;
	private String title;
	private String email;
	private String homePage;
	private String content;
	private String wDate;
	private String hostIp;
	private int readNum;
	private int good;
	private String mid;
	
	private int replyCount;		// 날짜 차이 계산 필드(1일차이 계산필드)
	
	private int day_diff;		// 날짜 차이 계산 필드(1일차이 계산필드)
	private int hour_diff;	// 날짜 차이 계산 필드(24시간차이 계산필드)
	
}
