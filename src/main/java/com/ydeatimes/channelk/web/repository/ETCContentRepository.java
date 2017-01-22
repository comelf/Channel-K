package com.ydeatimes.channelk.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.ContentStatus;
import com.ydeatimes.channelk.web.model.content.ETCContent;

@Repository
public interface ETCContentRepository extends JpaRepository<ETCContent,  Integer>{

	ETCContent findById(int id);

	List<ETCContent> findTop15ByOrderByCreateDateDesc();

	ETCContent findByIdAndStatus(int etcNum, ContentStatus status);
	
}
