package com.ydeatimes.channelk.web.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.ContentCategory;
import com.ydeatimes.channelk.web.model.content.ContentInfo;
import com.ydeatimes.channelk.web.model.content.ContentStatus;
import com.ydeatimes.channelk.web.model.content.ContentType;

@Repository
public interface ContentInfoRepository extends JpaRepository<ContentInfo,  Integer>{

	@Query("select c from content_info as c where c.type.id =  :type_id")
	List<ContentInfo> findAllContent(@Param("type_id")int typeId);

	@Query("select count(c) from content_info")
	int countTotal();

	ContentInfo findById(int contentInfoId);

	@Query("select c from content_info as c where c.cap =  :cap")
	List<ContentInfo> findByCap(@Param("cap")boolean cap);

//	List<ContentInfo> findByCapAndCategory(boolean cap, ContentCategory category);

//	List<ContentInfo> findTop15ByCapAndCategoryOrderByIdDesc(boolean cap,	ContentCategory category);

//	List<ContentInfo> findTop15ByCapOrderByIdDesc(boolean cap);

//	List<ContentInfo> findTop15ByCapAndTypeOrderByIdDesc(boolean cap,
//			ContentType type);

	List<ContentInfo> findTop15ByCapAndStatusOrderByIdDesc(boolean cap, ContentStatus status);

	List<ContentInfo> findTop15ByCapAndCategoryAndStatusOrderByIdDesc(boolean cap, ContentCategory category,
			ContentStatus status);

	List<ContentInfo> findTop15ByCapAndTypeAndStatusOrderByIdDesc(boolean cap, ContentType type, ContentStatus status);

	
	Page<ContentInfo> findByCapAndCategoryAndStatus(boolean b, ContentCategory category, ContentStatus status,
			Pageable pageable);

	Page<ContentInfo> findByCapAndTypeAndStatus(boolean b, ContentType type, ContentStatus status, Pageable pageable);

	Page<ContentInfo> findByCapAndStatus(boolean b, ContentStatus status, Pageable pageable);

}
