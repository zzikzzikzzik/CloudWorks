package com.cloudWorks.erp;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

// Spring 에서 파일업로드하는 [사용자 정의 클래스] 선언
public class FileUpload3 {
	// 속성변수 선언
		// <참고> 클래스 내부에 있는 모든 멤버가 공유하는 변수
	private MultipartFile multipartFile;	// 파일업로드 기능이 있는 MultipartFile 객체를 저장
	private String fileUploadDir;				// 업로드된 파일이 저장되는 서버쪽 운영체제 상의 폴더 경로를 저장 
	private String newFileName;				// 업로드된 파일에 서버쪽에서 부여할 새로운 이름을 저장
	private String delFileName;				// 삭제할 파일의 이름을 저장 
	private File file;						// 파일 또는 폴더를 관리하는 File 객체를 저장
	
	// 생성자 선언
		// <참고> 객체 생성 시 생성자가 호출되고 호출되면서 외부에서 데이터가 객체 안으로 들어온다. 
		// <주의> 생성자 오버로딩  
	public FileUpload3() {}
	public FileUpload3(
			MultipartFile multipartFile // 업로드된 파일을 관리하는 MultipartFile 객체
			,String fileUploadDir 			// 업로드된 파일을 저장할 폴더 경로
			,String delFileName			// 삭제할 파일명
	) throws Exception {
		// 매개변수 multipartFile, uploadDir 로 들어온 데이터를 속성변수 multipartFile, uploadDir 에 저장
		this.multipartFile = multipartFile;
		this.fileUploadDir = fileUploadDir;
		this.delFileName = delFileName;
		
		if(delFileName!=null && delFileName.isEmpty()==false) {
			if(new File(fileUploadDir + delFileName).isFile()==false) {
				throw new Exception();
			}
		}
		// 매개변수 multipartFile 안의 데이터가 null 값이 아니고 비어있지 않으면
		// 즉 외부에서 MultipartFile 객체가 매개변수로 들어오고 업로드된 파일이 있으면	
		if(multipartFile!=null && multipartFile.isEmpty()==false) {
			String ori_file_name = multipartFile.getOriginalFilename();
			String file_extension = ori_file_name.substring(ori_file_name.lastIndexOf(".")+1);
			this.newFileName = UUID.randomUUID() + "." + file_extension;
		}
	}	
	
	// 파일업로드 실행 메소드 선언
		// throws Exception
		// uploadFile() 내부에서 예외 처리를 하면 uploadFile() 를 호출한 부분은 예외가 발생했는지 알 수 없으므로
		// uploadFile() 내부에서 예외 처리를 하지 않고 uploadFile() 를 호출한 부분으로 예외 처리를 넘기겠다는 의미이다.
		// 이 경우에 최종 예외 처리는 BoardController 클래스가 담당한다.
		// <참고> File 객체를 다루는 메소드나 생성자는 반드시 예외 처리를 해야한다.
	public void uploadFile() throws Exception {
		
		if(multipartFile!=null && multipartFile.isEmpty()==false) {
			
			file = new File(fileUploadDir + newFileName);
			
			multipartFile.transferTo(file);
			
			if(delFileName!=null && delFileName.isEmpty()==false) {
				delete(fileUploadDir + delFileName);
			}
		
			System.out.println("<파일 업로드 성공> " + fileUploadDir + newFileName + " 파일!");
		}
	}
		

	// 파일업로드 시 만들어진 새로운 파일명 리턴 메소드 선언
		// <참고> 리턴되는 새로운 파일명은 DB에 저장될 예정이다.
	public String getNewFileName() {
		return newFileName;
	}

	// 업로드된 파일 삭제 메소드 선언
		// 막 업로드된 파일을 지울 때 사용되는 메소드
	public void delete() {
		// 속성변수 file 에 저장된 데이터가 null 이 아니면 파일 삭제
		if(file!=null) {
			file.delete();
			System.out.println("<파일 삭제 성공> " + newFileName + " 파일!");
		}
	}
	
	// 매개변수로 전달된 파일 삭제 메소드 선언
		// 전에 업로드된 파일을 지울 때 사용되는 메소드
	public void delete(String file_name) {
		// 매개변수 file_name 에 저장된 데이터가 null 이거나 비어있으면
		if(file_name==null || file_name.isEmpty()) {
			// 메소드 중단
			return;
		}
		// 매개변수 file_name 에 저장된 데이터에 해당하는 파일을  관리하는 File 객체 생성
		File file2 = new File(file_name);
		
		// File 객체가 관리하는 파일이 실제로 존재하면 파일 삭제
		if(file2.isFile()) {
			file2.delete();
			System.out.println("<파일 삭제 성공> " + file_name + " 파일!");
		}
	}
	
}
