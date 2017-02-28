package cn.cua.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.cua.domain.BuserInfo;
import cn.cua.domain.JourneyInfo;
import cn.cua.domain.ProductInfo;
import cn.cua.service.BuserService;
import cn.cua.service.JourneyService;
import cn.cua.service.BusinessProductService;
import cn.itcast.utils.CommonUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

/**
 * BusinessProductAction类
 * @author Sandm
 *
 */
public class BusinessProductAction extends ActionSupport implements ModelDriven<ProductInfo>{
	
	private ProductInfo model = new ProductInfo();//手动实例化
	private BusinessProductService businessProductService = new BusinessProductService();
	private BuserService buserService = new BuserService();
	
	private String jourRealName;
	private Integer jourId;
	
	private int proDays;//产品天数
	private String proName;//产品名称
	private String proCityName;//城市名称
	private String proDescription;//产品描述
	private String topOrNot;//是否热门
	private int proId;//产品id
	
	private int totalPage;//总页数
	private int pageNum;//当前页数
	private int pageSize;//每页产品数
	private int ps = 30;//设置pageSize
	
	//产品文件一对三
	private File file;
	private String fileFileName;
	private String fileContentType;
	
	private List<JourneyInfo> journeyInfo = new ArrayList<JourneyInfo>();
	private JourneyService journeyService = new JourneyService();
	
	//行程文件一对三
	private List<File> jfile;
	private List<String> jfileFileName;
	private List<String> jfileContentType;
	
	public List<JourneyInfo> getJourneyInfo() {
		return journeyInfo;
	}
	
	public List<File> getJfile() {
		return jfile;
	}

	public List<String> getJfileFileName() {
		return jfileFileName;
	}

	public List<String> getJfileContentType() {
		return jfileContentType;
	}

	public void setJfile(List<File> jfile) {
		this.jfile = jfile;
	}

	public void setJfileFileName(List<String> jfileFileName) {
		this.jfileFileName = jfileFileName;
	}

	public void setJfileContentType(List<String> jfileContentType) {
		this.jfileContentType = jfileContentType;
	}

	public ProductInfo getModel() {
		return model;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getPageNum() {
		return pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	

	public File getFile() {
		return file;
	}


	public String getFileFileName() {
		return fileFileName;
	}


	public String getFileContentType() {
		return fileContentType;
	}


	public void setFile(File file) {
		this.file = file;
	}


	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}


	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	

	public int getProDays() {
		return proDays;
	}
	public String getProName() {
		return proName;
	}
	public void setProDays(int proDays) {
		this.proDays = proDays;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	
	public String getProDescription() {
		return proDescription;
	}
	public String getTopOrNot() {
		return topOrNot;
	}
	
	public void setProDescription(String proDescription) {
		this.proDescription = proDescription;
	}
	public void setTopOrNot(String topOrNot) {
		this.topOrNot = topOrNot;
	}
	
	public String getProCityName() {
		return proCityName;
	}

	public void setProCityName(String proCityName) {
		this.proCityName = proCityName;
	}

	public String getJourRealName() {
		return jourRealName;
	}
	public Integer getJourId() {
		return jourId;
	}
	public void setJourRealName(String jourRealName) {
		this.jourRealName = jourRealName;
	}

	public void setJourId(Integer jourId) {
		this.jourId = jourId;
	}
	
	/**
	 * 分页操作
	 * @return
	 * @throws Exception
	 */
	public String page() throws Exception {
		
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buserInfo = buserService.findBuserById(buserId);
		////Integer businessId = 1;
		int productAmount = businessProductService.getProductAmount(buserInfo.getBusinessId());
		if(productAmount==0){
			return "pageFailed";
		}
		this.pageSize = this.ps;
		this.totalPage = (productAmount % pageSize==0)?(productAmount/pageSize):(productAmount/pageSize +1);
		if(this.pageNum <= 0){
			this.pageNum = 1;
		}
		if(this.pageNum > totalPage ){
			this.pageNum = totalPage;
		}
		return "page";
	}

	/**
	 * 对符合相应查询产品问题的分页操作
	 * @return
	 * @throws Exception
	 */
	public String queryPage() throws Exception {
		model.setProductName(proName);
		model.setProductDescription(proDescription);
		model.setCityName(proCityName);
		model.setIsTop(topOrNot);
		
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buserInfo = buserService.findBuserById(buserId);
		////Integer businessId = 1;
		int productAmount = businessProductService.getProductAmount(model, buserInfo.getBusinessId());
		this.pageSize = this.ps;
		this.totalPage = (productAmount % pageSize==0)?(productAmount/pageSize):(productAmount/pageSize+1);
		if(this.pageNum <= 0){
			this.pageNum = 1;
		}
		if(this.pageNum > totalPage ){
			this.pageNum = totalPage;
		}
		return "queryPage";
	}
	
	/**
	 * 对符合相应查询条件产品的分页操作1
	 * @return
	 * @throws Exception
	 */
	public String queryPage1() throws Exception {
		model.setProductName(proName);
		model.setProductDescription(proDescription);
		model.setCityName(proCityName);
		model.setIsTop(topOrNot);
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buserInfo = buserService.findBuserById(buserId);
		Integer businessId = buserInfo.getBusinessId();
		////Integer businessId = 1;
		int questionAmount = businessProductService.getProductAmount(model, businessId);
		this.pageSize = this.ps;
		this.totalPage = (questionAmount % pageSize==0)?(questionAmount/pageSize):(questionAmount/pageSize+1);
		if(this.pageNum <= 0){
			this.pageNum = 1;
		}
		if(this.pageNum > totalPage ){
			this.pageNum = totalPage;
		}
		return "queryPage1";
	}
	
	/**
	 * 显示所有产品
	 * 1.通过ProductService的findAll方法返回List<Product>
	 * 2.保存到ValueStack中
	 * 3.在product_list页面中用<s:iterator>标签显示
	 * @return
	 * @throws Exception
	 */
	public String findAll() throws Exception {
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buserInfo = buserService.findBuserById(buserId);
		Integer businessId = buserInfo.getBusinessId();
		////Integer businessId = 1;
		ActionContext.getContext().getValueStack().push(businessProductService.findAll(pageNum,pageSize,businessId));
		return "list";
	}
	
	/**
	 * 显示所有符合查询条件的产品
	 * 1.通过ProductService的findAll方法返回List<Product>
	 * 2.保存到ValueStack中
	 * 3.在product_list页面中用<s:iterator>标签显示
	 * @return
	 * @throws Exception
	 */
	public String queryFindAll() throws Exception {
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buserInfo = buserService.findBuserById(buserId);
		Integer businessId = buserInfo.getBusinessId();
		////Integer businessId = 1;
		model.setProductName(proName);
		model.setProductDescription(proDescription);
		model.setCityName(proCityName);
		model.setIsTop(topOrNot);
		ActionContext.getContext().getValueStack().push(businessProductService.findAll(model,pageNum,pageSize,businessId));
		return "queryList";
	}
	
	/**
	 * 增加产品信息
	 * 1.保存产品文件
	 * 2.向数据库中增加产品信息
	 * 3.返回"addJourney"跳转到journey_add.jsp页面
	 * @return
	 * @throws Exception
	 */
	@InputConfig(resultName="addInput")
	public String add() throws Exception {
		//根据model中的起止时间计算proDays
		/*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = format.parse(model.getEndDate());
		Date date2 = format.parse(model.getStartDate());
		int sec = (int)(date1.getTime() - date2.getTime());
		proDays = sec/1000/60/60/24 + 1;
		*/
		
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buserInfo = buserService.findBuserById(buserId);
		Integer businessId = buserInfo.getBusinessId();
		////Integer businessId = 1;
		proName = model.getProductName();
		model.setBusinessId(businessId);
		
		if(file!=null){
			model.setProductFileName(fileFileName);
			model.setProductRealName(CommonUtils.uuid() +"." + fileFileName.split("\\.")[1]);
			
			//上传文件
			String savePath = ServletActionContext.getServletContext().getRealPath("/productFiles");
			File destFile = new File(savePath,model.getProductRealName());
			FileUtils.copyFile(file, destFile);
		}
		businessProductService.add(model);
		
		ServletActionContext.getRequest().getSession().setAttribute("proDays", proDays);
		return "addJourney";
	}
	
	/**
	 * 增加产品的校验
	 * @return
	 */
	public void validateAdd() throws Exception{
		proName = model.getProductName();
		
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buserInfo = buserService.findBuserById(buserId);
		Integer businessId = buserInfo.getBusinessId();
				////Integer businessId = 1;
		if(!businessProductService.isUnique(proName)){
			this.addActionError("产品名已占用！");
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = format.parse(model.getEndDate());
		Date date2 = format.parse(model.getStartDate());
		//int sec = (int)(date1.getTime() - date2.getTime());
		
		if((date1.getTime() - date2.getTime()) < 0){
			this.addFieldError("endDate","开始日期不能晚于结束日期！");
		}
		
	}
	
	/**
	 * 增加行程信息
	 * 1.保存行程文件
	 * 2.向数据库中增加行程信息
	 * 3.返回"editSucc"重定向到product_page
	 * @return
	 * @throws Exception
	 */
	@InputConfig(resultName="addJourneyInput")
	public String addJourney() throws Exception{
		String savePath = ServletActionContext.getServletContext().getRealPath("/journeyFiles");
		File destFile;
		
		//proDays = (Integer)ServletActionContext.getRequest().getSession().getAttribute("proDays");
		
		
		for(int i = 0;i < proDays;i++){
			
			if(jfile.get(i)!=null){
				journeyInfo.get(i).setJourneyFileName(jfileFileName.get(i));
				journeyInfo.get(i).setJourneyRealName(CommonUtils.uuid() +"." +
						jfileFileName.get(i).split("\\.")[1]);
			
				//上传文件
				destFile = new File(savePath,journeyInfo.get(i).getJourneyRealName());
				FileUtils.copyFile(jfile.get(i), destFile);
			}
			
			journeyService.add(journeyInfo.get(i));
		}
		return "editSucc";
	}
	
	/**
	 * 增加行程的校验
	 * @return
	 */
	public void validateAddJourney(){
		proDays = (Integer)ServletActionContext.getRequest().getSession().getAttribute("proDays");
		
		if(jfile == null ||jfile.size() < proDays ){
			this.addFieldError("jfile", "每个行程必须对应一个文件！");
		}
		
		int add = 0;
		
		for(int i = 0; i < proDays;i++){
			String journeyTitle = journeyInfo.get(i).getJourneyTitle();
			if((journeyTitle==null||journeyTitle.trim().isEmpty())&&add==0){
				this.addFieldError("journeyTitle", "行程标题不能为空！");
				add = 1;
			}
			if(journeyTitle.length()>20&&add==0){
				this.addFieldError("journeyTitle", "行程标题长度须在1-20之间！");
				add = 1;
			}
		
		}
	}
	
	
	/**
	 * 增加一行行程信息
	 * 1.保存行程文件
	 * 2.向数据库中增加行程信息
	 * 3.返回"editSucc"重定向到product_page
	 * @return
	 * @throws Exception
	 */
	public String addOneJourney() throws Exception{
		//从session域中取出model
		model = (ProductInfo)businessProductService.load(proId);
		String savePath = ServletActionContext.getServletContext().getRealPath("/journeyFiles");
		File destFile;
		
		if(jfile.get(0)!=null){
			journeyInfo.get(0).setJourneyFileName(jfileFileName.get(0));
			journeyInfo.get(0).setJourneyRealName(CommonUtils.uuid() +"." +
					jfileFileName.get(0).split("\\.")[1]);
			
			//上传文件
			destFile = new File(savePath,journeyInfo.get(0).getJourneyRealName());
			FileUtils.copyFile(jfile.get(0), destFile);
		}
		journeyInfo.get(0).setProductName(proName);
		journeyService.add(journeyInfo.get(0));
		
		
		ActionContext.getContext().getValueStack().push(journeyService.findByProductName(proName));
		
		//返回product_edit之前都要反复向session中提交model等内容
		//ServletActionContext.getRequest().getSession().setAttribute("proName", model.getProductName());
		//proDays = (Integer)ServletActionContext.getRequest().getSession().getAttribute("proDays");
		//proDays = proDays+1;
		
		/*Date startDate = (new SimpleDateFormat("yyyy-MM-dd")).parse(model.getStartDate());
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		cal.add(Calendar.DATE, proDays-1);
		model.setEndDate((new SimpleDateFormat("yyyy-MM-dd")).format(cal.getTime()));*/
		
		//productService.edit(model);
		//ServletActionContext.getRequest().getSession().setAttribute("model", model);
		//ServletActionContext.getRequest().getSession().setAttribute("proDays", proDays);
		
		return "journeyList";
	}
	
	
	
	/**
	 * 删除产品信息
	 * 1.如果文件存在，删除
	 * 2.删除数据库表中的产品信息
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception {
		model = (ProductInfo)businessProductService.load(model.getProductId());
		ServletActionContext.getRequest().getSession().setAttribute("proName", model.getProductName());
		if(model.getProductRealName()!=null){
			//如果文件存在，删除文件
			String savePath = ServletActionContext.getServletContext().getRealPath("/productFiles");
			new File(savePath,model.getProductRealName()).delete();
		}
		//删除数据库表中的产品信息
		businessProductService.delete(model.getProductId());
		return "deleteJourney";
	}
	
	/**
	 * 删除行程信息
	 * 1.查询所有产品名称为特定名称的行程信息
	 * 2.循环遍历，删除文件信息和数据库中的信息
	 * @return
	 * @throws Exception
	 */
	public String deleteJourney() throws Exception {
		String savePath = ServletActionContext.getServletContext().getRealPath("/journeyFiles");
		String productName = (String)ServletActionContext.getRequest().getSession().getAttribute("proName");
		List<JourneyInfo> journeyInfos = journeyService.findByProductName(productName);
		
		for(JourneyInfo journeyInfo:journeyInfos){
			if(journeyInfo.getJourneyRealName()!=null){
				//如果有文件存在,删除文件
				new File(savePath,journeyInfo.getJourneyRealName()).delete();
			}
			journeyService.delete(journeyInfo.getJourneyId());
		}
		return "editSucc";
	}
	
	/**
	 * 删除行程信息
	 * 1.如果存在文件，删除
	 * 2.删除数据库中的信息
	 * @return
	 * @throws Exception
	 */
	public String deleteOneJourney() throws Exception {
		//保存model,用于返回产品编辑页面的展示数据
		//model = (ProductInfo)productService.load(proId);
		
		String savePath = ServletActionContext.getServletContext().getRealPath("/journeyFiles");
		new File(savePath,jourRealName).delete();
		journeyService.delete(jourId);
		
		ActionContext.getContext().getValueStack().push(journeyService.findByProductName(proName));
		
		//ServletActionContext.getRequest().getSession().setAttribute("proName", model.getProductName());
		//proDays = (Integer)ServletActionContext.getRequest().getSession().getAttribute("proDays");
		//proDays = proDays-1;
		
		/*Date startDate = (new SimpleDateFormat("yyyy-MM-dd")).parse(model.getStartDate());
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		cal.add(Calendar.DATE, proDays-1);
		model.setEndDate((new SimpleDateFormat("yyyy-MM-dd")).format(cal.getTime()));
		*/
		
		//productService.edit(model);
		//ServletActionContext.getRequest().getSession().setAttribute("model", model);
		//ServletActionContext.getRequest().getSession().setAttribute("proDays", proDays);
		return "journeyList";
	}
	
	
	
	/**
	 * 查看产品及相关行程信息
	 * @return
	 * @throws Exception
	 */
	public String view() throws Exception {
		model = businessProductService.load(model.getProductId());
		ActionContext.getContext().getValueStack().push(journeyService.findByProductName(model.getProductName()));
		return "view";
	}
	
	/**
	 * 为传参而建的函数
	 * @return
	 */
	public String loadForAdd(){
		return "loadForAdd";
	}
	/**
	 * 编辑之前的加载
	 * @return
	 * @throws Exception
	 */
	public String loadForEdit() throws Exception {
		if(model.getProductId()!=0){
			model = businessProductService.load(model.getProductId());
		}else{
			model = businessProductService.load(proId);
		}
		//将model和productName放入session域中，传参
		//ServletActionContext.getRequest().getSession().setAttribute("proName", model.getProductName());
		this.proName = model.getProductName();
		this.proId = model.getProductId();
		//ServletActionContext.getRequest().getSession().setAttribute("model", model);
		ActionContext.getContext().getValueStack().push(journeyService.findByProductName(model.getProductName()));
		//proDays = journeyService.findByProductName(model.getProductName()).size();
		//ServletActionContext.getRequest().getSession().setAttribute("proDays", proDays);
		return "edit";
	}

	/**
	 * 编辑产品信息
	 * @return
	 * @throws Exception
	 */
	@InputConfig(resultName="editInput")
	public String edit() throws Exception{
		Integer buserId = (Integer)ActionContext.getContext().getSession().get("buserId");
		BuserInfo buserInfo = buserService.findBuserById(buserId);
		Integer businessId = buserInfo.getBusinessId();
				////Integer businessId = 1;
		model.setBusinessId(businessId);
		if(file!=null){
			//如果上传了文件，删除原文件
			String savePath = ServletActionContext.getServletContext().getRealPath("/productFiles");
			if(model.getProductRealName()!=null){
				new File(savePath,model.getProductRealName()).delete();
			}
			//然后上传新文件
			model.setProductFileName(fileFileName);
			model.setProductRealName(CommonUtils.uuid() +"." + fileFileName.split("\\.")[1]);
			
			File destFile = new File(savePath,model.getProductRealName());
			//File destFile = new File(savePath,fileFileName);
			FileUtils.copyFile(file, destFile);
		}
		//proDays =(Integer)ServletActionContext.getRequest().getSession().getAttribute("proDays");
		
		/*Date startDate = (new SimpleDateFormat("yyyy-MM-dd")).parse(model.getStartDate());
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		cal.add(Calendar.DATE, proDays-1);
		model.setEndDate((new SimpleDateFormat("yyyy-MM-dd")).format(cal.getTime()));
		*/
		
		//根据修改前的产品名称对行程信息进行修改
		String productName = proName;
		businessProductService.edit(model);
		
		List<JourneyInfo> journeyInfos = journeyService.findByProductName(productName);
		
		for(JourneyInfo journeyInfo:journeyInfos){
			journeyInfo.setProductName(model.getProductName());
			journeyService.edit(journeyInfo);
		}
		
		
		
		
		//proDays = (Integer)ServletActionContext.getRequest().getSession().getAttribute("proDays");
		//ServletActionContext.getRequest().getSession().setAttribute("proDays", proDays);
		return "loadForEdit";
	}
	
	/**
	 * 编辑产品的校验
	 * @throws Exception
	 */
	public void validateEdit() throws Exception{
		
		if(!businessProductService.isUnique(model)){
			this.addActionError("产品名已占用！");
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = format.parse(model.getEndDate());
		Date date2 = format.parse(model.getStartDate());
		//int sec = (int)(date1.getTime() - date2.getTime());
		
		if((date1.getTime() - date2.getTime()) < 0){
			this.addFieldError("endDate","开始日期不能晚于结束日期！");
		}
		
	}
	
	/**
	 * 编辑行程之前的加载
	 * @return
	 * @throws Exception
	 */
	public String loadJourneyForEdit() throws Exception {
		journeyInfo.add(journeyService.load(jourId));
		return "editJourney";
	}
	
	/**
	 * 编辑行程
	 * @return
	 * @throws Exception
	 */
	@InputConfig(resultName="editJourneyInput")
	public String editJourney() throws Exception {
		model= businessProductService.load(proId);
		
		if(jfile!=null){
			//如果上传了文件，删除原文件
			String savePath = ServletActionContext.getServletContext().getRealPath("/journeyFiles");
			new File(savePath,journeyInfo.get(0).getJourneyRealName()).delete();
			//然后上传新文件
			journeyInfo.get(0).setJourneyFileName(jfileFileName.get(0));
			journeyInfo.get(0).setJourneyRealName(CommonUtils.uuid() +"." + jfileFileName.get(0).split("\\.")[1]);
			File destFile = new File(savePath,journeyInfo.get(0).getJourneyRealName());
			FileUtils.copyFile(jfile.get(0), destFile);
		}
		journeyService.edit(journeyInfo.get(0));
		
		ActionContext.getContext().getValueStack().push(journeyService.findByProductName(journeyInfo.get(0).getProductName()));
		
		return "journeyList";
	}

}
