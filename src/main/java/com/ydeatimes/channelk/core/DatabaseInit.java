package com.ydeatimes.channelk.core;

import java.util.Date;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import com.ydeatimes.channelk.auth.Crc32;
import com.ydeatimes.channelk.auth.PhPass;
import com.ydeatimes.channelk.web.model.User;
import com.ydeatimes.channelk.web.model.content.ContentCategory;
import com.ydeatimes.channelk.web.model.content.ContentStatus;
import com.ydeatimes.channelk.web.model.content.ContentType;
import com.ydeatimes.channelk.web.repository.ContentCategoryRepository;
import com.ydeatimes.channelk.web.repository.ContentInfoRepository;
import com.ydeatimes.channelk.web.repository.ContentMetaRepository;
import com.ydeatimes.channelk.web.repository.ContentStatusRepository;
import com.ydeatimes.channelk.web.repository.ContentTypeRepository;
import com.ydeatimes.channelk.web.repository.UserRepository;

public class DatabaseInit {
	
	
	@Autowired
	ContentInfoRepository contentInfoRepo;
	
	@Autowired
	ContentTypeRepository contentTypeRepo;
	
	@Autowired
	ContentMetaRepository contentMetaRepo;
	
	@Autowired
	ContentCategoryRepository contentCategoryRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	ContentStatusRepository contentStatusRepo;
	
	
	@Autowired
	Crc32 crc;
	
	@Autowired
	PhPass phPass;
	
	
	@PostConstruct
	public void init(){
//		userInti();
//		contentTypeInit();
//		contentCategoryInit();
//		contentStatusInit();
	}

	private void contentStatusInit() {
		if(contentStatusRepo.findByText(ContentStatus.PENDING) ==null){
			ContentStatus status = new ContentStatus();
			status.setText(ContentStatus.PENDING);
			contentStatusRepo.saveAndFlush(status);
		}
		if(contentStatusRepo.findByText(ContentStatus.OPEN) ==null){
			ContentStatus status = new ContentStatus();
			status.setText(ContentStatus.OPEN);
			contentStatusRepo.saveAndFlush(status);
		}
		if(contentStatusRepo.findByText(ContentStatus.CLOSE) ==null){
			ContentStatus status = new ContentStatus();
			status.setText(ContentStatus.CLOSE);
			contentStatusRepo.saveAndFlush(status);
		}
	}

	private void userInti() {
		String adminId = "admin";
		User admin = userRepo.findByUserLoginId(crc.getCode(adminId), adminId);
		if(admin==null){
			admin = new User(adminId, crc.getCode(adminId));
			admin.setUser_password(phPass.HashPassword("dddddd"));
			admin.setUser_email("admin@admin.com");
			admin.setUser_name("ADMIN");
			admin.setUser_role("ROLE_ADMIN");
			admin.setUser_join_date(new Date());
			admin.setUser_point(0);
			admin.setUser_status(1);
			userRepo.saveAndFlush(admin);
		}
		
	}

	private void contentCategoryInit() {
		if(contentCategoryRepo.findById(ContentCategory.DRAMA) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.DRAMA);
			category.setText("드라마");
			contentCategoryRepo.saveAndFlush(category);
		}
		if(contentCategoryRepo.findById(ContentCategory.NOIR) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.NOIR);
			category.setText("느와르");
			contentCategoryRepo.saveAndFlush(category);
		}
		if(contentCategoryRepo.findById(ContentCategory.ROMANCE) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.ROMANCE);
			category.setText("로맨스");
			contentCategoryRepo.saveAndFlush(category);
		}
		if(contentCategoryRepo.findById(ContentCategory.THRILLER) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.THRILLER);
			category.setText("스릴러");
			contentCategoryRepo.saveAndFlush(category);
		}
		if(contentCategoryRepo.findById(ContentCategory.HORROR) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.HORROR);
			category.setText("호러");
			contentCategoryRepo.saveAndFlush(category);
		}
		if(contentCategoryRepo.findById(ContentCategory.MYSTERY) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.MYSTERY);
			category.setText("미스터리");
			contentCategoryRepo.saveAndFlush(category);
		}
		if(contentCategoryRepo.findById(ContentCategory.SF) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.SF);
			category.setText("SF");
			contentCategoryRepo.saveAndFlush(category);
		}
		if(contentCategoryRepo.findById(ContentCategory.HISTORICAL) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.HISTORICAL);
			category.setText("사극");
			contentCategoryRepo.saveAndFlush(category);
		}
		if(contentCategoryRepo.findById(ContentCategory.ANIMATION) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.ANIMATION);
			category.setText("애니매이션");
			contentCategoryRepo.saveAndFlush(category);
		}
		if(contentCategoryRepo.findById(ContentCategory.COMEDY) == null){
			ContentCategory category = new ContentCategory();
			category.setId(ContentCategory.COMEDY);
			category.setText("코미디");
			contentCategoryRepo.saveAndFlush(category);
		}
	}
	
	private void contentTypeInit() {
		
		if(contentTypeRepo.findById(ContentType.BROADCAST) ==null){
			ContentType type = new ContentType();
			type.setId(ContentType.BROADCAST);
			type.setText("드라마 캡");
			contentTypeRepo.saveAndFlush(type);
		}
		
		if(contentTypeRepo.findById(ContentType.MOVIE) ==null){
			ContentType type = new ContentType();
			type.setId(ContentType.MOVIE);
			type.setText("영화 캡");
			contentTypeRepo.saveAndFlush(type);
		}
		
		if(contentTypeRepo.findById(ContentType.SITCOM) ==null){
			ContentType type = new ContentType();
			type.setId(ContentType.SITCOM);
			type.setText("시트콤 캡");
			contentTypeRepo.saveAndFlush(type);
		}
		
		if(contentTypeRepo.findById(ContentType.ANIMATION) ==null){
			ContentType type = new ContentType();
			type.setId(ContentType.ANIMATION);
			type.setText("애니매이션 캡");
			contentTypeRepo.saveAndFlush(type);
		}
		
		if(contentTypeRepo.findById(ContentType.ETC) ==null){
			ContentType type = new ContentType();
			type.setId(ContentType.ETC);
			type.setText("기타 캡");
			contentTypeRepo.saveAndFlush(type);
		}
	}
	
}
