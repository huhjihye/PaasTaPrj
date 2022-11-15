package kopo.poly;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

//@EnableScheduling //크롤링 스케줄러
@SpringBootApplication
public class PaasTaPrjApplication {

	public static void main(String[] args) {
		SpringApplication.run(PaasTaPrjApplication.class, args);
	}

//스프링 전체에서 사용가능 (전역변수로)
//	@Bean
//	public RestTemplate restTemplate() {
//		return new RestTemplate();
//	}

}
