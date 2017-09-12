package com.ydeatimes.channelk.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ydeatimes.channelk.web.model.MainContent;
import com.ydeatimes.channelk.web.model.MainPageContents;
import com.ydeatimes.channelk.web.model.TopBanner;
import com.ydeatimes.channelk.web.model.TopBannerForm;
import com.ydeatimes.channelk.web.model.content.Image;
import com.ydeatimes.channelk.web.repository.ImageRepository;
import com.ydeatimes.channelk.web.repository.MainContentRepository;
import com.ydeatimes.channelk.web.repository.TopBannerRepository;

@Service
public class MainPageService {
	@Autowired
	TopBannerRepository topBannerRepo;

	@Autowired
	MainContentRepository mainContentRepo;
	
	@Autowired
	ImageRepository imageRepo;
	
	public List<TopBanner> getAllBanner() {
		List<TopBanner> list = topBannerRepo.findAll();
		return list;
	}

	public boolean saveNewBanner(TopBannerForm topForm) {
		TopBanner top = new TopBanner();
		Image image = imageRepo.findById(topForm.getBanner_image_id());
		if(image == null){
			return false;
		}
		top.setImage(image);
		top.setLink(topForm.getLink());
		top.setCaption(topForm.getCaption());
		topBannerRepo.saveAndFlush(top);
		return true;
	}

	public void deleteById(Integer bannerId) {
		topBannerRepo.delete(bannerId);
	}

	public boolean updateBanner(TopBannerForm topForm) {
		TopBanner top = topBannerRepo.findOne(topForm.getId());
		
		if(top != null){
			Image image = imageRepo.findById(topForm.getBanner_image_id());
			if(image == null){
				return false;
			}
			top.setImage(image);
			top.setLink(topForm.getLink());
			top.setCaption(topForm.getCaption());
			topBannerRepo.saveAndFlush(top);
			return true;
		}
		return false;
	}

	public MainContent getOneRecentlyContent() {
		MainContent  recently = mainContentRepo.findOneByType(MainContent.RECENTLY_CONTENT);
		return recently;
	}

	public List<MainContent> getAllComingContent() {
		List<MainContent> coming = mainContentRepo.findAllByType(MainContent.COMING_CONTENT);
		return coming;
	}
	
	public List<MainContent> getAllRecommendContent() {
		List<MainContent> recomend = mainContentRepo.findAllByType(MainContent.RECOMMEND_CONTENT);
		return recomend;
	}

	public boolean saveMainPageContents(MainPageContents mpc) {
		mainContentRepo.deleteAll();
		
		MainContent recently = mpc.getRecently();
		if(recently != null){
			Image image = imageRepo.findById(recently.getBanner_image_id());
			if(image == null){
				return false;
			}
			recently.setImage(image);
			recently.setLink(recently.getLink());
			recently.setCaption(recently.getCaption());
			recently.setType(MainContent.RECENTLY_CONTENT);
			mainContentRepo.save(recently);
		}
		
		List<MainContent> coming = mpc.getComing();
		for (MainContent mc : coming) {
			Image image = imageRepo.findById(mc.getBanner_image_id());
			if(image == null){
				return false;
			}
			mc.setImage(image);
			mc.setLink(mc.getLink());
			mc.setCaption(mc.getCaption());
			mc.setType(MainContent.COMING_CONTENT);
			mainContentRepo.save(mc);
		}
		
		List<MainContent> recomend = mpc.getRecomend();
		for (MainContent mc : recomend) {
			Image image = imageRepo.findById(mc.getBanner_image_id());
			if(image == null){
				return false;
			}
			mc.setImage(image);
			mc.setLink(mc.getLink());
			mc.setCaption(mc.getCaption());
			mc.setType(MainContent.RECOMMEND_CONTENT);
			mainContentRepo.save(mc);
		}
		mainContentRepo.flush();
		return true;
	}
	
}
