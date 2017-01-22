package com.ydeatimes.channelk.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.ETCContent;

@Repository
public interface ContentRepository extends JpaRepository<ETCContent,  Integer>{
	
}
