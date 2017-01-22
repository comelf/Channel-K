package com.ydeatimes.channelk.web.model;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TopBannerForm {
	
	public List<String> name;

	@Override
	public String toString() {
		return "TopBannerForm [name=" + name + "]";
	}
	
}
