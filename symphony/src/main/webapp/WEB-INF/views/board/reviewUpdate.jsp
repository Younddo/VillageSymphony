<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문 template.jsp 시작 -->

<script>

	function updateReview(){
		if(confirm("수정하시겠습니까?")){
			
			$("#form").submit();
			
		};//if end
	}//updateReview() end

</script>

<body>
	<div class="container mt-3">
		<form id="form" class="body"  method="post" action="reviewUpdate.do" enctype="multipart/form-data">
			<input type="hidden" name="wNum" value="${update.wNum}" >
			<div class="mb-3 mt-3">
				<label style='font-size:20px;'>제목</label>
				<input type="text" class="form-control" name="wTitle" value="${update.wTitle}" style='font-size:20px;'>
			</div><!--mb-3 mt-3 end -->

			<div class="mb-3 mt-3">
				<label for="comment" style='font-size:20px; padding-top:10px;'>내용</label>
				<textarea class="form-control" rows="5" id="wText" name="wText" style='font-size:20px;'>${update.wText}</textarea>
			</div><!--mb-3 mt-3 end -->
			
			<div class="custom-file mb-3">
				<label style='font-size:20px; padding-top:10px;'>첨부파일</label>
		      	<input type="file" class="custom-file-input" id="customFile" name=filenameMF ">
		      	
		    </div>
			
			<div class="mb-3 mt-3">
				<label style='font-size:20px; padding-top:20px;'>등록된 파일</label>
				<input type="text" class="form-control" name="wPic" value="${update.wPic}" style='font-size:20px;' readonly>
				<input type="hidden" class="form-control" name="wPicPath" value="${update.wPicPath}" >
			</div><!--mb-3 mt-3 end -->

			<div class='bottom' style='padding-top:30px;'>
				<button type="button" class="btn btn-primary" onclick="location.href='reviewList.do'">목록</button>
				<button type="button" class="btn btn-primary" onclick="updateReview();">저장</button>
				<button type="button" class="btn btn-primary" onclick="location.href='reviewList.do'">취소</button>
			</div><!--bottom end--> 
			
		</form>

	</div><!--container end-->


<script>
	// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on("change", function() {
		
		 var filenameMF = $(this).val().split("\\").pop();
		 $(this).siblings(".custom-file-label").addClass("selected").html(filenameMF);
	 
	});
</script>

	
<!-- 본문 template.jsp 끝 -->
<%@ include file="../footer.jsp"%>