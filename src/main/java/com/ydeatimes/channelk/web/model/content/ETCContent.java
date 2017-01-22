package com.ydeatimes.channelk.web.model.content;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import lombok.Data;
import lombok.NoArgsConstructor;

import com.ydeatimes.channelk.web.model.User;

@Data
@NoArgsConstructor
@Entity(name="etc_content")
public class ETCContent {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="content_id", nullable=true)
	private ContentInfo info;
	
	@Transient
	private int content_id;
	
	@Transient
	private int thumbnail_id;
	
	@Transient
	private String status_text;
	
	@ManyToOne
	@JoinColumn(name="thumbnail_image_id", nullable=true)
	private Image thumbnail;
	
	private String title;
	
	@Column(columnDefinition = "TEXT")
	private String content;
	
	private Date createDate;
	
	private int views;
	
	private int recommend;
	
	@ManyToOne
	@JoinColumn(name="user_id", nullable=false)
	private User user;
	
	@ManyToOne
	@JoinColumn(name="status_id", nullable=false)
	private ContentStatus status;

	@Override
	public String toString() {
		return "NonCapContent [id=" + id + ", title=" + title
				+ ", create_date=" + createDate + "]";
	}
	
}
