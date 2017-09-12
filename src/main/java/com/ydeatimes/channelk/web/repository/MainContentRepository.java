package com.ydeatimes.channelk.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.MainContent;

@Repository
public interface MainContentRepository extends JpaRepository<MainContent,  Integer>{

	MainContent findOneByType(int type);

	List<MainContent> findAllByType(int comingContent);
	
}
