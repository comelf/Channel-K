package com.ydeatimes.channelk.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.ContentType;

@Repository
public interface ContentTypeRepository extends JpaRepository<ContentType,  Integer>{

	ContentType findById(int id);
	
}
