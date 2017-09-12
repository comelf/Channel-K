package com.ydeatimes.channelk.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.CapContent;
import com.ydeatimes.channelk.web.model.content.ContentInfo;
import com.ydeatimes.channelk.web.model.content.ContentStatus;

@Repository
public interface CapContentRepository extends JpaRepository<CapContent,  Integer>{

	CapContent findById(int id);

	List<CapContent> findTop14ByStatusOrderByCreateDateDesc(ContentStatus status);
	
	List<CapContent> findByInfo(ContentInfo info);

	CapContent findByIdAndStatus(int capNum, ContentStatus status);

	List<CapContent> findByInfoAndStatusOrderByIdDesc(ContentInfo info,
			ContentStatus status);

	Page<CapContent> findByInfoAndStatus(ContentInfo info, ContentStatus status, Pageable pageable);

	@Query("select f from cap_content c JOIN c.info f where c.status = :status group by f order by min(c.id)")
	List<ContentInfo> findInfoByStatus(@Param("status") ContentStatus status);
	
}
