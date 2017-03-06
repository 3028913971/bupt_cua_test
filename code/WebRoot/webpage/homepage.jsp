<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>旅游攻略网站</title>
<link rel="stylesheet" href="webpage/css/homepage.css" charset="utf-8" />
<link rel="stylesheet" href="webpage/css/eric-meyer-reset.min.css" />
<link rel="stylesheet" href="webpage/css/common.css" />
<link href="webpage/mainpage/destination_recom/css/base.css"
	rel="stylesheet" type="text/css">
<link href="css/mfw-footer.css" rel="stylesheet" type="text/css">
<!-- 统计代码 -->
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?9a4628a2c3fa798bc8282f6b539f9205";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
	function borderColor(){
		if(self['oText'].style.borderColor=='red'){
		self['oText'].style.borderColor = 'yellow';
		}else{
		self['oText'].style.borderColor = 'red';
		}
		oTime = setTimeout('borderColor()',400);
		}
</script>
<!-- 统计代码 -->
</head>
<body>
	<%@ include file="head.jsp"%>
	<!-- 滑动栏的内容 -->
	<div class="banner">
		<!--banner start-->
		<div id="container">
			<div id="list" style="left:-1424px">
				<s:a action="cdpage_loadCity" namespace="/"> <img
					src='<c:url value="/topPhotoFiles/${lastTopPhotoRealName}"/>' />
					<s:param name="cityName">${lastTopPhotoCityName}</s:param>
				</s:a>
				<s:iterator value="topPhotoList" id="topPhotoList1" status="s1">
					<s:if test="#s1.getIndex()<5">
						<s:a action="cdpage_loadCity" namespace="/"> <img
							src='<c:url value="/topPhotoFiles/${topPhotoList1.key}"/>' />
							<s:param name="cityName" value="#topPhotoList1.value">
							</s:param>
						</s:a>
					</s:if>
				</s:iterator>
				<s:a action="cdpage_loadCity" namespace="/"> <img
					src='<c:url value="/topPhotoFiles/${firstTopPhotoRealName}"/>' />
					<s:param name="cityName">${firstTopPhotoCityName }</s:param>
				</s:a>
			</div>
			<div id="buttons">
				<span index="1" class="on"></span> <span index="2"></span> <span
					index="3"></span> <span index="4"></span> <span index="5"></span>
			</div>
			    <a href="javascript:;" id="prev">&lt;</a>
   				 <a href="javascript:;" id="next">&gt;</a>
		</div>
		<!--banner end-->

		<ul class="topmenu">

			<li><i id="icon1"></i> <a class="title">本季热门推荐</a>

				<p style="position:relative;top:-35px;left:52px;line-height:20px">
					<s:iterator value="topSeasonCityList" id="topSeasonCityList1"
						status="ss">
						<s:if test="#ss.getIndex()<3">
							<s:a action="cdpage_loadCity" namespace="/" theme="simple">
								<s:param name="cityName" value="topSeasonCityList1"></s:param>
								<s:property value="topSeasonCityList1" />
							</s:a>
						</s:if>
					</s:iterator>
				</p>
				<div class="submenu">
					<div class="leftdiv">
						<dl>
							<dt>
								<a href="">本季热门推荐</a>
							</dt>
							<dd>
								<s:iterator value="topSeasonCityList" id="topSeasonCityList1">
									<s:a action="cdpage_loadCity" namespace="/" theme="simple">
										<s:param name="cityName" value="topSeasonCityList1"></s:param>
										<s:property value="topSeasonCityList1" />
									</s:a>
								</s:iterator>
							</dd>
						</dl>
					</div>

				</div></li>
			<li><i id="icon2"></i> <a class="title">主题目的地推荐</a>

				<p style="position:relative;top:-35px;left:52px;line-height:20px">
					<s:iterator value="themeTypeCityList" id="themeTypeCityList1"
						status="ss">
						<s:if test="#ss.getIndex()<2">
							<s:iterator value="#themeTypeCityList1.value"
								id="themeTypeCityList2" status="s1">
								<s:if test="#s1.getIndex()<1">
									<s:a action="cdpage_loadCity" namespace="/" theme="simple">
										<s:param name="cityName" value="themeTypeCityList2"></s:param>
										<s:property value="themeTypeCityList2" />
									</s:a>
								</s:if>
							</s:iterator>
						</s:if>
					</s:iterator>
				</p>
				<div class="submenu">
					<div class="leftdiv">
						<dl>
							<s:iterator value="themeTypeCityList" id="themeTypeCityList1">
								<dt>
									<a href=""><s:property value="#themeTypeCityList1.key" /></a>
								</dt>
								<dd>
									<s:iterator value="#themeTypeCityList1.value"
										id="themeTypeCityList2">

										<s:a action="cdpage_loadCity" namespace="/" theme="simple">
											<s:param name="cityName" value="themeTypeCityList2"></s:param>
											<s:property value="themeTypeCityList2" />
										</s:a>
									</s:iterator>
								</dd>
							</s:iterator>

						</dl>
					</div>

				</div></li>
			<li><i id="icon3"></i> <a class="title">国内目的地推荐</a>

				<p style="position:relative;top:-35px;left:52px;line-height:20px">
					<s:iterator value="topSeasonCityList" id="topSeasonCityList1"
						status="ss">
						<s:if test="#ss.getIndex()<3">
							<s:a action="cdpage_loadCity" namespace="/" theme="simple">
								<s:param name="cityName" value="topSeasonCityList1"></s:param>
								<s:property value="topSeasonCityList1" />
							</s:a>
						</s:if>
					</s:iterator>
				</p>
				<div class="submenu">
					<div class="leftdiv">
						<dl>
							<s:iterator value="areaCityList" id="areaCityList1">
								<dt>
									<a href=""> <s:property value="#areaCityList1.key" />
									</a>
								</dt>
								<dd>
									<s:iterator value="#areaCityList1.value" id="areaCityList2">
										<s:a action="cdpage_loadCity" namespace="/" theme="simple">
											<s:param name="cityName" value="areaCityList2"></s:param>
											<s:property value="areaCityList2" />
										</s:a>
									</s:iterator>
								</dd>
							</s:iterator>
					</div>

				</div></li>
			<li><i id="icon4"></i> <a class="title">热门游记推荐</a>

				<p style="position:relative;top:-35px;left:52px;line-height:20px">
					<s:iterator value="themeTypeCityList" id="themeTypeCityList1"
						status="ss">
						<s:if test="#ss.getIndex()<2">
							<s:iterator value="#themeTypeCityList1.value"
								id="themeTypeCityList2" status="s1">
								<s:if test="#s1.getIndex()<1">
									<s:a action="travelNoteSecondPage_pageIsTop" namespace="/"
										theme="simple">
										<s:param name="cityName" value="themeTypeCityList2"></s:param>
										<s:property value="themeTypeCityList2" />
									</s:a>
								</s:if>
							</s:iterator>
						</s:if>
					</s:iterator>
				</p>
				<div class="submenu">
					<div class="leftdiv">
						<dl>
							<s:iterator value="themeTypeCityList" id="themeTypeCityList1">
								<dt>
									<a> <s:property value="#themeTypeCityList1.key" />
									</a>
								</dt>
								<dd>
									<s:iterator value="#themeTypeCityList1.value"
										id="themeTypeCityList2">
										<s:a action="travelNoteSecondPage_pageIsTop" namespace="/"
											theme="simple">
											<s:param name="cityName" value="themeTypeCityList2"></s:param>
											<s:property value="themeTypeCityList2" />
										</s:a>
									</s:iterator>
								</dd>
							</s:iterator>
						</dl>
					</div>
				</div></li>
		</ul>
	</div>
	
	

<style>
.wrap_main {
	width: 100%;
	height: 200%;
	/*background-color: #F3F3F3;*/
	padding-top: 20px;
}
.banner {
	width: 100%;
	height: 400px;
}


.input_box { 
    color: #fff; 
    font-size: 1.2em; 
    width: 190px; 
    height: 30px; 
    padding: 8px 5px 0; 
    background: #616161 url(search_bg.gif) no-repeat; 
    margin-right: 5px; 
} 
</style>

	<div class="clearfix"></div>
	<div class="wrap_main">
		<!--本季推荐start-->
		<section class="layer_body season clear_fix" id="now_hot">
			<div class="box_hd">
				<i class="icon"></i>

				<h2>搜索</h2>
			</div>
		<div class="line clear_fix"></div>
		</section>	
	</div>
			<!--  	搜索框示例
			<s:form action="productPage_pageSearchTag" cssClass="search-form"
				theme="simple" enctype="multipart/form-data">
				<div class="lm-index-search">
					<s:textfield name="tag" cssClass="lm-search-text"
						placeholder="请输入标签" />
					<tr>
					<td align="center" bgColor="#f5fafe" class="ta_01">
						产品图片上传：
					</td>
					<td class="file" bgColor="#ffffff">
						<input type="file" name="file" value="" id="file" onchange="CheckPhotoType('file','产品图片','fileError')"/>
						<span style="color:#ff0000;font-weight: 900;" id="fileError"/>
					</td>
					</tr>
					<input id="tagSearchBtn" type="submit" class="lm-search-btn"
						style="position: absolute;top: 7px;left: 202px;" value="go" />
				</div>
			</s:form>
			-->
			
			
			<div>
			<form action="productPage_pageSearchTag"  enctype="multipart/form-data" align="center"> 
				
				
				<input type="text" name= "tag" id="oText" style="border:5px dotted red;color:red" onfocus="borderColor(this);" onblur="clearTimeout(oTime);" name="tag" cssClass=""
						placeholder="请输入产品关键词" />
				<br/>
				<br/>
				<br/>
				<tr>
					<td align="center" bgColor="#f5fafe" class="input_box">
						产品图片上传：
					</td>
				</tr>
				
				<tr>
					<td class="ta_01" bgColor="#ffffff">
						<input type="file" name="file" value="上传图片" id="file" onchange="CheckPhotoType('file','产品图片','fileError')"/>
					</td>
					<input id="tagSearchBtn" type="submit" class=""
						 value="go" />
				</tr>
				 
			</form> 
			</div>
		
		<!--本季推荐end-->
		<div class="clear_fix"></div>
		<!--主题目的地推荐start-->
		
		<!--主题目的地推荐end-->

		<div class="clear_fix"></div>
		
		<!--攻略下载end-->

		<!-- 国内目的地攻略下载start-->
		
		<!-- 国内目的地攻略下载end-->

		<!-- foot start-->
		</div>
		<%@ include file="foot.jsp"%>
		<!-- foot end-->
	

	



	<script type="text/javascript" src="webpage/js/slider.js"></script>
	<script type="text/javascript" src="webpage/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="webpage/js/homepage.js"></script>
	<script type="text/javascript">
	</script>
</body>
</html>