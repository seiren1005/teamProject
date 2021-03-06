package com.globalin.bulletincontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.globalin.bulletindomain.BulletinFileVO;

import net.coobird.thumbnailator.Thumbnailator;


@Controller
public class BulletinUploadController {

	private Logger log = 
			LoggerFactory.getLogger(BulletinUploadController.class);
		
	
	// remove attached file
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String[] fileName, String[] type) {
		
		log.info("Delete attached files: " + fileName);
		
		// Declare removing object ahead
		File file;
		
		try {
			
			for(int i = 0; i < fileName.length; i++) {
				
				file = new File("c:\\temp\\"
						+ URLDecoder.decode(fileName[i], "UTF-8"));
				
				// remove original files
				file.delete();
				
				if(type[i].equals("image")) {
					
					String sName = file.getAbsolutePath().replace("s_", "");
					
					// remove thumbnail files
					file = new File(sName);
					file.delete();
					
				}
				
			}
			
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<>("Delete Compoletely.", HttpStatus.OK);
		
	}
	
	
	// Treat downloads request
	@GetMapping(value="/download", 
			produces= MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) {
		
		log.info("Download files: " + fileName);
		
		// resource object for return
		Resource resource = new FileSystemResource("c:\\temp\\"
				+ fileName);
		
		String resourceName = resource.getFilename();
		
		resourceName = resourceName.substring(resourceName.indexOf("_") + 1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition", "attchment;filename=" + 
					new String(resourceName.getBytes("UTF-8"), "ISO-8859-1"	));
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resource,headers, HttpStatus.OK);
		
	}
	
	
	// ???????????? get ???????????? ????????? ????????? ????????? ??? ????????? ??????
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName) {
		// ????????? ???????????? byte[] ????????? ??????
		log.info("Transport a file: " + fileName);
		
		File file = new File("c:\\temp\\"
				+ fileName);
		
		ResponseEntity<byte[]> result = null;
		
		// byte[] ????????? ????????? ????????? ???????????? ?????????????????? ??????
		// media type ?????? ?????????????????? ????????? ?????? ???????????? ???
		try {
			HttpHeaders header = new HttpHeaders();
			
			// ????????? content type ?????? ?????? ??????
			header.add("Content-Type", Files.probeContentType(file.toPath()));
						
			// file ????????? byte ????????? ????????? ??????
			result = new ResponseEntity<byte[]>(
					FileCopyUtils.copyToByteArray(file),
					header, // header ?????? ??????
					HttpStatus.OK // status ??????
					);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	@GetMapping("/uploadAjax")
	public void uploadForm() {
		
		log.info("Upload files using AJAX");
		
	}
	
	
	@PostMapping(value="/uploadAjaxAction", 
			produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<BulletinFileVO>> 
		uploadAjaxAction(MultipartFile[] uploadFile) {
		log.info("C:\\temp");
		log.info("Upload by AJAX post");
		
		List<BulletinFileVO> list = new ArrayList<>();
		
		for(MultipartFile file: uploadFile) {
			
			log.info("================================");
			log.info("File: " + file.getOriginalFilename());
			// .getOriginalfilename() -> ????????? ?????? ??????
			// .getName() -> input tag ??? name attribute ?????? ??????
			log.info("Size: " + file.getSize());
			
			// ?????? ?????? ?????????, ????????? ??????, ?????? ?????? ??????
			String uploadFileName = file.getOriginalFilename();
			String uploadPath = "c:\\temp";
			
			UUID uuid = UUID.randomUUID();
			
			BulletinFileVO fvo = new BulletinFileVO();
			fvo.setFileName(file.getOriginalFilename());;
			fvo.setUuid(uuid.toString());
			
			// ????????? ?????? ????????? uuid_filename ???????????? ??????
			uploadFileName = uuid.toString() + "_" + uploadFileName;			
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			
			try {				
				file.transferTo(saveFile);
				// transeferTo() -> ?????? ????????? ?????????
				
				// create thumbnail when file is an image type
				if(checkImageType(saveFile) == true) {
					
					
					fvo.setImageChecker("true");
					
					FileOutputStream thumbnail = new FileOutputStream(
							new File(uploadPath, "s_" + uploadFileName));
					
					// create thumbnail using library
					Thumbnailator.createThumbnail(file.getInputStream(),
							thumbnail, 100, 100);
					
					thumbnail.close();
					
				} else {
					
					fvo.setImageChecker("false");
					
				}
				
				list.add(fvo);
				
				System.out.println("upload controller test");
				System.out.println(fvo);
				System.out.println(list);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}
	
	
	// ??????????????? ????????? ????????? ???????????? ??????
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	
}
