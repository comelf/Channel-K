package com.ydeatimes.channelk.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.ContentStatus;
import com.ydeatimes.channelk.web.model.content.ETCContent;

@Repository
public interface ETCContentRepository extends JpaRepository<ETCContent,  Integer>{

	ETCContent findById(int id);

	ETCContent findByIdAndStatus(int etcNum, ContentStatus status);

	List<ETCContent> findTop14ByStatusOrderByCreateDateDesc(ContentStatus status);

	Page<ETCContent> findByStatus(ContentStatus status, Pageable pageable);
	
}
