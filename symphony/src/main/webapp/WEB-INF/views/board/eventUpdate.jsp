<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문 template.jsp 시작 -->

<script>
	function updateEvent(){
		
		let wTitle = $("input[name=wTitle]").val();
		let wText = $("#wText").val();
		
		console.log($("input[name=wTitle]").val());
		console.log($("#wText").val());
		
		if(confirm("수정하시겠습니까?")){
			
			location.href = 'eventUpdate.do?wNum=${update.wNum}&wTitle='+wTitle+'&wText='+wText;
			
		};//if end
	}//updateEvent() end

</script>
	
	<div class="container mt-3">
		<form class="body"  method="get">
	    	<div class="mb-3 mt-3">
	        	<label style='font-size:20px;'>제목</label>
				<input type="text" class="form-control" name="wTitle" value="${update.wTitle}" style='font-size:20px;'>
			</div><!--mb-3 mt-3 end -->
	      
			<div class="mb-3 mt-3">
				<label for="comment" style='font-size:20px; padding-top:10px;'>내용</label>
				<textarea class="form-control" rows="5" id="wText" name="wText" style='font-size:20px;'>${update.wText}</textarea>
			</div><!--mb-3 mt-3 end -->
			
			<div class='bottom' style='padding-top:30px;'>
				<button type="button" class="btn btn-primary" onclick="updateEvent();">저장</button>
				<button type="button" class="btn btn-primary" onclick="location.href='eventList.do'">취소</button>
			</div><!--bottom end--> 
	
		</form>  	  
		
	</div><!--container end-->

	
<!-- 본문 template.jsp 끝 -->
<%@ include file="../footer.jsp"%>