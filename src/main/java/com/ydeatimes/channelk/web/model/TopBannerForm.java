package com.ydeatimes.channelk.web.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TopBannerForm {
	
	private int id;
	
	private int banner_image_id;
	
	private String link;
	
	private String caption;
	
}
