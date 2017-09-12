package com.ydeatimes.channelk.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.ydeatimes.channelk.web.model.content.ContentCategory;
import com.ydeatimes.channelk.web.model.content.ContentInfo;
import com.ydeatimes.channelk.web.model.content.ContentStatus;
import com.ydeatimes.channelk.web.model.content.ContentType;
import com.ydeatimes.channelk.web.repository.CapContentRepository;
import com.ydeatimes.channelk.web.repository.ContentCategoryRepository;
import com.ydeatimes.channelk.web.repository.ContentInfoRepository;
import com.ydeatimes.channelk.web.repository.ContentStatusRepository;
import com.ydeatimes.channelk.web.repository.ContentTypeRepository;

@Service
public class CapContentInfoService {
	
	@Autowired
	ContentStatusRepository statusRepo;
	
	@Autowired
	CapContentRepository capContentRepo;

	@Autowired
	ContentInfoRepository conInfoRepo;
	
	@Autowired
	ContentCategoryRepository caontentCategoryRepo;
	
	@Autowired
	ContentTypeRepository contentTypeRepo;
	
	public Page<ContentInfo> getCapInfo(Integer categoryId, Integer categoryType, Integer page) {
		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
		Pageable pageable = new PageRequest(page-1, 15, Direction.DESC, "id");
		if (categoryId > 0) {
			ContentCategory category = caontentCategoryRepo.findById(categoryId);
			return conInfoRepo.findByCapAndCategoryAndStatus(true, category, status, pageable);
		} else if (categoryType > 0) {
			ContentType type = contentTypeRepo.findById(categoryType);
			return conInfoRepo.findByCapAndTypeAndStatus(true, type, status, pageable);
		} else {
			return conInfoRepo.findByCapAndStatus(true, status, pageable);
		}
	}

	public ContentInfo getByContentId(int contentId) {
		return conInfoRepo.findById(contentId);
	}

//	public Page<ContentInfo> getCapInfoForMain() {
//		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
//		Pageable pageable = new PageRequest(0, 7);
//		return conInfoRepo.findInfoByStatusGroupByInfo(status, pageable);
//	}
	
}
