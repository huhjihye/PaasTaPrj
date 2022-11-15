package kopo.poly.service;

import kopo.poly.dto.NewsDTO;
import org.json.simple.JSONArray;

import java.util.List;

public interface INewsService {



    JSONArray newsList()throws Exception;
    List<NewsDTO> enewsList()throws Exception;
}
