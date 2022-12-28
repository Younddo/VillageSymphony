<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ssi.jsp 공통코드 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.symphony.review.*"%>
<%@ page import="kr.co.symphony.notice.*"%>
<%@ page import="kr.co.symphony.event.*"%>
<%@ page import="net.utility.*"%>

<jsp:useBean id="dao" class="kr.co.symphony.review.ReviewDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="kr.co.symphony.review.ReviewDTO" scope="page"></jsp:useBean>

<jsp:useBean id="dao1" class="kr.co.symphony.notice.NoticeDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto1" class="kr.co.symphony.notice.NoticeDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dao2" class="kr.co.symphony.event.EventDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto2" class="kr.co.symphony.event.EventDTO" scope="page"></jsp:useBean>


<%request.setCharacterEncoding("UTF-8");%>

<%
	// 검색
	String word=request.getParameter("word"); // 검색어
	String col=request.getParameter("col"); // 검색 칼럼
	word=Utility.checkNull(word); // 문자열값이 null이면 빈문자열로 치환
	col=Utility.checkNull(col);
	
	// 현재페이지 --------------------------------------------------------------------
		int nowPage=1;
		if(request.getParameter("nowPage") != null) {
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
		}
	
%>


<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/list.css">

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  
<link rel="stylesheet" href="../css/create.css">


