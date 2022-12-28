<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="../css/likebtn.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"> 
<!-- 본문 template.jsp 시작 -->
	<!-- 부트스트랩 -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

	$(document).ready(function (){
		checkLike();//좋아요 표시
	});

	function deleteEvent(){
		if(confirm("삭제하시겠습니까?")){
			
			location.href = 'reviewDelete.do?wNum=${detail.wNum}';
			
		};//if end
	}//deleteEvent() end
	
	//좋아요 확인
	function checkLike(){
		let wNum = ${detail.wNum};
		
		let data = {
				 wNum : wNum
		};
		
		if(wNum != null && wNum != ""){
			$.ajax({
		         type : "POST",
		         url : "/checkLike.do",
		         data : JSON.stringify(data),
		         contentType : "application/json",
		         cache : false,
		         success : function(result) {
		        	 console.log("result :", result);
		        	 
		        	 if(result){
			        	 let likeNum = result.likeNum;

			        	 if(likeNum){
			        		 
				        	 $(".button-like").addClass('liked');
				        	 $("input[name=likeNum]").val(likeNum);
				        	 
			        	 }else{
			        		 $(".button-like").removeClass('liked');
			        		 $("input[name=likeNum]").val("");
			        	 }
		        	 }else{
		        		 $(".button-like").removeClass('liked');
		        		 $("input[name=likeNum]").val("");
		        	 }
		         },
		         error : function(e) {
		            console.log(e);
		         }
		      });//ajax end 
		}
	}
	
	//좋아요
	function like(){
		console.log("좋아요!!");
		console.log("${s_id}");
		
		let liked = $(".liked");
		let liked_yn = "";
		let wNum = ${detail.wNum};
		let likeNum = $("input[name=likeNum]").val();
		
		console.log(liked);
		
		if(liked.length != 0){//좋아요가 이미 눌러진 상태
			likedYn = "Y";//좋아요인데 다시 좋아요를 눌렀으므로 해제의 의미
		}else{
			likedYn = "N";
		}
		
		let data = {
				  likedYn : likedYn
				, wNum : wNum
				, likeNum : likeNum
		};
		
 		$.ajax({
	         type : "POST",
	         url : "/like.do",
	         data : JSON.stringify(data),
	         contentType : "application/json",
	         cache : false,
	         success : function(result) {
	        	 checkLike();
	         },
	         error : function(e) {
	            console.log(e);
	         }
	      });//ajax end 

	}//like() end
	
</script>

<body>
	<div class="container mt-3">
		<div class="body">
			
			<div class="mb-3 mt-3">
				<label style='font-size:20px;'>제목</label>
				<input type="text" class="form-control" name="wTitle" value="${detail.wTitle}" style='font-size:20px;' readonly>
			</div><!--mb-3 mt-3 end -->

			<div class="mb-3 mt-3">
				<label for="comment" style='font-size:20px; padding-top:10px;'>내용</label>
				<textarea class="form-control" rows="5" id="comment" name="wText" style='font-size:20px;' readonly>${detail.wText}</textarea>
			</div><!--mb-3 mt-3 end -->
			
			<div class="mb-3 mt-3" style='text-align:center;'>
   				<video src="../storage/${detail.wPicPath}#t=0.5" width="700px" controls preload="metadata" style='padding-top:30px;'></video>
   			</div>
			

			<div class='bottom' style='padding-top:30px; padding-bottom:30px;'>
				<button type="button" class="btn btn-primary" onclick="location.href='reviewList.do'">목록</button>
				<button type="button" class="btn btn-primary" onclick="location.href='reviewUpdateForm.do?wNum=${detail.wNum}'">수정</button>
				<button type="button" class="btn btn-primary" onclick="deleteEvent();">삭제</button>
				
				<!-- 좋아요 -->
				<c:if test="${!empty s_id}">
					<button class="button button-like" onClick="like();" style='float:right;'>
		  				<i class="fa fa-heart"></i>
		 				<span>Like</span>
					</button>
				</c:if>
				<input type="hidden" name="likeNum">
			</div><!--bottom end--> 
			
		</div>
		
		
		
		
	</div><!--container end-->

	
<!-- 본문 template.jsp 끝 -->
<%@ include file="../footer.jsp"%>