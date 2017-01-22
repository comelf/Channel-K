package com.ydeatimes.channelk.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.ContentCategory;

@Repository
public interface ContentCategoryRepository extends JpaRepository<ContentCategory,  Integer>{

	ContentCategory findById(int id);

	ContentCategory findByText(String categoryName);
	
}
