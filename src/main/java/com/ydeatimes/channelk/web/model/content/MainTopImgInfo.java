package com.ydeatimes.channelk.web.model.content;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MainTopImgInfo {
	private String image;
	private String title;
	private int sizeW;
	private int sizeH;
	
	public MainTopImgInfo(String image, String title, int sizeW, int sizeH){
		this.image = image;
		this.title = title;
		this.sizeH = sizeH;
		this.sizeW = sizeW;
	}

	@Override
	public String toString() {
		return "MainTopImgInfo [image=" + image + ", title=" + title
				+ ", sizeW=" + sizeW + ", sizeH=" + sizeH + "]";
	}
	
}
