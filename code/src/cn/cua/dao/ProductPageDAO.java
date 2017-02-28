package cn.cua.dao;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import cn.cua.domain.ProductInfo;
import cn.cua.domain.StrategyFileInfo;
import cn.cua.domain.ThemeInfo;
import cn.cua.domain.TravelDestinationInfo;
import cn.cua.utils.HibernateUtils;

public class ProductPageDAO {
	

	/**
	 * 攻略下载首页-主题目的地推荐
	 * @return
	 */
	public LinkedHashMap<ThemeInfo,List<String>> findThemeTypeList(){
		//组合查询	
		Session session1 = HibernateUtils.openSession();
		Transaction transaction1 = session1.beginTransaction(); 
		
		String hql="from ThemeInfo";
		Query query = session1.createQuery(hql);	//获得query对象
		
		List<String> typeList = new ArrayList<String>();
		List<ThemeInfo> themeInfos = query.list();	//执行查询	
			
		for(int i = 0; i<themeInfos.size();i++){
			typeList.add(themeInfos.get(i).getThemeName());
		}
		
		transaction1.commit();
		session1.close();
		
		
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
			
		LinkedHashMap<ThemeInfo,List<String>> hp = new LinkedHashMap<ThemeInfo,List<String>>();
		
		for(int i=0;i<typeList.size();i++){
			Criteria criteria = session.createCriteria(TravelDestinationInfo.class);
			criteria.add(Restrictions.like("themeType", "%"+typeList.get(i)+"%"));
			List<TravelDestinationInfo> tempList = criteria.list();	
			List<String> list = new ArrayList<String>();
			for(int j=0;j<tempList.size();j++){
				list.add(tempList.get(j).getCityName());
			}
			hp.put(themeInfos.get(i), list);
			
		}

		//list = list.subList(0, 4);
		transaction.commit();
		session.close();
		
		return hp;
	}
	
	/**
	 * 产品下载首页-国内目的地推荐
	 * @return
	 */
	public LinkedHashMap<String,List<String>> findHomeTD(){
		//组合查询	
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		Query query = session.createQuery("select area from TravelDestinationInfo where homeOrAbroad='国内'");
			
		List<String> isAreaTypeList = query.list();	
		
		LinkedHashMap<String,List<String>> hp = new LinkedHashMap<String,List<String>>();
		
		for(int i=0;i<isAreaTypeList.size();i++){
			Criteria criteria = session.createCriteria(TravelDestinationInfo.class);
			criteria.add(Restrictions.eq("area",isAreaTypeList.get(i)));
			List<TravelDestinationInfo> tempList = criteria.list();	
			List<String> list = new ArrayList<String>();
			for(int j=0;j<tempList.size();j++){
				list.add(tempList.get(j).getCityName());
			}
			hp.put(isAreaTypeList.get(i), list);
			
		}

		transaction.commit();
		session.close();
		
		return hp;
	}
	
	/**
	 * 所有产品的默认排序
	 * @return
	 */
	public int getAmountOfIsTop(){
		//组合查询	
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		Criteria criteria = session.createCriteria(ProductInfo.class);
		criteria.add(Restrictions.eq("isPublic", "是"));
		
		List<ProductInfo> list = criteria.list();	

		
		transaction.commit();
		session.close();
		return list.size();
	}
	
	/**
	 * 产品推荐首页-热门产品
	 * @return
	 */
	public List<ProductInfo> findIsTop(int pageNum,int pageSize){
		//组合查询	
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		Criteria criteria = session.createCriteria(ProductInfo.class);
		
		criteria.addOrder(Order.desc("isTop")).addOrder(Order.desc("orderWeight"));
		criteria.add(Restrictions.eq("isPublic", "是")); 
		
		criteria.setFirstResult((pageNum-1)*pageSize);
		criteria.setMaxResults(pageSize);
		List<ProductInfo> list = criteria.list();	

		
		transaction.commit();
		session.close();
		
		return list;
	}
	

	

	
	/**
	 * 
	 * @return
	 */
	public List<ProductInfo> findPrice(int pageNum,int pageSize){
		//组合查询	
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		Criteria criteria = session.createCriteria(ProductInfo.class);
		
		criteria.addOrder(Order.asc("productPrice")).addOrder(Order.desc("orderWeight"));
		criteria.add(Restrictions.eq("isPublic", "是")); 
		
		criteria.setFirstResult((pageNum-1)*pageSize);
		criteria.setMaxResults(pageSize);
		
		List<ProductInfo> list = criteria.list();

		
		transaction.commit();
		session.close();
		
		return list;
	}
	
	/**
	 * 搜索返回
	 * @return
	 */
	public int getAmountOfSearch(String productName){
		//组合查询	
				Session session = HibernateUtils.openSession();
				Transaction transaction = session.beginTransaction(); 
				
				Criteria criteria = session.createCriteria(ProductInfo.class);
				
				criteria.add(Restrictions.like("productName", "%"+productName+"%"));
				criteria.add(Restrictions.eq("isPublic", "是"));
							
				List<ProductInfo> list = criteria.list();	

				
				transaction.commit();
				session.close();
				
				return list.size();
	}
	/**
	 * 标签搜索返回
	 * @return
	 */
	public int getAmountOfTag(String tag){
		//组合查询	
				Session session = HibernateUtils.openSession();
				Transaction transaction = session.beginTransaction(); 
				
				Criteria criteria = session.createCriteria(ProductInfo.class);
				String[] temp =tag.split(",");
				List<ProductInfo> list = criteria.list();	
				transaction.commit();
				session.close();
				ArrayList<ProductInfo> templist = new ArrayList<ProductInfo>();
				for(int i=0;i<list.size();i++)
					if(juge(list.get(i).getTags(),tag)>temp.length/4+1) templist.add(list.get(i));
				return templist.size()-1;
	}
	/**
	 * 产品推荐首页-搜索热门产品
	 * @return
	 */
	public List<ProductInfo> findSearchIsTop(String productName,int pageNum,int pageSize){
		//组合查询	
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		Criteria criteria = session.createCriteria(ProductInfo.class);
		criteria.add(Restrictions.like("productName", "%"+productName+"%"));
		criteria.addOrder(Order.desc("isTop")).addOrder(Order.desc("orderWeight"));
		
		criteria.setFirstResult((pageNum-1)*pageSize);
		criteria.setMaxResults(pageSize);
		List<ProductInfo> list = criteria.list();	

		
		transaction.commit();
		session.close();
		
		return list;
	}
	/**
	 * 产品推荐首页-搜索相应标签产品
	 * @return
	 */
	public List<ProductInfo> findSearchTag(String tag,int pageNum,int pageSize){
		//组合查询	
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		Criteria criteria = session.createCriteria(ProductInfo.class);
		String[] temp =tag.split(",");
		List<ProductInfo> list = criteria.list();	
		transaction.commit();
		session.close();
		ArrayList<ProductInfo> templist = new ArrayList<ProductInfo>();
		for(int i=0;i<list.size();i++)
			if(juge(list.get(i).getTags(),tag)>temp.length/4+1) templist.add(list.get(i));
		double[] imp=new double[temp.length];//权重默认为相等的1.0
		Arrays.fill(imp,1.0);
		shakersort(templist,change(tag),imp);
		return templist.subList((pageNum-1)*pageSize, ((pageNum-1)*pageSize+pageSize)>templist.size()-1? templist.size()-1:((pageNum-1)*pageSize+pageSize));
	}
	public static int juge(String s1,String s2){//s1为当前产品标签序列，s2为搜索标签序列，返回s1中包含的s2标签数量
		String[] temp0 =s1.split(",");
		String[] temp =s2.split(",");
		int j=0;
		for(int p=0;p<temp0.length;p++)
		for(int i=0;i<temp.length;i++)if(temp0[p].equals(temp[i])) j++;
		return j+1;
	}
	public static int[] change(String s){
		String[] temp = s.split(",");
		int[] r = new int[temp.length];
		for(int i=0;i<temp.length;i++) r[i]=Integer.parseInt(temp[i]);
		return r;
	}
	   public void shakersort(ArrayList<ProductInfo> number,int[] reach,double[] important) {   //改进的冒泡排序
	        int i, left = 0, right = number.size() - 1, shift = 0;    
	        while(left < right) {   
	            // 向右進行氣泡排序   
	            for(i = left; i < right; i++) {   
	                if(getRate(number.get(i),reach,important)< getRate(number.get(i+1),reach,important) ) {   
	                	sweap(number,i,i+1);
	                    shift = i;   
	                }   
	            }   
	            right = shift;    
	      
	            // 向左進行氣泡排序   
	            for(i = right; i > left; i--) {   
	                if(getRate(number.get(i),reach,important)> getRate(number.get(i-1),reach,important)) {   
	                	sweap(number,i,i-1);
	                    shift = i;   
	                }   
	            }   
	            left = shift;   
	        }  
	    }   
	     public static void sweap(ArrayList<ProductInfo> list,int a,int b){
	    	 ProductInfo temp=list.get(a);
	    	 list.set(a, list.get(b));
	    	 list.set(b, temp);
	     }
	     public double getRate(ProductInfo p,int[] reach,double[] t2){//reach为搜索标签序列，t2为权重序列
	    		if(t2.length==reach.length){
	    			double rate=0.0;
	    			int[] tags=change(p.getTags());
	    			int[] relate=change(p.getRelate());
	    			for(int i=0;i<tags.length;i++)
	    				for(int j=0;j<reach.length;j++)
	    					if(tags[i]==reach[j]) rate+=relate[i]*t2[j];
	    			return rate;
	    		}
	    			else return 0;
	     }
	/**
	 * 产品推荐首页-搜索价格排序
	 * @return
	 */
	public List<ProductInfo> findSearchPrice(String productName,int pageNum,int pageSize){
		//组合查询	
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction(); 
		
		Criteria criteria = session.createCriteria(ProductInfo.class);
		criteria.add(Restrictions.like("productName", "%"+productName+"%"));		
		criteria.addOrder(Order.asc("productPrice")).addOrder(Order.desc("orderWeight"));
		
		criteria.setFirstResult((pageNum-1)*pageSize);
		criteria.setMaxResults(pageSize);
		
		List<ProductInfo> list = criteria.list();	

		for(int i=0;i<list.size();i++){
		}
		
		transaction.commit();
		session.close();
		
		return list;
	}
	

}
