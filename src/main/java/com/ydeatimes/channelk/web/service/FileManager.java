package com.ydeatimes.channelk.web.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ydeatimes.channelk.web.model.UploadResult;
import com.ydeatimes.channelk.web.model.content.Image;
import com.ydeatimes.channelk.web.repository.ImageRepository;
import com.ydeatimes.channelk.web.util.ImageTransferUtil;

@Service
public class FileManager {
	
	private static int ERROR_IMAGE_ID = -1;
	private static final Logger LOG = LoggerFactory
			.getLogger(FileManager.class);
	
	private static final String MEDIA_PATH = "/channelk/media";
	
	@Autowired
	Environment env;
	
	@Autowired
	ImageRepository imageRepo;
	
	public UploadResult readAndSave(MultipartFile file, String des) {
		Image img = new Image(file.getOriginalFilename(), file.getSize(), des, MEDIA_PATH);
		
		ImageTransferUtil itu = new ImageTransferUtil();
		
		try {
			itu.saveOne(file, img);
			insertDatabase(img);
		} catch (IllegalStateException | IOException e){
			itu.delete();
			LOG.warn("File transfer Error  : {}", e.getMessage());
			return resultError("파일을 서버에 저장할수 없습니다.");
		} catch (Exception e){
			itu.delete();
			LOG.warn("File meta data insert(DB) Error  : {}", e.getMessage());
			return resultError("파일을 데이터베이스에 저장할수 없습니다.");
		}
		
		return new UploadResult(false, img.getUrlPathWithQuality(ImageTransferUtil.ORIGIN_QUALITY), img.getId());
		
	}

	
//	public UploadResult saveOne(MultipartFile file, String des) {
//		Image img = new Image(file.getOriginalFilename(), file.getSize(), des, env.getRequiredProperty("meesig.file.path"));
//		ImageTransferUtil itu = new ImageTransferUtil();
//		
//		try {
//			itu.saveOne(file, img);
//			insertDatabase(img);
//		} catch (IllegalStateException | IOException e){
//			itu.delete();
//			LOG.warn("File transfer Error  : {}", e.getMessage());
//			return resultError("파일을 서버에 저장할수 없습니다.");
//		} catch (Exception e){
//			itu.delete();
//			LOG.warn("File meta data insert(DB) Error  : {}", e.getMessage());
//			return resultError("파일을 데이터베이스에 저장할수 없습니다.");
//		}
//		
//		return new UploadResult(false,img.getUrlPathWithQuality(0), img.getId());
//	}
	
	private void insertDatabase(Image img) {
		imageRepo.saveAndFlush(img);
//		mediaDBManager.insertFileInfo(pi);
	}

	private UploadResult resultError(String msg) {
		return new UploadResult(true, msg, ERROR_IMAGE_ID );
	}

	public File save(MultipartFile file) throws IllegalStateException, IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String today = formatter.format(new java.util.Date());
		String fileName = today +"_" + file.getOriginalFilename();
		File eFile = new File(env.getRequiredProperty("meesig.file.path")+"/excel/"+fileName);
		file.transferTo(eFile);
		return eFile;
	}

}
