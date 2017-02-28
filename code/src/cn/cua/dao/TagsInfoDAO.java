package cn.cua.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import cn.cua.domain.AdminInfo;
import cn.cua.domain.SubTagsInfo;
import cn.cua.domain.TagsInfo;
import cn.cua.domain.ThemeInfo;
import cn.cua.domain.UserInfo;
import cn.cua.utils.HibernateUtils;


public class TagsInfoDAO {

	static ArrayList<TagsInfo> tagList = new ArrayList<TagsInfo>();
	static ArrayList<SubTagsInfo> subTagList = new ArrayList<SubTagsInfo>();

	
	public void getTags(){//遍历标签表，获取词表，并建立标签和子标签的关联关系
		try {
			Configuration configuration = new Configuration().configure();
			SessionFactory sessionFactory = configuration.buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction(); 
			String sql = "select * from tags_info"; 
			List list= session.createSQLQuery(sql). 
	                addEntity(TagsInfo.class).    //指定将查询的记录行转换成实体 
	                list();   
			for(int i=0;i<list.size();i++) tagList.add((TagsInfo)list.get(i));
		    //=====遍历子标签表
			sql = "select * from subtags_info"; 
			list= session.createSQLQuery(sql). 
	                addEntity(SubTagsInfo.class).    //指定将查询的记录行转换成实体 
	                list();   
			for(int i=0;i<list.size();i++) {
				subTagList.add((SubTagsInfo)list.get(i));
				for(int j=0;j<tagList.size();j++) 
		    		if(tagList.get(j).getTagNo()==subTagList.get(i).getTagNo()) tagList.get(j).addSubTag(subTagList.get(i).getSubtagId());
				}
			transaction.commit(); 
		    session.close(); 
		 } catch (Exception e) {
		     System.out.println("Error:"+e.toString()+e.getMessage());
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String fenci(String str){//str为待分词的语句
		if(str.isEmpty()) return "";
		if(tagList.isEmpty()) getTags();
		 int MaxLen=4;
		        String s="";
		        int begin=0,end;
		        while(begin<str.length()){
		            end=begin+MaxLen;
		            if(end>str.length())end=str.length();
		            while(begin<end){
		            	for(int i=0;i<tagList.size();i++)
		            	    if(tagList.get(i).getTagName().equals(str.substring(begin,end))){//子串str.substring(begin,end)为标签
		            	    	String[] temp = tagList.get(i).subTags.split(",");
		            	    	for(int j=0;j<temp.length;j++){
		            	    		if(s.isEmpty()) s+=temp[j];
		            	    		else s+=","+temp[j];
		            		}
		            		break;
		            	}
		            	for(int i=0;i<subTagList.size();i++)
		            		if(subTagList.get(i).getSubtagName().equals(str.substring(begin,end))){//子串为子标签
				            if(s.isEmpty()) s+=subTagList.get(i).getSubtagId();
				            else s+=","+subTagList.get(i).getSubtagId();
		            		break;	
		            	}
		                end--;
		            }
		            if(begin==end)end++;
		            begin=end;
		        }
		        return s;
	}
}
