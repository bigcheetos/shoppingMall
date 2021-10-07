package admin.img.com.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

/*@Configuration
public class UploadmanageController implements WebMvcConfigurer{
	
	@Value("${resouce.path}")
	private String resourcePath;
	
	@Value("${upload.path}")
	private String uploadPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler(uploadPath)
		.addResourceLocations(resourcePath);
	}
	
	@GetMapping("/display")
	public ResponseEntity<Byte[]> getImage(String fileName){
	
		File file = new File("c:\\upload\\"+fileName);
	}
	

}*/
