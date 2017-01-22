package com.ydeatimes.channelk.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.ContentMeta;

@Repository
public interface ContentMetaRepository extends JpaRepository<ContentMeta,  Integer>{
	
}
