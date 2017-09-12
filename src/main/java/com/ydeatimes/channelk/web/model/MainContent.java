package com.ydeatimes.channelk.web.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import com.ydeatimes.channelk.web.model.content.Image;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name="main_content")
public class MainContent {
	public static final int RECENTLY_CONTENT = 1;
	public static final int COMING_CONTENT = 2;
	public static final int RECOMMEND_CONTENT = 3;
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="image_id", nullable=false)
	private Image image;
	
	private String link;
	
	private String caption;
	
	private int type;
	
	@Transient
	private int banner_image_id;
	
	public MainContent(Image image, String link, String caption, int type) {
		
	}
	
}
