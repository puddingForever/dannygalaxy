package com.danny.dannygalaxy.domain;

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

	private Long rocketId;
	private String rocketName;
	private int rocketPrice;
	private String rocketSpecial;
	
}
