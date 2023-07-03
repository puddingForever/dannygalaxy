package com.danny.dannygalaxy.domain;

import java.sql.Timestamp;

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
	
	//추진력 체크 
	private int highSpeed;
	//가격 정렬 
	private int priceOrder; //1가격 높은 순 , 2 가격 낮은 순 
	
}
