<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<!-- 본문 template.jsp 시작 -->

	<div class="container mt-3">
	
		<form class="body" method="post" action="reviewCreate.do" enctype="multipart/form-data">
		
			
			<div class="mb-3 mt-3">
				<label style='font-size:20px;'>제목</label>
        		<input type="text" class="form-control" name="wTitle" placeholder="제목을 작성해주세요" style='font-size:20px;'>
			</div><!--mb-3 mt-3 end -->

			<div class="mb-3 mt-3">
				<label style='font-size:20px; padding-top:10px;'>내용</label>
				<textarea class="form-control" rows="5" id="comment" name="wText" placeholder="내용을 작성해주세요" style='font-size:20px;'></textarea>
			</div><!--mb-3 mt-3 end -->
      
			
		    
		    <div class="custom-file mb-3">
		    	<label style='font-size:20px; padding-top:10px;'>첨부파일</label>
		     	<input type="file" class="custom-file-input" id="customFile" name=filenameMF>
		    </div>
		  	

			<div class='bottom' style='padding-top:30px;'>
				<button type="button" class="btn btn-primary" onclick="location.href='reviewList.do'">목록</button>
				<input type="submit" value="저장" class="btn btn-primary">
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