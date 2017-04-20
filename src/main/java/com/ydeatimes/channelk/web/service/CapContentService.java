package com.ydeatimes.channelk.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.ydeatimes.channelk.web.model.content.CapContent;
import com.ydeatimes.channelk.web.model.content.ContentInfo;
import com.ydeatimes.channelk.web.model.content.ContentStatus;
import com.ydeatimes.channelk.web.repository.CapContentRepository;
import com.ydeatimes.channelk.web.repository.ContentStatusRepository;

@Service
public class CapContentService {

	@Autowired
	ContentStatusRepository statusRepo;
	
	@Autowired
	CapContentRepository capContentRepo;
	
	public Object getCapContentListForMain() {
		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
		return capContentRepo.findTop14ByStatusOrderByCreateDateDesc(status);
	}

	public CapContent getContentById(int capNum) {
		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
		return capContentRepo.findByIdAndStatus(capNum, status);
	}

	public Page<CapContent> getCapContentPageByInfo(ContentInfo info, Integer page) {
		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
		Pageable pageable = new PageRequest(page-1, 10, Direction.DESC, "id");
		return capContentRepo.findByInfoAndStatus(info, status, pageable);
	}

}
