<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문 template.jsp 시작 -->


<script>
	function deleteEvent(){
		if(confirm("삭제하시겠습니까?")){
			
			location.href = 'eventDelete.do?wNum=${detail.wNum}';
			
		};//if end
	}//deleteEvent() end

</script>

<body>
	<div class="container mt-3">
		<form class="body"  method="get" action="noticeCreate.do">
			
			<div class="mb-3 mt-3">
				<label style='font-size:20px;'>제목</label>
				<input type="text" class="form-control" name="wTitle" value="${detail.wTitle }" style='font-size:20px;' readonly>
			</div><!--mb-3 mt-3 end -->

			<div class="mb-3 mt-3">
				<label for="comment" style='font-size:20px; padding-top:10px;'>내용</label>
				<textarea class="form-control" rows="5" id="comment" name="wText" style='font-size:20px;' readonly>${detail.wText}</textarea>
			</div><!--mb-3 mt-3 end -->

			<div class='bottom' style='padding-top:30px;'>
				<button type="button" class="btn btn-primary" onclick="location.href='eventList.do'">목록</button>
				<button type="button" class="btn btn-primary" onclick="location.href='eventUpdateForm.do?wNum=${detail.wNum}'">수정</button>
				<button type="button" class="btn btn-primary" onclick="deleteEvent();">삭제</button>
			</div><!--bottom end--> 
			
		</form>
		
		
		
	</div><!--container end-->

	
<!-- 본문 template.jsp 끝 -->
<%@ include file="../footer.jsp"%>