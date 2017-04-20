package com.ydeatimes.channelk.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ydeatimes.channelk.json.JSONArray;
import com.ydeatimes.channelk.web.model.content.CapContent;
import com.ydeatimes.channelk.web.model.content.ContentCategory;
import com.ydeatimes.channelk.web.model.content.ContentInfo;
import com.ydeatimes.channelk.web.model.content.ContentType;
import com.ydeatimes.channelk.web.model.content.ETCContent;
import com.ydeatimes.channelk.web.model.content.MainTopImgInfo;
import com.ydeatimes.channelk.web.repository.ContentCategoryRepository;
import com.ydeatimes.channelk.web.repository.ContentInfoRepository;
import com.ydeatimes.channelk.web.repository.ContentStatusRepository;
import com.ydeatimes.channelk.web.repository.ContentTypeRepository;
import com.ydeatimes.channelk.web.service.CapContentService;
import com.ydeatimes.channelk.web.service.EtcContentService;
import com.ydeatimes.channelk.web.util.Paging;

@Controller
public class MainController {

	@Autowired
	ContentInfoRepository conInfoRepo;

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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexPage(Model model) {
		List<MainTopImgInfo> list = new ArrayList<MainTopImgInfo>();
		list.add(new MainTopImgInfo("/img/poster/main_poster_fightclub_01.png", "", 4, 3));
		list.add(new MainTopImgInfo("/img/poster/main_poster_thehangover_01.png", "", 4, 3));
		list.add(new MainTopImgInfo("/img/poster/main_poster_thebeautyinside_01.png", "", 4, 3));
		list.add(new MainTopImgInfo("/img/poster/main_poster_themist_01.png", "", 4, 3));
		list.add(new MainTopImgInfo("/img/poster/main_poster_themartian_01.png", "", 4, 3));
		list.add(new MainTopImgInfo("/img/poster/main_poster_district9_01.png", "", 2, 3));
		list.add(new MainTopImgInfo("/img/poster/main_poster_devil_01.png", "", 2, 1));
		list.add(new MainTopImgInfo("/img/poster/main_poster_cube_01.png", "", 2, 1));
		list.add(new MainTopImgInfo("/img/poster/main_poster_parasyte_01.png", "", 2, 1));
		model.addAttribute("mainTop", new JSONArray(list));

		model.addAttribute("capList", capContent.getCapContentListForMain());

		List<ETCContent> etcList = etcContent.getETCListForMain();
		model.addAttribute("etcList", etcList);
		return "/view/index";
	}

	@RequestMapping(value = "/cap", method = RequestMethod.GET)
	public String capContentList(
			@RequestParam(value = "category", required = false, defaultValue = "0") Integer categoryId,
			@RequestParam(value = "type", required = false, defaultValue = "0") Integer categoryType, Model model) {

		List<ContentCategory> categorys = caontentCategoryRepo.findAll();
		List<ContentType> contentType = contentTypeRepo.findAll();
		List<ContentInfo> infoList = null;

		model.addAttribute("contentType", contentType);
		model.addAttribute("categorys", categorys);

		if (categoryId > 0) {
			ContentCategory category = caontentCategoryRepo.findById(categoryId);
			infoList = conInfoRepo.findTop15ByCapAndCategoryOrderByIdDesc(true, category);
		} else if (categoryType > 0) {
			ContentType type = contentTypeRepo.findById(categoryType);
			infoList = conInfoRepo.findTop15ByCapAndTypeOrderByIdDesc(true, type);
		} else {
			infoList = conInfoRepo.findTop15ByCapOrderByIdDesc(true);
		}
		model.addAttribute("capList", infoList);

		// List<MainTopImgInfo> capList = new ArrayList<MainTopImgInfo>();
		// capList.add(new MainTopImgInfo("/images/003cap/8월의크리스마스.jpg",
		// "8월의크리스마스", 0, 0));
		// capList.add(new MainTopImgInfo("/images/003cap/관상.jpg", "관상",
		// 0, 0));
		// capList.add(new MainTopImgInfo("/images/003cap/그래비티.jpg",
		// "그래비티", 0, 0));
		//
		// model.addAttribute("capList", capList);
		// List<MainTopImgInfo> capsubList = new ArrayList<MainTopImgInfo>();
		// capsubList.add(new MainTopImgInfo("/images/003cap/기동전사
		// 건담.jpg", "기동전사 건ᄃ", 0, 0));
		// capsubList.add(new MainTopImgInfo("/images/003cap/기생수.jpg",
		// "기생수", 0, 0));
		// capsubList.add(new MainTopImgInfo("/images/003cap/나비효과.jpg",
		// "나비효과", 0, 0));
		// capsubList.add(new
		// MainTopImgInfo("/images/003cap/달콤살벌한연인.gif",
		// "달콤살벌한연인", 0, 0));
		// capsubList.add(new
		// MainTopImgInfo("/images/003cap/달콤한인생.jpg",
		// "달콤한인생", 0, 0));
		// capsubList.add(new MainTopImgInfo("/images/003cap/러브레터.jpg",
		// "러브레터", 0, 0));
		// capsubList.add(new MainTopImgInfo("/images/003cap/백투더퓨처.jpg",
		// "백투더퓨처", 0, 0));
		// capsubList.add(new MainTopImgInfo("/images/003cap/뷰티인사이드.jpg",
		// "뷰티인사이드", 0, 0));
		// capsubList.add(new MainTopImgInfo("/images/003cap/식스센스.jpg",
		// "식스센스", 0, 0));
		// capsubList.add(new MainTopImgInfo("/images/003cap/파이트클럽.jpg",
		// "파이트클럽", 0, 0));
		// capsubList.add(new
		// MainTopImgInfo("/images/003cap/프로메테우스(인셉션대신).jpg",
		// "프로메테우스", 0, 0));
		// capsubList.add(new
		// MainTopImgInfo("/images/003cap/양들의침묵.jpg", "양들의침묵", 0, 0));
		//
		// model.addAttribute("capsubList", capsubList);
		return "/view/cap/list";
	}

	@RequestMapping(value = "/cap/content", method = RequestMethod.GET)
	public String capContentInfo(@RequestParam(value = "id") int contentId, @RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {

		ContentInfo info = conInfoRepo.findById(contentId);
		model.addAttribute("info", info);
		Page<CapContent> capPage = capContent.getCapContentPageByInfo(info, page);
		model.addAttribute("capContent", capPage.getContent());
		model.addAttribute("paging", new Paging(capPage.getNumber() + 1, (int) capPage.getTotalElements(), capPage.getSize()));
		
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
