package com.ydeatimes.channelk.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.ydeatimes.channelk.web.model.content.ContentStatus;
import com.ydeatimes.channelk.web.model.content.ETCContent;
import com.ydeatimes.channelk.web.repository.ContentStatusRepository;
import com.ydeatimes.channelk.web.repository.ETCContentRepository;

@Service
public class EtcContentService {

	@Autowired
	ContentStatusRepository statusRepo;
	
	@Autowired
	ETCContentRepository etcContentRepo;
	
	public Page<ETCContent> getEtcPageList(Integer page) {
		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
		Pageable pageable = new PageRequest(page-1, 16, Direction.DESC, "id");
		return etcContentRepo.findByStatus(status, pageable);
	}

	public List<ETCContent> getETCListForMain() {
		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
		return etcContentRepo.findTop14ByStatusOrderByCreateDateDesc(status);
	}

	public ETCContent getEtcContentDetail(Integer contentId) {
		ContentStatus status = statusRepo.findByText(ContentStatus.OPEN);
		ETCContent content = etcContentRepo.findByIdAndStatus(contentId, status);
		if(content != null){
			content.setViews(content.getViews()+1);
			etcContentRepo.save(content);
		}
		return content;
	}

}
