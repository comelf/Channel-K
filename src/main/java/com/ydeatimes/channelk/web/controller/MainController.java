package com.ydeatimes.channelk.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import com.ydeatimes.channelk.web.model.content.ContentStatus;
import com.ydeatimes.channelk.web.model.content.ContentType;
import com.ydeatimes.channelk.web.model.content.ETCContent;
import com.ydeatimes.channelk.web.model.content.MainTopImgInfo;
import com.ydeatimes.channelk.web.repository.CapContentRepository;
import com.ydeatimes.channelk.web.repository.ContentCategoryRepository;
import com.ydeatimes.channelk.web.repository.ContentInfoRepository;
import com.ydeatimes.channelk.web.repository.ContentStatusRepository;
import com.ydeatimes.channelk.web.repository.ContentTypeRepository;
import com.ydeatimes.channelk.web.repository.ETCContentRepository;
import com.ydeatimes.channelk.web.service.EtcContentService;
import com.ydeatimes.channelk.web.util.Paging;

@Controller
public class MainController {
	
	@Autowired
	ContentInfoRepository conInfoRepo;
	
	@Autowired
	CapContentRepository capContentRepo;
	
	@Autowired
	ContentCategoryRepository caontentCategoryRepo;
	
	@Autowired
	ContentTypeRepository contentTypeRepo;
	
	@Autowired
	ContentStatusRepository statusRepo;
	
//	@Autowired
//	ETCContentRepository etcContentRepo;
	
	@Autowired
	EtcContentService etcContent;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String indexPage(Model model){
		List<MainTopImgInfo> list = new ArrayList<MainTopImgInfo>();
		list.add(new MainTopImgInfo( "20161106233749be8189ca-736b-48ef-86ec-f1ce49216bfc0.jpg", "질투의 화신", 4,3));
		list.add(new MainTopImgInfo( "201611062350324527fe74-d2e3-4663-97d7-c0e00dfc77b40.jpg", "공항가는길", 4,3));
		list.add(new MainTopImgInfo( "main/ekrxjtm.jpg", "닥터스", 4,3));
		list.add(new MainTopImgInfo( "main/skdls.jpg", "나인", 4,3));
		list.add(new MainTopImgInfo( "main/ghstnfskasu.jpg", "혼술남녀", 4,3));
		list.add(new MainTopImgInfo( "main/ekfdmldusdls.jpg", "달의연인", 2,3));
		list.add(new MainTopImgInfo( "main/qbxldlstkdlem.jpg", "뷰티인사이드", 2,1));
		list.add(new MainTopImgInfo( "main/rltodtn1.jpg", "기생수", 2,1));
		list.add(new MainTopImgInfo( "main/gkdlzlr.jpg", "지붕뚫고 하이킥", 2,1));
		list.add(new MainTopImgInfo( "20161106235528afa37512-002a-4114-bd64-f16bcfd389a10.jpg", "혼술남녀", 2,1));
		model.addAttribute("mainTop", new JSONArray(list));
		
		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
//		List<CapContent> capList = capContentRepo.findTop13ByStatusOrderByCreateDateDesc(status);
		
//		List<MainTopImgInfo> capList = new ArrayList<MainTopImgInfo>();
//		capList.add(new MainTopImgInfo("/images/003cap/8월의크리스마스.jpg", "8월의크리스마스", 0, 0));
//		capList.add(new MainTopImgInfo("/images/003cap/관상.jpg", "관상", 0, 0));
//		capList.add(new MainTopImgInfo("/images/003cap/그래비티.jpg", "그래비티", 0, 0));
//		capList.add(new MainTopImgInfo("/images/003cap/기동전사 건담.jpg", "기동전사 건ᄃ", 0, 0));
//		capList.add(new MainTopImgInfo("/images/003cap/기생수.jpg", "기생수", 0, 0));
//		capList.add(new MainTopImgInfo("/images/003cap/나비효과.jpg", "나비효과", 0, 0));
//		capList.add(new MainTopImgInfo("/images/003cap/달콤살벌한연인.gif", "달콤살벌한연인", 0, 0));
//		capList.add(new MainTopImgInfo("/images/003cap/달콤한인생.jpg", "달콤한인생", 0, 0));
//		model.addAttribute("capList", capList);
		
//		List<MainTopImgInfo> capsubList = new ArrayList<MainTopImgInfo>();
//		capsubList.add(new MainTopImgInfo("/images/003cap/러브레터.jpg", "러브레터", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/백투더퓨처.jpg", "백투더퓨처", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/뷰티인사이드.jpg", "뷰티인사이드", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/식스센스.jpg", "식스센스", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/파이트클럽.jpg", "파이트클럽", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/프로메테우스(인셉션대신).jpg", "프로메테우스", 0, 0));
//		model.addAttribute("capsubList", capsubList);
		
		List<ETCContent> etcList = etcContent.getETCListForMain();
		model.addAttribute("etcList", etcList);
		return "/view/index";
	}
	
	@RequestMapping(value="/cap", method=RequestMethod.GET)
	public String capContentList(@RequestParam(value="category",required=false, defaultValue="0")Integer categoryId,
												@RequestParam(value="type",required=false, defaultValue="0")Integer categoryType,   
												Model model){
		
		List<ContentCategory> categorys = caontentCategoryRepo.findAll();
		List<ContentType> contentType = contentTypeRepo.findAll();
		List<ContentInfo> infoList = null;
		
		model.addAttribute("contentType", contentType);
		model.addAttribute("categorys", categorys);
		
		if(categoryId > 0 ){
			ContentCategory category =  caontentCategoryRepo.findById(categoryId);
			infoList = conInfoRepo.findTop15ByCapAndCategoryOrderByIdDesc(true, category);
		}else if(categoryType > 0){
			ContentType type =  contentTypeRepo.findById(categoryType);
			infoList = conInfoRepo.findTop15ByCapAndTypeOrderByIdDesc(true, type);
		}else{
			infoList = conInfoRepo.findTop15ByCapOrderByIdDesc(true);
		}
		model.addAttribute("capList", infoList);
		
//		List<MainTopImgInfo> capList = new ArrayList<MainTopImgInfo>();
//		capList.add(new MainTopImgInfo("/images/003cap/8월의크리스마스.jpg", "8월의크리스마스", 0, 0));
//		capList.add(new MainTopImgInfo("/images/003cap/관상.jpg", "관상", 0, 0));
//		capList.add(new MainTopImgInfo("/images/003cap/그래비티.jpg", "그래비티", 0, 0));
//		
//		model.addAttribute("capList", capList);
//		List<MainTopImgInfo> capsubList = new ArrayList<MainTopImgInfo>();
//		capsubList.add(new MainTopImgInfo("/images/003cap/기동전사 건담.jpg", "기동전사 건ᄃ", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/기생수.jpg", "기생수", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/나비효과.jpg", "나비효과", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/달콤살벌한연인.gif", "달콤살벌한연인", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/달콤한인생.jpg", "달콤한인생", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/러브레터.jpg", "러브레터", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/백투더퓨처.jpg", "백투더퓨처", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/뷰티인사이드.jpg", "뷰티인사이드", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/식스센스.jpg", "식스센스", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/파이트클럽.jpg", "파이트클럽", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/프로메테우스(인셉션대신).jpg", "프로메테우스", 0, 0));
//		capsubList.add(new MainTopImgInfo("/images/003cap/양들의침묵.jpg", "양들의침묵", 0, 0));
//		
//		model.addAttribute("capsubList", capsubList);
		return "/view/cap/list";
	}
	
	@RequestMapping(value="/cap/content", method=RequestMethod.GET)
	public String capContentInfo(@RequestParam(value="id")int contentId, Model model){
		
		ContentInfo info =  conInfoRepo.findById(contentId);
		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
		List<CapContent> capContent = capContentRepo.findByInfoAndStatusOrderByIdDesc(info, status);
		System.out.println(capContent);
		 model.addAttribute("info", info);
		 model.addAttribute("capContent", capContent);
		if(info.getType().getText().equals(ContentType.MOVIE)){
			return "/view/cap/movie";
		}else{
			return "/view/cap/drama";
		}
	}
	
	@RequestMapping(value="/cap/content/page", method=RequestMethod.GET)
	public String capContentDetail(@RequestParam(value="number")int capNum, Model model){
			ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
			CapContent capContent = capContentRepo.findByIdAndStatus(capNum, status);
			capContent.setViews(capContent.getViews()+1);
			model.addAttribute("capContent", capContent);
			return "/view/cap/detail";
	}
	
	
	@RequestMapping(value="/cap/movie/{id}", method=RequestMethod.GET)
	public String capMovieContent(@RequestParam(value="page")int contentId){
		
		return "/view/cap/page";
	}
	
	@RequestMapping(value="/broadcast", method=RequestMethod.GET)
	public String boradContentList(){
		
		return "/view/broadcast/list";
	}
	
	@RequestMapping(value="/broadcast/drama", method=RequestMethod.GET)
	public String boradDramaContentList(){
		
		return "/view/broadcast/drama";
	}
	
	@RequestMapping(value="/video", method=RequestMethod.GET)
	public String videoContentList(){
		
		return "/view/video/list";
	}
	
	@RequestMapping(value="/etc/list", method=RequestMethod.GET)
	public String etcContentList(@RequestParam(value="page", required=false, defaultValue="1")Integer page , Model model){
		Page<ETCContent> etcPage = etcContent.getEtcPageList(page);
		model.addAttribute("etcList", etcPage.getContent());
		model.addAttribute("paging", new Paging(etcPage.getNumber() + 1, (int)etcPage.getTotalElements(), etcPage.getSize()));
		return "/view/etc/list";
	}
	
	@RequestMapping(value="/etc/content/{contentId}", method=RequestMethod.GET)
	public String etcContentDetail(@PathVariable("contentId")Integer contentId, @RequestParam(value="page", required=false, defaultValue="1")Integer page, Model model){
			ETCContent capContent = etcContent.getEtcContentDetail(contentId);
			model.addAttribute("etcContent", capContent);
			
			Page<ETCContent> etcPage = etcContent.getEtcPageList(page);
			model.addAttribute("etcList", etcPage.getContent());
			model.addAttribute("paging", new Paging(etcPage.getNumber() + 1, (int)etcPage.getTotalElements(), etcPage.getSize()));
			return "/view/etc/detail";
	}
	
}
