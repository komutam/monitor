package com.monitor.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.monitor.dto.LoginDTO;
import com.monitor.service.AccountService;
import com.monitor.service.UploadFileService;
import com.monitor.util.MediaUtils;
import com.monitor.util.UploadFileUtils;
import com.monitor.vo.MemberVO;

@Controller
public class UploadController {
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private UploadFileService uploadFileService;
	
/*	@RequestMapping(value="/uploadForm", method=RequestMethod.GET)
	public void updateForm() {
	}
	
	@RequestMapping(value="/uploadForm", method=RequestMethod.POST)
	public String updateForm(MultipartFile file, Model model) throws Exception{
		 logger.info("originalName : "+file.getOriginalFilename());
		 logger.info("size : "+file.getSize());
		 logger.info("contentType :"+file.getContentType());
		 System.out.println("originalName : "+file.getOriginalFilename());
		 System.out.println("size : "+file.getSize());
		 System.out.println("contentType :"+file.getContentType());
		 
		 String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		 model.addAttribute("savedName", savedName);
		 
		 return "upload/uploadResult";
	}
	
	private String uploadFile(String originalFilename, byte[] fileData) throws Exception{
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_"+originalFilename;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	*/
	
	@ResponseBody
	@RequestMapping(value="/uploadMyImage/{userid}", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadProImage(MultipartFile file, @PathVariable("userid") String userid, MemberVO memberVO) throws Exception{
		System.out.println("originalName : " + file.getOriginalFilename());
		System.out.println("size : " + file.getSize());
		System.out.println("contentType :" + file.getContentType());
		System.out.println("useridid : "+userid);
		
		memberVO.setUserid(userid);
		UUID uuid = UUID.randomUUID();
		String myimg = uuid.toString() + "_" + file.getOriginalFilename();
		
		memberVO.setMyimg(myimg);
		
		uploadFileService.uploadProImage(memberVO);
		
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, myimg, userid, file.getBytes()), HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadMyTop/{userid}", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadTopImage(MultipartFile file, @PathVariable("userid") String userid, MemberVO memberVO) throws Exception{
		System.out.println("originalName(header) : " + file.getOriginalFilename());
		System.out.println("size(header) : " + file.getSize());
		System.out.println("contentType(header) :" + file.getContentType());
		System.out.println("useridid(header) : "+userid);
		
		memberVO.setUserid(userid);
		UUID uuid = UUID.randomUUID();
		String mybackground = uuid.toString() + "_" + file.getOriginalFilename();
		
		memberVO.setMybackground(mybackground);
		
		uploadFileService.uploadTopImage(memberVO);
		
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, mybackground, userid, file.getBytes()), HttpStatus.OK);
	}
	
//----------------------------------글에 이미지 올리기
	@ResponseBody
	@RequestMapping(value="/uploadPostImg/{userid}", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadTopImage(MultipartFile file, @PathVariable("userid") String userid) throws Exception{
		System.out.println("originalName(Post) : " + file.getOriginalFilename());
		System.out.println("size(Post) : " + file.getSize());
		System.out.println("contentType(Post) :" + file.getContentType());
		System.out.println("useridid(Post) : "+userid);
		
		UUID uuid = UUID.randomUUID();
		String fullname = uuid.toString() + "_" + file.getOriginalFilename();
		
		return new ResponseEntity<>(UploadFileUtils.uploadFileMk2(uploadPath, fullname, userid, file.getBytes()), HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
	 
	  InputStream in = null;
	  ResponseEntity<byte[]> entity = null;
	 
	  System.out.println("FILE NAME: " + fileName);
	 
	  try {
	 
	    String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); //제일먼저 확장자 추출
	 
	    MediaType mType = MediaUtils.getMediaType(formatName); //미디어유틸에서 이미지 확장자인지 확인
	 
	    HttpHeaders headers = new HttpHeaders();
	 
	    in = new FileInputStream(uploadPath + fileName);
	 
	    if (mType != null) {
	      headers.setContentType(mType);
	    } else {
	 
	      fileName = fileName.substring(fileName.indexOf("_") + 1);
	      headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); //이미지가 아닌경우 다운로드 용으로
	      headers.add("Content-Disposition",
	          "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\""); //한글처리 인코딩
	    }
	 
	    entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
	  } catch (Exception e) {
	    e.printStackTrace();
	    entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	  } finally {
	    in.close();
	  }
	  return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) throws Exception{
		System.out.println("delete file : "+fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	    MediaType mType = MediaUtils.getMediaType(formatName);
	    
	    if(mType != null) {
	        String front = fileName.substring(0, fileName.lastIndexOf("_"));
	        String end = fileName.substring(fileName.lastIndexOf("_s")+2);
	        new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
	    }
	    new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
	    return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

//---------------------------- account display
	@ResponseBody
	@RequestMapping("/{userid}/displayFile")
	public ResponseEntity<byte[]> displayFile2(String fileName) throws Exception {
	 
	  InputStream in = null;
	  ResponseEntity<byte[]> entity = null;
	 
	  System.out.println("FILE NAME: " + fileName);
	 
	  try {
	 
	    String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); //제일먼저 확장자 추출
	 
	    MediaType mType = MediaUtils.getMediaType(formatName); //미디어유틸에서 이미지 확장자인지 확인
	 
	    HttpHeaders headers = new HttpHeaders();
	 
	    in = new FileInputStream(uploadPath + fileName);
	 
	    if (mType != null) {
	      headers.setContentType(mType);
	    } else {
	 
	      fileName = fileName.substring(fileName.indexOf("_") + 1);
	      headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); //이미지가 아닌경우 다운로드 용으로
	      headers.add("Content-Disposition",
	          "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\""); //한글처리 인코딩
	    }
	 
	    entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
	  } catch (Exception e) {
	    e.printStackTrace();
	    entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	  } finally {
	    in.close();
	  }
	  return entity;
	}
}
