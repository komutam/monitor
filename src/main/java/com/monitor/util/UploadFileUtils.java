package com.monitor.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	public static String uploadFile(String uploadPath, String originalName, String userid, byte[] fileData) throws Exception{
		
		String savedName = originalName;
		String savedPath = calcPath(uploadPath, userid);
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		String uploadedFileName = savedPath+savedName;
	
		return uploadedFileName;
	}
	
	//날짜별로 폴더를 만들기위한 정보생성
	private static String calcPath(String uploadPath, String userid) throws Exception{
		String userPath = File.separator + userid;
		Calendar cal = Calendar.getInstance();
		// File.separator : 디렉토리 구분자(\\)
		// 연도, ex) \\2017
	    String yearPath = userPath + File.separator + cal.get(Calendar.YEAR);
	    System.out.println(yearPath);
	        
	    // 월, ex) \\2017\\03
	    String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	    System.out.println(monthPath);
	        
	    // 날짜, ex) \\2017\\03\\01
	    String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	    System.out.println(datePath);
	    // 디렉토리 생성 메서드 호출
	    makeDir(uploadPath, userPath, yearPath, monthPath, datePath);
	    return datePath;
	}
	
	//폴더만드는 함수
	private static void makeDir(String uploadPath, String... paths) throws Exception{
		//폴더가 존재할 경우 값 반환
		if(new File(paths[paths.length-1]).exists()) {
			return;
		}else {//폴더가 존재하지 않으면 폴더 생성
			for(String path:paths) {
				File dirPath = new File(uploadPath+path);
				if(!dirPath.exists()) {
					dirPath.mkdir();
				}
			}
		}
	}	
	
//------------------------------------------------------------
	
	public static String uploadFileMk2(String uploadPath, String originalName, String userid, byte[] fileData) throws Exception{
		
		String savedName = originalName;
		String savedPath = calcPathMk2(uploadPath, userid);
		File target = new File(uploadPath + savedPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		// 썸네일을 생성하기 위한 파일의 확장자 검사
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		if(MediaUtils.getMediaType(formatName) != null) {//이미지 타입구분
			//썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		}else {
			return uploadedFileName;
		}
		return uploadedFileName;
	}
	
	//폴더정보
	private static String calcPathMk2(String uploadPath, String userid) throws Exception{
		
		String userPath = File.separator + userid;
		Calendar cal = Calendar.getInstance();

	    String yearPath = userPath + File.separator + cal.get(Calendar.YEAR);
	    System.out.println(yearPath);

	    String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	    System.out.println(monthPath);

	    String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	    System.out.println(datePath);

	    makeDirMk2(uploadPath, userPath, yearPath, monthPath, datePath);
	    return datePath;
	}
	
	//폴더생성
	private static void makeDirMk2(String uploadPath, String... paths) throws Exception{
		if(new File(paths[paths.length-1]).exists()) {//폴더가 존재할 경우 값 반환
			return;
		}else {//폴더가 존재하지 않으면 폴더 생성
			for(String path:paths) {
				File dirPath = new File(uploadPath+path);
				if(!dirPath.exists()) {
					dirPath.mkdir();
				}
			}
		}
	}
	
	//썸네일 생성 함수
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception{
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName)); // 이미지를 읽기 위한 버퍼
	    BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);  //100픽셀 단위의 썸네일 생성
	    
	    String formatNameS = fileName.substring(fileName.lastIndexOf("."));
	    String fileNameS = fileName.substring(0, fileName.lastIndexOf("."));
	    
	    System.out.println("포멧네임즈 : "+formatNameS);
	    System.out.println("파일네임즈 : "+fileNameS);
	    
	    // 썸네일의 이름을 생성(원본파일명 끝에 '_s'를 붙임)
	    String thumbnailName = uploadPath + path + File.separator + fileNameS + "_s" +formatNameS;
	    File newFile = new File(thumbnailName);
	    String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	    // 썸네일 생성
	    ImageIO.write(destImg, formatName.toUpperCase(), newFile);
	    // 썸네일의 이름을 리턴함
	    
	    return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
