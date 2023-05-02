<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- /jsoupstudy/src/main/webapp/jsoup1.jsp
	1. https://mvnrepository.com/artifact/org.jsoup/jsoup/1.15.4
	=> jsoup-1.15.3.jar 파일 다운받기
	2. jsoupstudy Dynamic Web Project 생성
	3. 2개의 jar 파일 /jsoupstudy/src/main/webapp/WEB-INF/lib 폴더에 폭사
	=> jsoup-1.15.4.jar , jstl-1.2.jar
	4. https://www.koreaexim.go.kr/wg/HPHKWG057M01 => 한국수출입은행 사이트
	5. jsoup1.jsp 현재페이지 코딩
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수출입은행 환율정보 조회</title>
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
	try{
		doc = Jsoup.connect(url).get(); // url을 접속하여 문서를 지정
		Elements e1 = doc.select("table"); // doc에서 teble 태그들 선택
		for(Element ele : e1){	// table 태그를 한개씩 조회
			String temp = ele.html();	// table태그 하위의 태그들을 문자열로 리턴
			System.out.println("============");
			System.out.println(temp);
			line += temp;
		}
	}catch(IOException e){
		e.printStackTrace();
	}
%>
<table><%= line %></table>
</body>
</html>






