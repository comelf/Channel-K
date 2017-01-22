package com.ydeatimes.channelk.web.model.content;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name="content_type")
public class ContentType {
	public static final int BROADCAST = 1;
	public static final int MOVIE = 2;
	public static final int SITCOM = 3;
	public static final int ANIMATION = 4;
	public static final int ETC = 5;
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String text;
	@Override
	public String toString() {
		return "ContentType [id=" + id + ", text=" + text + "]";
	}
}
