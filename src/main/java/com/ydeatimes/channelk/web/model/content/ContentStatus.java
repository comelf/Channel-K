package com.ydeatimes.channelk.web.model.content;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name="content_status")
public class ContentStatus {
	public static final String OPEN = "oepn";
	public static final String CLOSE = "close";
	public static final String PENDING = "pending";
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(unique=true)
	private String text;
	
}
