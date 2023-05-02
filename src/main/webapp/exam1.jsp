<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- /jsoupstudy/src/main/webapp/exam1.jsp
	수출입은행 환율정보 중 EUR, JPY(100), CNH, USD 통화만 jsoup2.jsp 형태로 출력하기 
	http://www.java2s.com/Code/Jar/j/Downloadjsonsimple111jar.htm#google_vignette
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, td, th{ border: 2px solid grey;}
	table{border-collapse: collapse;}
</style>
</head>
<body>
<%
	String url = "https://www.koreaexim.go.kr/wg/HPHKWG057M01";
	String line = "";
	Document doc = null;
	List<List<String>> trlist = new ArrayList<List<String>>();
	List<String> title = Arrays.asList("전신환받으실때","전신환보내실떄",
			"매매기준율","장부가격","중개매매기준율","중개장부가격");
	try{
		doc = Jsoup.connect(url).get();
		Elements trs = doc.select("tr"); // tr 태그들
		for(Element tr : trs){
			// List : 순서유지. 
			// tdlist : 한개의 통화에 대한 환율정보
			List<String> tdlist = new ArrayList<String>();
			Elements tds = tr.select("td"); // tr태그의 하위 td태그들
			for(Element td : tds){
				tdlist.add(td.html()); // td의 값들
			}
			//trlist.add(tdlist);
			if(tdlist.size() > 0){
				if(tdlist.get(0).equals("EUR")||tdlist.get(0).equals("JPY(100)")||
					tdlist.get(0).equals("CNH")||tdlist.get(0).equals("USD")){
						trlist.add(tdlist);
				}
			}
		}
	}catch(IOException e){
		e.printStackTrace();
	}
	pageContext.setAttribute("trlist", trlist); // EL에서 사용하기위한 속성등록
	pageContext.setAttribute("title", title);	// EL에서 사용하기위한 속성등록
%>
<table>
	<c:forEach items="${trlist}" var="tdlist">
		<c:forEach items="${tdlist }" var="td" varStatus="stat">
			<c:choose>
				<c:when test="${stat.index % 8==0 }">
					<tr><td rowspan="6">${td}</td>
				</c:when>
				<c:when test="${stat.index % 8==1 }">
					<td rowspan="6">${td}</td>
				</c:when>
				<c:when test="${stat.index % 8==2 }">
					<td>${title[0]}</td> <td>${td}</td></tr>
				</c:when>
				<c:otherwise>
					<tr><td>${title[stat.index-2]}</td><td>${td}</td></tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:forEach>
</table>

</body>
</html>