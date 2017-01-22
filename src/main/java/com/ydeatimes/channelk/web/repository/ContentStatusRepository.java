package com.ydeatimes.channelk.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.ContentStatus;

@Repository
public interface ContentStatusRepository extends JpaRepository<ContentStatus,  Integer>{

	ContentStatus findByText(String status);
	
}
