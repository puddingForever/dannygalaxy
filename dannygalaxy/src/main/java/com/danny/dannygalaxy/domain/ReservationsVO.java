package com.danny.dannygalaxy.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationsVO {

	private int res_idx;
	private int res_user_idx;
	private String res_name;
	private int res_phone;
	private String res_bod;
	private String res_country;
	private String res_info;
	private String res_flight;
}
