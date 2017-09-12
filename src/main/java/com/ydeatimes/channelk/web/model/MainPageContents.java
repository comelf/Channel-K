package com.ydeatimes.channelk.web.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MainPageContents {
	MainContent recently;
	List<MainContent> coming;
	List<MainContent> recomend;
	
	public void setRecently(MainContent recently) {
		if(recently != null){
			this.recently = recently;
		}else{
			this.recently = new MainContent();
		}
		
	}

	public void setComing(List<MainContent> coming) {
		if(coming != null && coming.size() > 0){
			this.coming = coming;
		}else{
			this.coming = new ArrayList<MainContent>();
			this.coming.add(new MainContent());
			this.coming.add(new MainContent());
		}
	}

	public void setRecomend(List<MainContent> recomend) {
		if(recomend != null && recomend.size() > 0){
			this.recomend = recomend;
		}else{
			this.recomend = new ArrayList<MainContent>();
			this.recomend.add(new MainContent());
			this.recomend.add(new MainContent());
			this.recomend.add(new MainContent());
			this.recomend.add(new MainContent());
		}
	}
	
}
