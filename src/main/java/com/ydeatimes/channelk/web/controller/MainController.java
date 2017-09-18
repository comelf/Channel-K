package com.ydeatimes.channelk.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ydeatimes.channelk.web.model.content.CapContent;
import com.ydeatimes.channelk.web.model.content.ContentCategory;
import com.ydeatimes.channelk.web.model.content.ContentInfo;
import com.ydeatimes.channelk.web.model.content.ContentType;
import com.ydeatimes.channelk.web.model.content.ETCContent;
import com.ydeatimes.channelk.web.repository.ContentCategoryRepository;
import com.ydeatimes.channelk.web.repository.ContentStatusRepository;
import com.ydeatimes.channelk.web.repository.ContentTypeRepository;
import com.ydeatimes.channelk.web.service.CapContentInfoService;
import com.ydeatimes.channelk.web.service.CapContentService;
import com.ydeatimes.channelk.web.service.EtcContentService;
import com.ydeatimes.channelk.web.service.MainPageService;
import com.ydeatimes.channelk.web.util.Paging;

@Controller
public class MainController {

	@Autowired
	ContentCategoryRepository caontentCategoryRepo;

	@Autowired
	ContentTypeRepository contentTypeRepo;

	@Autowired
	ContentStatusRepository statusRepo;

	// @Autowired
	// ETCContentRepository etcContentRepo;

	@Autowired
	EtcContentService etcContent;

	@Autowired
	CapContentService capContent;
	
	@Autowired
	CapContentInfoService capInfo;
	
	@Autowired
	MainPageService mainPage;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexPage(Model model) {
		model.addAttribute("mainTop", mainPage.getAllBanner());
		model.addAttribute("recently", mainPage.getOneRecentlyContent());
		model.addAttribute("coming", mainPage.getAllComingContent());
		model.addAttribute("recomend", mainPage.getAllRecommendContent());
		model.addAttribute("capList", capContent.getCapContentListForMain());
		model.addAttribute("etcList", etcContent.getETCListForMain());
		return "/view/index";
	}

	@RequestMapping(value = "/cap", method = RequestMethod.GET)
	public String capContentList(
			@RequestParam(value = "category", required = false, defaultValue = "0") Integer categoryId,
			@RequestParam(value = "type", required = false, defaultValue = "0") Integer categoryType, 
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {

		List<ContentCategory> categorys = caontentCategoryRepo.findAll();
		List<ContentType> contentType = contentTypeRepo.findAll();
		
		model.addAttribute("contentType", contentType);
		model.addAttribute("categorys", categorys);
		
		model.addAttribute("category", categoryId);
		model.addAttribute("type", categoryType);
		
		Page<ContentInfo> capPage = capInfo.getCapInfo(categoryId, categoryType  , page);
		model.addAttribute("capList", capPage.getContent());
		model.addAttribute("paging", new Paging(capPage.getNumber() + 1, (int) capPage.getTotalElements(), capPage.getSize()));
		return "/view/cap/list";
	}

	@RequestMapping(value = "/cap/content", method = RequestMethod.GET)
	public String capContentInfo(@RequestParam(value = "id") int contentId, @RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {

		ContentInfo info = capInfo.getByContentId(contentId);
		model.addAttribute("info", info);
		Page<CapContent> capPage = capContent.getCapContentPageByInfo(info, page);
		model.addAttribute("capContent", capPage.getContent());
		model.addAttribute("paging", new Paging(capPage.getNumber() + 1, (int) capPage.getTotalElements(), capPage.getSize()));
		
		model.addAttribute("contentId", contentId);
		if (info.getType().getText().equals(ContentType.MOVIE)) {
			return "/view/cap/movie";
		} else {
			return "/view/cap/drama";
		}
	}

	@RequestMapping(value = "/cap/content/page", method = RequestMethod.GET)
	public String capContentDetail(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, @RequestParam(value = "number") int capNum, Model model) {
		CapContent content = capContent.getContentById(capNum);
		
		Page<CapContent> capPage = capContent.getCapContentPageByInfo(content.getInfo(), page);
		model.addAttribute("capContentList", capPage.getContent());
		model.addAttribute("paging", new Paging(capPage.getNumber() + 1, (int) capPage.getTotalElements(), capPage.getSize()));
		
		content.setViews(content.getViews() + 1);
		model.addAttribute("capContent", content);
		return "/view/cap/detail";
	}

	@RequestMapping(value = "/cap/movie/{id}", method = RequestMethod.GET)
	public String capMovieContent(@RequestParam(value = "page") int contentId) {

		return "/view/cap/page";
	}

	@RequestMapping(value = "/broadcast", method = RequestMethod.GET)
	public String boradContentList() {

		return "/view/broadcast/list";
	}

	@RequestMapping(value = "/broadcast/drama", method = RequestMethod.GET)
	public String boradDramaContentList() {

		return "/view/broadcast/drama";
	}

	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String videoContentList() {

		return "/view/video/list";
	}

	@RequestMapping(value = "/etc/list", method = RequestMethod.GET)
	public String etcContentList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			Model model) {
		Page<ETCContent> etcPage = etcContent.getEtcPageList(page);
		model.addAttribute("etcList", etcPage.getContent());
		Page<ETCContent> bestPage = etcContent.getBestList();
		model.addAttribute("bestList", bestPage.getContent());
		model.addAttribute("paging",
				new Paging(etcPage.getNumber() + 1, (int) etcPage.getTotalElements(), etcPage.getSize()));
		return "/view/etc/list";
	}

	@RequestMapping(value = "/etc/content/{contentId}", method = RequestMethod.GET)
	public String etcContentDetail(@PathVariable("contentId") Integer contentId,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		ETCContent capContent = etcContent.getEtcContentDetail(contentId);
		model.addAttribute("etcContent", capContent);

		Page<ETCContent> etcPage = etcContent.getEtcPageList(page);
		model.addAttribute("etcList", etcPage.getContent());
		model.addAttribute("paging",
				new Paging(etcPage.getNumber() + 1, (int) etcPage.getTotalElements(), etcPage.getSize()));
		return "/view/etc/detail";
	}

}
