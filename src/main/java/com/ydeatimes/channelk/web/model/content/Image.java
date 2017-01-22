package com.ydeatimes.channelk.web.model.content;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name = "image")
public class Image {
	private static final String DOT = ".";
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String oriFileName;
	private String fileExt;
	private String savePath;
	private String uuFileName;
	private String fullPath;
	private String uploadPath;
	private long fileSize;

	public Image(String fileName, long size, String des, String uploaPath) {
		this.uploadPath = uploaPath + "/images";

		// 원본파일명
		this.oriFileName = fileName;
		// 파일확장자
		this.fileExt = getFileExt(fileName);
		// 저장경로(서버)
		this.savePath = getFilePath();
		// 파일명 UUID화
		this.uuFileName = getRealFileName();
		// 저장경로 + 파일명(uuid)
		this.fullPath = savePath + uuFileName + DOT + fileExt;
		this.fileSize = size;
	}
	

	private String getRealFileName() {
		String result = "";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String today = formatter.format(new java.util.Date());
		result = today + UUID.randomUUID().toString();
		return result;
	}

	private String getFilePath() {
		String path = uploadPath + File.separator;
		File filePath = new File(path);
		if (!filePath.exists()) {
			filePath.mkdirs();
		}
		return path;
	}

	private String getFileExt(String filename) {
		String ext = filename.substring(filename.lastIndexOf(".")+1);
		return ext.toLowerCase();
	}
	
	public String getUrlPathWithQuality(int q) {
		return "/images/" + uuFileName +q + DOT + fileExt;
	}
	
	public String getSavePathWithQuality(int q) {
		return savePath + uuFileName + q + DOT + fileExt;
	}

}
