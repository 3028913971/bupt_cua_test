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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-transform">
<title>中联航旅游攻略产品推荐</title>
<meta name="keywords" content="联航旅游，为您而省，联合航空">
<meta name="description" content="联航为您提供优质服务">

<script src="webpage/js/common.js"></script>
<script src="webpage/js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="webpage/mainpage/chanpin/css/main.css">
<!-- 百度统计代码 -->
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?9a4628a2c3fa798bc8282f6b539f9205";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
<!-- 百度统计代码 -->
</head>

<body>
	<%@ include file="../../head.jsp"%>
	<div class="qyWrap">
		<!-- 条件区域 -->
	<%-- 	<div class="lm-condition-wrap head-condition">
			<div class="condition-line clearfix" style="" data-lmtype="cfd">
				<div class="condition-title">主题类型</div>
				<div class="condition-wrap clearfix">
					<s:iterator value="themeTypeList" id="themeTypeList1">
						<div class="condition-list-wrap">
							<img class="theme-icon"
								src='<c:url value="/themeFiles/${themeTypeList1.key.themeRealName}"/>' />
							<div class="condition-all active">
								<a href="javascript:void(0);" class="condition-all-link"
									data-bn-ipg="from-0"><s:property
										value="#themeTypeList1.key.themeName" /></a>
							</div>
							<ul class="condition-list clearfix">
								<s:iterator value="#themeTypeList1.value" id="themeTypeList2">
									<li class="condition-list-cell "><s:a
											action="productCityPage_pageIsTop" namespace="/"
											theme="simple" cssClass="condition-btn-link">
											<s:param name="cityName" value="themeTypeList2" />
											<s:property value="themeTypeList2" />
										</s:a></li>
								</s:iterator>
							</ul>
						</div>
					</s:iterator>

				</div>
			</div>
			<div class="condition-line clearfix" style="" data-lmtype="cfd">
				<div class="condition-title">国内</div>
				<div class="condition-wrap clearfix">
					<s:iterator value="homeTDList" id="homeTDList1">
						<div class="condition-list-wrap">
							<div class="condition-all active">
								<a href="javascript:void(0);" class="condition-all-link"
									style="font-size:11pt"><s:property value="#homeTDList1.key" /></a>
							</div>
							<ul class="condition-list clearfix">
								<s:iterator value="#homeTDList1.value" id="homeTDList2">
									<li class="condition-list-cell "><s:a
											action="productCityPage_pageIsTop" namespace="/"
											theme="simple" cssClass="condition-btn-link">
											<s:param name="cityName" value="homeTDList2" />
											<s:property value="homeTDList2" />
										</s:a></li>
								</s:iterator>
							</ul>
						</div>
					</s:iterator>

				</div>
			</div>
		</div>
 --%>
		<div class="lm-index-sort-wrap clearfix">
			<ul class="lmsifts qyer-sort">
				<li class="hot_icon"></li>
				<li class="active" style="border-right: 1px solid gray"><s:a
						action="productPage_pageSearchIsTop1" namespace="/" theme="simple">
            	热门推荐
            	<s:param name="search" value="search"></s:param>
					</s:a></li>
				<li id="sort_price" class="icon-up"><s:a
						action="productPage_pageSearchPrice1" namespace="/" theme="simple">
            		价格排序
            		<s:param name="search" value="search"></s:param>
					</s:a></li>

			</ul>
			<div class="line"></div>
			<s:form action="productPage_pageSearchIsTop" cssClass="search-form"
				theme="simple">
				<div class="lm-index-search">
					<s:textfield name="search" label="目的地/产品" cssClass="lm-search-text"
						placeholder="请输入产品关键字" />
					<input id="zkSearchBtn" type="submit" class="lm-search-btn"
						value="go">
				</div>
			</s:form>
			<s:form action="productPage_pageSearchTag" cssClass="search-form"
				theme="simple">
				<div class="lm-index-search">
					<s:textfield name="tag" cssClass="lm-search-text"
						placeholder="请输入标签" />
					<input id="tagSearchBtn" type="submit" class="lm-search-btn"
						style="position: absolute;top: 7px;left: 202px;" value="go" />
				</div>
				
			</s:form>
		</div>
		<!-- 排行区域 -->

		<!-- 列表区 -->

		<ul class="lm-index-product-list mt10 clearfix">
			<s:iterator value="isTopSearchProductList">
				<li><s:a action="productDescription_loadProduct" namespace="/"
						theme="simple">
						<s:param name="productId" value="productId" />
						<div class="list-surface">城市玩乐 | ${cityName }</div>
						<div class="list-tuwen">
							<img src='<c:url value="/productFiles/${productRealName}"/>'
								data-original="http://pic.qyer.com/public/supplier/lastminute/2015/07/29/14381504497218/339x226"
								class="list-photo" style="display: inline;">

							<div class="list-buymask">
								<p class="list-buybtn">
									<span class="buy-btn-text">立即抢购</span><i class="buy-btn-ico"></i>
								</p>
							</div>
							<div class="list-wenzi-wrap">
								<h4 title="【9月3日秒杀】台北桃园/松山机场至台北市区包车单程接/送机服务">
									<s:property value="productName" />
								</h4>

								<div class="wenzi-cell clearfix">
									<div class="wenzi-cell-time">
										<p class="cell-traveltime">旅行时间</p>

										<p class="cell-travelmonth">
											<s:property value="startDate" />
											~
											<s:property value="endDate" />
										</p>
									</div>
									<p class="wenzi-cell-price">
										<em><s:property value="productPrice" /></em>元起
									</p>
								</div>
								<div class="hidden-cell"></div>
							</div>
						</div>
					</s:a></li>
			</s:iterator>

		</ul>
		<div class="list-pages">
			<div class="ui_page">
				<s:url action="productPage_pageSearchTag1" namespace="/"
					id="firstPage">
					<s:param name="pageNum">1</s:param>
					<s:param name="tag">tag</s:param>
				</s:url>
				<s:a href="%{firstPage}"
					cssClass="ui_page_item ui_page_item_current">首页</s:a>
				<s:url action="productPage_pageSearchTag1" namespace="/"
					id="prePage">
					<s:param name="pageNum">
						<s:property value="pageNum-1" />
					</s:param>
					<s:param name="tag">tag</s:param>
				</s:url>
				<s:a href="%{prePage}" cssClass="ui_page_item">上一页</s:a>
				<s:property value="pageNum" />
				/
				<s:property value="totalpage" />
				<s:url action="productPage_pageSearchTag1" namespace="/"
					id="nextPage">
					<s:param name="pageNum">
						<s:property value="pageNum+1" />
					</s:param>
					<s:param name="tag">tag</s:param>
				</s:url>
				<s:a href="%{nextPage}" cssClass="ui_page_item">下一页</s:a>
				<s:url action="productPage_pageSearchTag1" namespace="/"
					id="lastPage">
					<s:param name="pageNum">
						<s:property value="totalpage" />
					</s:param>
					<s:param name="tag">tag</s:param>
				</s:url>
				<s:a href="%{lastPage}" cssClass="ui_page_item ui_page_item_current">末页</s:a>
			</div>
		</div>


	</div>

	<%@ include file="../../foot.jsp"%>
	<script type="text/javascript">
		$(function() {
			$("nav").find("li").eq(2).addClass("nav_active");
			var theme_json = [ {
				name : "看海",
				position : "1px 49px",
				size : "470% 239%"
			}, {
				name : "避暑",
				position : "-41px 49px",
				size : "470% 239%"
			}, {
				name : "亲子",
				position : "-93px 49px",
				size : "470% 239%"
			}, {
				name : "登山",
				position : "-41px 49px",
				size : "470% 239%"
			}, {
				name : "蜜月",
				position : "-144px 49px",
				size : "470% 239%"
			} ];
			var class_name = "condition-all-link";
			iconSet(theme_json, class_name);
		})
	</script>

</body>
</html>
