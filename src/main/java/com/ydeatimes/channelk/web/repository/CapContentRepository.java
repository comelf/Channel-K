package com.ydeatimes.channelk.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.CapContent;
import com.ydeatimes.channelk.web.model.content.ContentInfo;
import com.ydeatimes.channelk.web.model.content.ContentStatus;

@Repository
public interface CapContentRepository extends JpaRepository<CapContent,  Integer>{

	CapContent findById(int id);

	List<CapContent> findTop13ByStatusOrderByCreateDateDesc(ContentStatus status);

	List<CapContent> findByInfo(ContentInfo info);

	CapContent findByIdAndStatus(int capNum, ContentStatus status);

	List<CapContent> findByInfoAndStatusOrderByIdDesc(ContentInfo info,
			ContentStatus status);
}