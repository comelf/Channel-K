package com.ydeatimes.channelk.core;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.ydeatimes.channelk.auth.Crc32;
import com.ydeatimes.channelk.auth.PhPass;

@Configuration
@ComponentScan(basePackages = {"com.ydeatimes.channelk.web"} )
public class ApplicationConfig {

	@Bean
	public CommonsMultipartResolver multipartResolver() {
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	    multipartResolver.setDefaultEncoding("utf-8");
	    multipartResolver.setMaxUploadSize(10000000);
	    return multipartResolver;
	}
	
	@Bean
	public PhPass phPass() {
		return new PhPass(8);
	}

	@Bean
	public Crc32 crc32 () {
		return new Crc32();
	}
}
