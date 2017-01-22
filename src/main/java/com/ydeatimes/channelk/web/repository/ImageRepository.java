package com.ydeatimes.channelk.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ydeatimes.channelk.web.model.content.Image;

@Repository
public interface ImageRepository extends JpaRepository<Image,  Integer>{

	Image findById(int bannerId);
	
}
