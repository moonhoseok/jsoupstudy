<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
    
<%-- /jsoupstudy/src/main/webapp/exam2.jsp
	url : https://doosanbears.com/players/batters
	1. 허경민 타자 사진 가져오기
	=============================
	2. 모든 타자들을 한줄에 4명씩 출력
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String url = "https://doosanbears.com/players/batters";
	Elements div = null;
	try{
		Document doc = Jsoup.connect(url).get();
		div = doc.select(".playerlist a");
		//한줄에 4명씩 선수 출력하기 
		out.println("<table>");
		for(int i=0;i<div.size();i++){
		if(i%4==0)out.println("<tr>");
		out.println("<td>"+div.get(i).html()+"</td>");
		if(i%4==3)out.println("</tr>");
		}
		out.println("</table>");
	}catch(IOException e){
		e.printStackTrace();
	}
%>
<%= div.get(0).html() %>
</body>
</html>