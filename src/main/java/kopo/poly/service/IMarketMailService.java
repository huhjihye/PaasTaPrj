package kopo.poly.service;

import kopo.poly.dto.MailDTO;

public interface IMarketMailService {
    int doSendmail(MailDTO mDTO)throws Exception;

}
