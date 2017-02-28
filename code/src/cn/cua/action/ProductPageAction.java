package cn.cua.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.xml.rpc.ServiceException;

import org.andromedids.artifact.image_recognition.PredictResult;
import org.andromedids.artifact.image_recognition.RemoteImageRecognizer;
import org.andromedids.artifact.places205_labels_mapper.Places205LabelConverter;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.cua.domain.AdminInfo;
import cn.cua.domain.ProductInfo;
import cn.cua.domain.ThemeInfo;
import cn.cua.service.ProductPageService;
import cn.itcast.utils.CommonUtils;

import com.opensymphony.xwork2.ActionSupport;


public class ProductPageAction extends ActionSupport {

	private ProductPageService ppService = new ProductPageService();
	
	private LinkedHashMap<ThemeInfo,List<String>> themeTypeList = new LinkedHashMap<ThemeInfo,List<String>>();//主题城市列表
	private LinkedHashMap<String,List<String>> homeTDList = new LinkedHashMap<String,List<String>>();
	private int amountOfProduct;
	private List<ProductInfo> isTopProductList = new ArrayList<ProductInfo>();
	private List<ProductInfo> isPriceList = new ArrayList<ProductInfo>();
	
	private List<ProductInfo> isTopSearchProductList = new ArrayList<ProductInfo>();
	private List<ProductInfo> priceSearchList = new ArrayList<ProductInfo>();
	
	private int pageNum;
	private int totalpage;
	private int pageSize;
	
	//上传的图片用
	private File file;
	private String fileFileName;
	private String fileContentType;
	
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType; 
	}  
	public LinkedHashMap<ThemeInfo, List<String>> getThemeTypeList() {
		return themeTypeList;
	}
	public void setThemeTypeList(LinkedHashMap<ThemeInfo, List<String>> themeTypeList) {
		this.themeTypeList = themeTypeList;
	}
	public LinkedHashMap<String, List<String>> getHomeTDList() {
		return homeTDList;
	}
	public void setHomeTDList(LinkedHashMap<String, List<String>> homeTDList) {
		this.homeTDList = homeTDList;
	}
	public int getAmountOfProduct() {
		return amountOfProduct;
	}
	public void setAmountOfProduct(int amountOfProduct) {
		this.amountOfProduct = amountOfProduct;
	}
	public List<ProductInfo> getIsTopProductList() {
		return isTopProductList;
	}
	public void setIsTopProductList(List<ProductInfo> isTopProductList) {
		this.isTopProductList = isTopProductList;
	}
	public List<ProductInfo> getIsPriceList() {
		return isPriceList;
	}
	public void setIsPriceList(List<ProductInfo> isPriceList) {
		this.isPriceList = isPriceList;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
	public List<ProductInfo> getIsTopSearchProductList() {
		return isTopSearchProductList;
	}
	public void setIsTopSearchProductList(List<ProductInfo> isTopSearchProductList) {
		this.isTopSearchProductList = isTopSearchProductList;
	}
	public List<ProductInfo> getPriceSearchList() {
		return priceSearchList;
	}
	public void setPriceSearchList(List<ProductInfo> priceSearchList) {
		this.priceSearchList = priceSearchList;
	}
	/**
	 * 产品一级页面默认排序分页
	 * @return
	 */
	public String pageIsTop(){
		pageSize = 18;
		int productAmount = ppService.getAmountOfIsTop();
		this.totalpage = productAmount%pageSize==0?(productAmount/pageSize):(productAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pageIsTop";
	}
	
	/**
	 * 产品一级页面默认排序分页
	 * @return
	 */
	public String findAllIsTop(){
		themeTypeList = ppService.findThemeTypeList();
		homeTDList = ppService.findHomeTD();
		isTopProductList = ppService.findIsTop(pageNum, pageSize);
		return "isTopList";
	}
	
	/**
	 * 产品一级页面价格排序分页
	 * @return
	 */
	public String pagePrice(){
		pageSize = 18;
		int productAmount = ppService.getAmountOfIsTop();
		this.totalpage = productAmount%pageSize==0?(productAmount/pageSize):(productAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pagePrice";
	}
	
	/**
	 * 产品一级页面价格排序分页
	 * @return
	 */
	public String findAllPrice(){
		themeTypeList = ppService.findThemeTypeList();
		homeTDList = ppService.findHomeTD();
		isPriceList = ppService.findPrice(pageNum, pageSize);
		return "isPrice";
	}
	
	private String search;
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	private String tag;
	
	
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	/**
	 * 搜索分页-热门排序
	 * @return
	 */
	public String pageSearchIsTop(){
		pageSize = 18;
		int productAmount = ppService.getAmountOfSearch(this.search);
		if(productAmount == 0){
			return "pageIsTopSearchFailed";
		}
		//ServletActionContext.getRequest().getSession().setAttribute("search", search);//--
		
		this.totalpage = productAmount%pageSize==0?(productAmount/pageSize):(productAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pageIsTopSearch";
	}
	/**
	 * 搜索分页-标签搜索
	 * @return
	 * @throws IOException 
	 * @throws ServiceException 
	 */
	public String pageSearchTag() throws IOException, ServiceException{
		pageSize = 18;
		PredictResult[] results = null;
		String pictureRec="";
		if(this.file!=null){
			//上传文件
			System.out.println("lalalala=================================");
			System.out.println(fileFileName);
			System.out.println(CommonUtils.uuid() +"." + fileFileName.split("\\.")[1]);
			String savePath = ServletActionContext.getServletContext().getRealPath("/productFiles");
			//File destFile = new File(savePath,CommonUtils.uuid() +"." + fileFileName.split("\\.")[1]);  //用编码过后的文件名
			File destFile = new File(savePath,"test.jpg");// 用本来的文件名
			FileUtils.copyFile(this.file, destFile);
			RemoteImageRecognizer recognizer = new RemoteImageRecognizer();
	        String imageFile = "/home/ubuntu/Tomcat/webapps/bupt_cua_test/productFiles/test.jpg";
	        results = recognizer.predict(imageFile);
	        Places205LabelConverter buptConverter = Places205LabelConverter.makeBUPTConverter("/home/ubuntu");
	        for(int i=0;i<results.length;i++){
	        	pictureRec+=buptConverter.convert(results[i].getLabel())+";";
	        }
	        //pictureRec+=buptConverter.convert(results[0].getLabel());
	        this.tag+=pictureRec;
		}
		
		

		
		int productAmount = ppService.getAmountOfTag(this.tag);
		if(productAmount == 0){
			return "pageIsTopSearchFailed";
		}
		this.totalpage = productAmount%pageSize==0?(productAmount/pageSize):(productAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pageTagSearch";
	}
	public String pageSearchIsTop1() throws UnsupportedEncodingException{
		//search = (String)ServletActionContext.getRequest().getSession().getAttribute("search");//--
		//search = new String(this.search.getBytes("ISO-8859-1"),"UTF-8");//++
		pageSize = 18;
		int productAmount = ppService.getAmountOfSearch(search);
		//ServletActionContext.getRequest().getSession().setAttribute("search", search);//--
		this.totalpage = productAmount%pageSize==0?(productAmount/pageSize):(productAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pageIsTopSearch";
	}
	public String pageSearchTag1() throws UnsupportedEncodingException{
		//search = (String)ServletActionContext.getRequest().getSession().getAttribute("search");//--
		//search = new String(this.search.getBytes("ISO-8859-1"),"UTF-8");//++
		pageSize = 18;
		int productAmount = ppService.getAmountOfTag(tag);
		//ServletActionContext.getRequest().getSession().setAttribute("search", search);//--
		this.totalpage = productAmount%pageSize==0?(productAmount/pageSize):(productAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pageTagSearch";
	}
	/**
	 * 搜索分页-热门排序
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String findAllSearchIsTop() throws UnsupportedEncodingException{
		//search = (String)ServletActionContext.getRequest().getSession().getAttribute("search");//--
		//search = new String(this.search.getBytes("ISO-8859-1"),"UTF-8");
		themeTypeList = ppService.findThemeTypeList();
		homeTDList = ppService.findHomeTD();
		//search = new String(search.getBytes("ISO-8859-1"),"UTF-8");
		isTopSearchProductList = ppService.findSearchIsTop(search, pageNum, pageSize);
		return "isTopListSearch";
	}
	/**
	 * 搜索分页-标签搜索排序
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String findAllSearchTag() throws UnsupportedEncodingException{
		themeTypeList = ppService.findThemeTypeList();
		homeTDList = ppService.findHomeTD();
		isTopSearchProductList = ppService.findSearchTag(tag, pageNum, pageSize);
		return "tagListSearch";
	}
	
	
	/**
	 * 搜索分页-价格排序
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String pageSearchPrice() throws UnsupportedEncodingException{
		//search = (String)ServletActionContext.getRequest().getSession().getAttribute("search");//--
		//search = new String(this.search.getBytes("ISO-8859-1"),"UTF-8");//++
		pageSize = 18;
		int productAmount = ppService.getAmountOfSearch(search);
		if(productAmount == 0){
			return "pageIsTopSearchFailed";
		}
		//ServletActionContext.getRequest().getSession().setAttribute("search", search);//--
		this.totalpage = productAmount%pageSize==0?(productAmount/pageSize):(productAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pagePriceSearch";
	}
	
	public String pageSearchPrice1() throws UnsupportedEncodingException{
		//search = (String)ServletActionContext.getRequest().getSession().getAttribute("search");//--
		//search = new String(this.search.getBytes("ISO-8859-1"),"UTF-8");//++
		pageSize = 18;
		int productAmount = ppService.getAmountOfSearch(search);
		if(productAmount == 0){
			return "pagePriceSearchFailed";
		}
		//ServletActionContext.getRequest().getSession().setAttribute("search", search);//--
		this.totalpage = productAmount%pageSize==0?(productAmount/pageSize):(productAmount/pageSize+1);
		if(pageNum<=0){
			this.pageNum=1;
		}
		if(pageNum>totalpage){
			this.pageNum=totalpage;
		}
		return "pagePriceSearch";
	}
	
	/**
	 * 搜索分页-热门排序
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String findAllSearchPrice() throws UnsupportedEncodingException{
		//search = (String)ServletActionContext.getRequest().getSession().getAttribute("search");//--
		//search = new String(this.search.getBytes("ISO-8859-1"),"UTF-8");//++
		themeTypeList = ppService.findThemeTypeList();
		homeTDList = ppService.findHomeTD();
		//search = new String(search.getBytes("ISO-8859-1"),"UTF-8");
		priceSearchList = ppService.findSearchPrice(search, pageNum, pageSize);
		return "priceListSearch";
	}
	
}
