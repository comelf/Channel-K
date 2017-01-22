package com.ydeatimes.channelk.web.model.content;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name="content_category")
public class ContentCategory {
	public static final int DRAMA 			= 1;
	public static final int NOIR  				= 2;
	public static final int ROMANCE 		= 3;
	public static final int THRILLER 		= 4;
	public static final int HORROR  		= 5;
	public static final int MYSTERY 		= 6;
	public static final int SF 					= 7;
	public static final int HISTORICAL 	= 8;
	public static final int ANIMATION 	= 9;
	public static final int COMEDY 		= 10;
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;									//  DB_ID
	private String text;							// 타이틀
}
