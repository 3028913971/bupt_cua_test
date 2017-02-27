package cn.cua.service;


import cn.cua.dao.TagsInfoDAO;

public class TagService {
	
	private TagsInfoDAO tiDao = new TagsInfoDAO();

	public String fenci(String t){
		return tiDao.fenci(t);
	}
	
}
