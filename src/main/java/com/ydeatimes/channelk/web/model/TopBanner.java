package com.ydeatimes.channelk.web.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import lombok.Data;
import lombok.NoArgsConstructor;

import com.ydeatimes.channelk.web.model.content.ContentInfo;

@Data
@NoArgsConstructor
@Entity(name="top_banner")
public class TopBanner {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="content_id", nullable=false)
	private ContentInfo info;
	
	@Transient
	private int content_id;
	
	private int size_w;
	
	private int size_h;

	@Override
	public String toString() {
		return "TopBanner [id=" + id + ", info="+ info.getTitle() +",  size_w=" + size_w + ", size_h="
				+ size_h + "]";
	}
	
}
