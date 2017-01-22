package com.ydeatimes.channelk.web.model.content;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name="content_meta")
public class ContentMeta {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String meta_key;
	private String meta_value;
	
	@ManyToOne
	@JoinColumn(name = "content_info_id")
    private ContentInfo content_info;
	
	public ContentMeta(String key, String value){
		this.meta_key = key;
		this.meta_value = value;
	}

	@Override
	public String toString() {
		return "ContentMeta [id=" + id + ", meta_key=" + meta_key
				+ ", meta_value=" + meta_value + "]";
	}
	
}
