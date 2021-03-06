package com.ydeatimes.channelk.web.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.ydeatimes.channelk.web.model.content.Image;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name="top_banner")
public class TopBanner {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="image_id", nullable=false)
	private Image image;
	
	private String link;
	
	private String caption;
	
	public TopBanner(Image image, String link, String caption) {
		
	}
	
}
