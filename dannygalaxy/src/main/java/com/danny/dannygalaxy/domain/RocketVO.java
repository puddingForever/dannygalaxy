package com.danny.dannygalaxy.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RocketVO {

	private Long rkNo;
	private String rkName;
	private int rkEngine;
	private Timestamp rkAvailDate;
	private int rkPeopleCnt;
	private int rkPrice;
	
	private List<MyRocketAttachFileVO> attachFileList;	
	
}
