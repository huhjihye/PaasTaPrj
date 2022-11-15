package kopo.poly.service.impl;

import kopo.poly.service.IPhotoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;


@Slf4j
@Service("PhotoService")
public class PhotoService implements IPhotoService {



    private static final String SAVE_PATH="/upload";
    //저장된 파일을 jsp에서 불러오기 위한 경로
    private static final String PREFIX_URL="/upload/";



    @Override
    public String insertFile(MultipartFile mft) throws Exception {
        log.info(this.getClass().getName()+".insertFile start!!");
        String url =null;

        try {
            //파일 정보
            String originalFilename = mft.getOriginalFilename();
            String extName = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
            Long size = mft.getSize();

            //서버에 저장할 파일 이름
            String saveFileName = genSaveFileName(extName);

            log.info("originFilename : " + originalFilename);
            log.info("extensionName : " + extName);
            log.info("size : " + size);
            log.info("saveFileName : " + saveFileName);

            writeFile(mft, saveFileName);
            url= PREFIX_URL + saveFileName;
        }
        catch(IOException e){
            throw new RuntimeException(e);
        }
        //뷰 페이지에서 바로 이미지 파일을 보기 위해
        return url;

        
    }

    //현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName="";

        Calendar calendar = Calendar.getInstance();
        fileName +=calendar.get(Calendar.YEAR);
        fileName +=calendar.get(Calendar.MONTH);
        fileName +=calendar.get(Calendar.DATE);
        fileName +=calendar.get(Calendar.HOUR);
        fileName +=calendar.get(Calendar.MINUTE);
        fileName +=calendar.get(Calendar.SECOND);
        fileName +=calendar.get(Calendar.MILLISECOND);
        fileName +=extName;

        return fileName;

    }

    //파일을 실제로 write 하는 메서드
    private boolean writeFile(MultipartFile mft, String saveFileName)throws IOException{
        boolean result =false;

        byte[] data=mft.getBytes();
        FileOutputStream fos =new FileOutputStream(SAVE_PATH + "/"+saveFileName);
        fos.write(data);
        fos.close();

        return result;
    }


}
