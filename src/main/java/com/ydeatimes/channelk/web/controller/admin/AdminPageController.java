package com.ydeatimes.channelk.web.controller.admin;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ydeatimes.channelk.auth.UserDetail;
import com.ydeatimes.channelk.web.model.TopBanner;
import com.ydeatimes.channelk.web.model.TopBannerForm;
import com.ydeatimes.channelk.web.model.User;
import com.ydeatimes.channelk.web.model.content.CapContent;
import com.ydeatimes.channelk.web.model.content.ContentCategory;
import com.ydeatimes.channelk.web.model.content.ContentInfo;
import com.ydeatimes.channelk.web.model.content.ContentMeta;
import com.ydeatimes.channelk.web.model.content.ContentStatus;
import com.ydeatimes.channelk.web.model.content.ContentType;
import com.ydeatimes.channelk.web.model.content.ETCContent;
import com.ydeatimes.channelk.web.model.content.Image;
import com.ydeatimes.channelk.web.repository.CapContentRepository;
import com.ydeatimes.channelk.web.repository.ContentCategoryRepository;
import com.ydeatimes.channelk.web.repository.ContentInfoRepository;
import com.ydeatimes.channelk.web.repository.ContentMetaRepository;
import com.ydeatimes.channelk.web.repository.ContentStatusRepository;
import com.ydeatimes.channelk.web.repository.ContentTypeRepository;
import com.ydeatimes.channelk.web.repository.ETCContentRepository;
import com.ydeatimes.channelk.web.repository.ImageRepository;
import com.ydeatimes.channelk.web.repository.TopBannerRepository;
import com.ydeatimes.channelk.web.repository.UserRepository;
import com.ydeatimes.channelk.web.util.Paging;

@Controller
@RequestMapping("/admin")
public class AdminPageController {
	
	private int count = 20;
	
	@Autowired
	ContentInfoRepository conInfoRepo;
	
	@Autowired
	ContentTypeRepository conTypeRepo;
	
	@Autowired
	ContentCategoryRepository conCategoryRepo;
	
	@Autowired
	ImageRepository imageRepo;
	
	@Autowired
	ContentMetaRepository conMetaRepo;
	
	@Autowired
	ContentStatusRepository conStatusRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	CapContentRepository capContentRepo;

	@Autowired
	ETCContentRepository etcContentRepo;
	
	@Autowired
	TopBannerRepository topBannerRepo;
	
	@Autowired
	ContentStatusRepository statusRepo;
	
	@RequestMapping(value="/main/topbanner", method=RequestMethod.GET)
    public String topBanner(Model model) {
		List<TopBanner> list = topBannerRepo.findAll();
		model.addAttribute("topList", list);
		model.addAttribute("topForm", new TopBannerForm());
        return "/admin/main/top";
    }
	
	@RequestMapping(value="/main/topbanner/edit", method=RequestMethod.POST)
    public String topBannerEdit(TopBannerForm topForm, Model model) {
		
		System.out.println(topForm);
		
		List<TopBanner> list = topBannerRepo.findAll();
		model.addAttribute("topList", list);
		model.addAttribute("topForm", new TopBannerForm());
		return "/admin/main/top";
    }
	
	@RequestMapping(value="/content/list", method=RequestMethod.GET)
    public String contentInfoListPage(@RequestParam(defaultValue="1", required=false) int page, Model model) {
		int start = (page - 1);
		Pageable pageable = new PageRequest(start, count, Direction.DESC, "id");
		Page<ContentInfo> contentInfoList = conInfoRepo.findAll(pageable);
		model.addAttribute("contentInfoList", contentInfoList.getContent());
		model.addAttribute("paging", new Paging(page, (int)contentInfoList.getTotalElements(), count));
        return "/admin/content/list";
    }
	
	
	
	@RequestMapping(value="/content/detail/{contentInfo}", method=RequestMethod.GET)
    public String addCapContentPage(@PathVariable("contentInfo")int contentInfoId, Model model) throws Exception {
		ContentInfo contentInfo = conInfoRepo.findById(contentInfoId);
		if(contentInfo == null){
			throw new NotFoundException();
		}
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentStatusList", statusList);
		model.addAttribute("contentTypes", conTypeRepo.findAll());
		model.addAttribute("contentCatetories", conCategoryRepo.findAll());
		model.addAttribute("contentInfo", contentInfo);
        return "/admin/content/detail";
    }
	
	
	@RequestMapping(value="/content/add", method=RequestMethod.GET)
    public String addContentInfoPage(Model model) {
		model.addAttribute("contentTypes", conTypeRepo.findAll());
		model.addAttribute("contentCatetories", conCategoryRepo.findAll());
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentStatusList", statusList);
		ContentInfo info = new ContentInfo();
		model.addAttribute("contentInfo", info);
        return "/admin/content/add";
    }
	
	@RequestMapping(value="/content/create", method=RequestMethod.POST)
    public String addCapContentCreate(ContentInfo info  ,Model model) {
    	
		int bannerId = info.getBanner_id();
		if(bannerId > 0){
			Image image = imageRepo.findById(bannerId);
			if(image != null){
				info.setBanner(image);
			}
		}
		
		int thumbnailId = info.getThumbnail_image_id();
		if(thumbnailId > 0){
			Image image = imageRepo.findById(thumbnailId);
			if(image != null){
				info.setThumbnail(image);
			}
		}
		
		ContentType contentType = conTypeRepo.findById(info.getContentTypeId());
		info.setType(contentType);
		
		ContentCategory category = conCategoryRepo.findById(info.getContentCategoryId());
		info.setCategory(category);
		
		ContentStatus status = statusRepo.findByText(info.getStatus_text());
		info.setStatus(status);
		
		Map<String, ContentMeta> metaMap = info.getMetas();
		
		conInfoRepo.saveAndFlush(info);
		
		Iterator<String>  keys = metaMap.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			ContentMeta meta = metaMap.get(key);
			meta.setContent_info(info);
			
			if(meta.getMeta_key() != null && meta.getMeta_value() != null){
				conMetaRepo.save(meta);
			}
		}
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentStatusList", statusList);
		model.addAttribute("contentTypes", conTypeRepo.findAll());
		model.addAttribute("contentCatetories", conCategoryRepo.findAll());
		model.addAttribute("contentInfo", info);
        return "/admin/content/detail";
    }
	
	@RequestMapping(value="/content/edit", method=RequestMethod.POST)
    public String addCapContentEdit(ContentInfo info  ,Model model) {
		int infoId = info.getId();
		ContentInfo cInfo =  conInfoRepo.findById(infoId);
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentStatusList", statusList);
		int bannerId = info.getBanner_id();
		if(bannerId > 0){
			Image image = imageRepo.findById(bannerId);
			if(image != null){
				cInfo.setBanner(image);
			}
		}
		
		int thumbnailId = info.getThumbnail_image_id();
		if(thumbnailId > 0){
			Image image = imageRepo.findById(thumbnailId);
			if(image != null){
				cInfo.setThumbnail(image);
			}
		}
		
		ContentCategory category = conCategoryRepo.findById(info.getContentCategoryId());
		cInfo.setCategory(category);
		
		ContentStatus status = statusRepo.findByText(info.getStatus_text());
		cInfo.setStatus(status);
		
		Map<String, ContentMeta> metaMap = info.getMetas();
		
		Map<String, ContentMeta> cMetaMap = cInfo.getMetas();
		
		Iterator<String>  keys = metaMap.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			ContentMeta meta = metaMap.get(key);
			
			ContentMeta cMetaInfo =  cMetaMap.get(key);
			
			if(cMetaInfo == null){
				meta.setContent_info(info);
				if(meta.getMeta_key() != null && meta.getMeta_value() != null){
					conMetaRepo.save(meta);
				}
			}else{
				cMetaInfo.setMeta_value(meta.getMeta_value());
			}
		}
		conInfoRepo.saveAndFlush(cInfo);
		model.addAttribute("contentTypes", conTypeRepo.findAll());
		model.addAttribute("contentCatetories", conCategoryRepo.findAll());
		model.addAttribute("contentInfo", cInfo);
        return "/admin/content/detail";
    }
	
	@RequestMapping(value="/content/category", method=RequestMethod.GET)
    public String contentCategoryList(Model model) {
		List<ContentCategory> list = conCategoryRepo.findAll();
		model.addAttribute("categoryList", list);
		model.addAttribute("category", new ContentCategory());
        return "/admin/content/category";
    }
	
	@RequestMapping(value="/content/category/create", method=RequestMethod.POST)
    public String contentCategoryCreate(ContentCategory category ,Model model) {
		
		String categoryName = category.getText();
		
		List<ContentCategory> list = conCategoryRepo.findAll();
		model.addAttribute("categoryList", list);
		model.addAttribute("category", new ContentCategory());
		
		if(categoryName == null){
			model.addAttribute("msg", "값을 넣어주세요.");
			return "/admin/content/category";
		}
		categoryName = categoryName.trim();
		if(categoryName.isEmpty()){
			model.addAttribute("msg", "값을 넣어주세요.");
			return "/admin/content/category";
		}
		
		ContentCategory find = conCategoryRepo.findByText(categoryName);
		if(find == null){
			conCategoryRepo.saveAndFlush(category);
		}else{
			model.addAttribute("msg", "이미 존재하는 Category입니다.");
		}
		
		model.addAttribute("categoryList", conCategoryRepo.findAll());
		
        return "/admin/content/category";
    }
	
	@RequestMapping(value="/content/category/delete", method=RequestMethod.POST)
    public String contentCategoryDelete(ContentCategory category ,Model model) {
		
		if(category != null){
			ContentCategory find = conCategoryRepo.findById(category.getId());
			if(find != null){
				conCategoryRepo.delete(find);
			}
		}
		conCategoryRepo.flush();
		List<ContentCategory> list = conCategoryRepo.findAll();
		model.addAttribute("categoryList", list);
		model.addAttribute("category", new ContentCategory());
        return "/admin/content/category";
    }
	
	@RequestMapping(value="/capcontent/add", method=RequestMethod.GET)
    public String addCapContentPage(@RequestParam(value="",required=false, defaultValue="true")Boolean cap, Model model) {
		List<ContentInfo> list = conInfoRepo.findByCap(cap);
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentInfoList", list);
		model.addAttribute("contentStatusList", statusList);
		model.addAttribute("capContent", new CapContent());
		model.addAttribute("isCap", cap);
        return "/admin/content/addCap";
    }
	
	@RequestMapping(value="/capcontent/create", method=RequestMethod.POST)
    public String createCapContent(CapContent capContent, @RequestParam(value="",required=false, defaultValue="true")Boolean cap,Model model, HttpSession session) {
		SecurityContext userDetails = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		UserDetail userDetail =  (UserDetail) userDetails.getAuthentication().getDetails();
		int userDbId = userDetail.getUserDBId();
		User user = userRepo.findById(userDbId);
		
		List<ContentInfo> list = conInfoRepo.findByCap(cap);
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentInfoList", list);
		model.addAttribute("contentStatusList", statusList);
		model.addAttribute("capContent", capContent);
		model.addAttribute("isCap", cap);
		
		int content_id =  capContent.getContent_id();
		ContentInfo info =  conInfoRepo.findById(content_id);
		if(info == null){
			model.addAttribute("msg", "Content 정보가 존재하지 않습니다.");
			return "/admin/content/addCap";
		}
		
		int thumbnail_id = capContent.getThumbnail_id();
		Image thumbnail = imageRepo.findById(thumbnail_id);
		
		if(thumbnail == null){
			model.addAttribute("msg", "썸네일 이미지가 존재하지 않습니다.");
			return "/admin/content/addCap";
		}
		
		String status_text = capContent.getStatus_text();
		ContentStatus status = conStatusRepo.findByText(status_text);
		
		if(status == null){
			status = conStatusRepo.findByText(ContentStatus.PENDING);
		}
		
		capContent.setUser(user);
		capContent.setStatus(status);
		capContent.setThumbnail(thumbnail);
		capContent.setInfo(info);
		capContent.setCreateDate(new Date());
		capContentRepo.saveAndFlush(capContent);
		model.addAttribute("capContent", capContent);
        return "/admin/content/editCap";
    }
	
	@RequestMapping(value="/capcontent/list", method=RequestMethod.GET)
    public String capContentListPage(@RequestParam(defaultValue="1", required=false) int page, Model model) {
		int start = (page - 1);
		Pageable pageable = new PageRequest(start, count, Direction.DESC, "id");
		
		Page<CapContent> capContentPage = capContentRepo.findAll(pageable);
		model.addAttribute("capContentList", capContentPage.getContent());
		model.addAttribute("paging", new Paging(page, (int)capContentPage.getTotalElements(), count));
        return "/admin/content/caplist";
    }
	
	@RequestMapping(value="/capcontent/detail/{contentId}", method=RequestMethod.GET)
    public String editCapContent(@PathVariable("contentId") Integer contentId, Model model, HttpSession session) {
		List<ContentInfo> list = conInfoRepo.findAll();
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentInfoList", list);
		model.addAttribute("contentStatusList", statusList);
		
		CapContent capContent = capContentRepo.findById(contentId);
		model.addAttribute("capContent", capContent);
        return "/admin/content/editCap";
    }
	
	@RequestMapping(value="/capcontent/edit", method=RequestMethod.POST)
    public String editCapContent(CapContent capContent, @RequestParam(value="",required=false, defaultValue="true")Boolean cap,Model model, HttpSession session) {
		List<ContentInfo> list = conInfoRepo.findByCap(cap);
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentInfoList", list);
		model.addAttribute("contentStatusList", statusList);
		model.addAttribute("capContent", capContent);
		model.addAttribute("isCap", cap);
		
		CapContent cCapContet = capContentRepo.findById(capContent.getId());
		
		int content_id =  capContent.getContent_id();
		if(content_id > 0){
			ContentInfo info =  conInfoRepo.findById(content_id);
			if(info == null){
				model.addAttribute("msg", "Content 정보가 존재하지 않습니다.");
				return "/admin/content/editCap";
			}else{
				cCapContet.setInfo(info);
			}
		}
		
		int thumbnail_id = capContent.getThumbnail_id();
		
		if(thumbnail_id > 0){
			Image thumbnail = imageRepo.findById(thumbnail_id);
			
			if(thumbnail == null){
				model.addAttribute("msg", "썸네일 이미지가 존재하지 않습니다.");
				return "/admin/content/editCap";
			}else{
				cCapContet.setThumbnail(thumbnail);
			}
		}
		
		String status_text = capContent.getStatus_text();
		
		if(status_text != null && !status_text.isEmpty()){
			ContentStatus status = conStatusRepo.findByText(status_text);
			
			if(status == null){
				status = conStatusRepo.findByText(ContentStatus.PENDING);
			}else{
				cCapContet.setStatus(status);
			}
		}
		
		
		cCapContet.setTitle(capContent.getTitle());
		cCapContet.setContent(capContent.getContent());
		cCapContet.setContent(capContent.getContent());
		cCapContet.setContent(capContent.getContent());
		cCapContet.setSummary(capContent.getSummary());
		capContentRepo.saveAndFlush(cCapContet);
		model.addAttribute("capContent", cCapContet);
        return "/admin/content/editCap";
    }
	
	@RequestMapping(value="/etccontent/add", method=RequestMethod.GET)
    public String addETCContentPage(Model model) {
		List<ContentInfo> list = conInfoRepo.findAll();
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentInfoList", list);
		model.addAttribute("contentStatusList", statusList);
		model.addAttribute("etcContent", new ETCContent());
        return "/admin/content/addEtc";
    }
	
	@RequestMapping(value="/etccontent/list", method=RequestMethod.GET)
    public String etcContentListPage(@RequestParam(defaultValue="1", required=false) int page, Model model) {
		
		int start = (page - 1);
		
		Pageable pageable = new PageRequest(start, count, Direction.DESC, "id");
		
		Page<ETCContent> contentInfoList = etcContentRepo.findAll(pageable);
		model.addAttribute("etcContentList", contentInfoList.getContent());
		model.addAttribute("paging", new Paging(page, (int)contentInfoList.getTotalElements(), count));
        return "/admin/content/etclist";
    }
	
	@RequestMapping(value="/etccontent/create", method=RequestMethod.POST)
    public String createNonCapContent(ETCContent etcContent, Model model, HttpSession session) {
		SecurityContext userDetails = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		UserDetail userDetail =  (UserDetail) userDetails.getAuthentication().getDetails();
		int userDbId = userDetail.getUserDBId();
		User user = userRepo.findById(userDbId);
		
		List<ContentInfo> list = conInfoRepo.findAll();
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentInfoList", list);
		model.addAttribute("contentStatusList", statusList);
		model.addAttribute("etcContent", etcContent);
		
		
		int content_id =  etcContent.getContent_id();
		ContentInfo info =  conInfoRepo.findById(content_id);
		
		int thumbnail_id = etcContent.getThumbnail_id();
		Image thumbnail = imageRepo.findById(thumbnail_id);
		
		if(thumbnail == null){
			model.addAttribute("msg", "썸네일 이미지가 존재하지 않습니다.");
			return "/admin/content/addEtc";
		}
		
		String status_text = etcContent.getStatus_text();
		ContentStatus status = conStatusRepo.findByText(status_text);
		
		if(status == null){
			status = conStatusRepo.findByText(ContentStatus.PENDING);
		}
		
		etcContent.setUser(user);
		etcContent.setStatus(status);
		etcContent.setThumbnail(thumbnail);
		etcContent.setInfo(info);
		etcContent.setCreateDate(new Date());
		etcContentRepo.saveAndFlush(etcContent);
		model.addAttribute("etcContent", etcContent);
        return "/admin/content/editEtc";
    }
	
	@RequestMapping(value="/etccontent/edit", method=RequestMethod.POST)
    public String editNonCapContent(ETCContent etccontent, Model model, HttpSession session) {
		List<ContentInfo> list = conInfoRepo.findAll();
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentInfoList", list);
		model.addAttribute("contentStatusList", statusList);
		model.addAttribute("etcContent", etccontent);
		
		ETCContent cEtcContent = etcContentRepo.findById(etccontent.getId());
		
		
		int content_id =  etccontent.getContent_id();
		if(content_id > 0){
			ContentInfo info =  conInfoRepo.findById(content_id);
			if(info == null){
				model.addAttribute("msg", "Content 정보가 존재하지 않습니다.");
				return "/admin/content/editEtc";
			}else{
				cEtcContent.setInfo(info);
			}
		}
		
		int thumbnail_id = etccontent.getThumbnail_id();
		
		if(thumbnail_id > 0){
			Image thumbnail = imageRepo.findById(thumbnail_id);
			
			if(thumbnail == null){
				model.addAttribute("msg", "썸네일 이미지가 존재하지 않습니다.");
				return "/admin/content/editEtc";
			}else{
				cEtcContent.setThumbnail(thumbnail);
			}
		}
		
		String status_text = etccontent.getStatus_text();
		
		if(status_text != null && !status_text.isEmpty()){
			ContentStatus status = conStatusRepo.findByText(status_text);
			
			if(status == null){
				status = conStatusRepo.findByText(ContentStatus.PENDING);
			}else{
				cEtcContent.setStatus(status);
			}
		}
		
		cEtcContent.setTitle(etccontent.getTitle());
		cEtcContent.setContent(etccontent.getContent());
		cEtcContent.setContent(etccontent.getContent());
		etcContentRepo.saveAndFlush(cEtcContent);
		model.addAttribute("etcContent", cEtcContent);
        return "/admin/content/editEtc";
    }
	
	@RequestMapping(value="/etccontent/detail/{contentId}", method=RequestMethod.GET)
    public String editNonCapContent(@PathVariable("contentId") Integer contentId, Model model, HttpSession session) {
		List<ContentInfo> list = conInfoRepo.findAll();
		List<ContentStatus> statusList = conStatusRepo.findAll();
		model.addAttribute("contentInfoList", list);
		model.addAttribute("contentStatusList", statusList);
		
		ETCContent cEtcContent = etcContentRepo.findById(contentId);
		model.addAttribute("etcContent", cEtcContent);
        return "/admin/content/editEtc";
    }
}
