<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" href="../css/cart.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>

<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<script>

	$(document).ready(function(){
		$("#size").val(${list.size()});	//장바구니에 담긴 배열의 사이즈를 확인해서 수량을 넣어준다.
		
		var IMP = window.IMP; // 생략가능
		IMP.init('imp40926726'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
	});

	//장바구니 item 삭제
	function deleteCart(item){
		let id = item;
		let size = $("#size").val();//수량
		size = size - 1 ;//빼기 1
		let price = ${list[0].price};
		let total = ${list[0].price} * size;//-1된 수량으로 전체금액 다시 계산

		$("#"+id).remove();//한 줄 삭제
		$("#size").val(size);//수량
		$("#sizeDiv").text(size + "시간");
		$("#sizeDiv").text(size + "시간");
		$("#total").text(total + "원");

	};
	
	//결제
	function submit(){
		let s_id = "${s_id}";
		console.log(s_id);
		if(s_id != null && s_id != ""){
			if(confirm("결제하시겠습니까?")){
				 IMP.request_pay({
				    pg : 'kakao', // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '${list[0].c_title}',
				    amount : 100,
				    buyer_email : 'fka34@naver.com',
				    buyer_name : '김가람',
				    buyer_tel : '010-1234-5678',
				    buyer_addr : '서울특별시 강남구',
				    buyer_postcode : '123-456',
				    m_redirect_url : '/paySuccess'
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        $("#paySubmit").submit();
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				}); 

			}
		}else{
			alert("로그인 해주세요.");
			location.href = "home.do";
		}
	}
	
</script>

<div class="container cart-title"><h1>장바구니</h1></div>

<div class="container cart-container">
	<form id="paySubmit" action="pay.do" method="POST">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>강의제목</th>
					<th>강사</th>
					<th>가격</th>
					<th>선택한 날짜</th>
					<th>선택한 시간</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr id="${dto.c_date}_${dto.c_time}">
					<!-- arrayList로 넘기기 위해 name -->
					<td>${dto.c_title}<input type="hidden" name="dtos[${status.index}].c_title" value="${dto.c_title}"></td>
					<td>${dto.name}<input type="hidden" name="dtos[${status.index}].name" value="${dto.name}"></td>
					<td>${dto.price}<input type="hidden" name="dtos[${status.index}].price" value="${dto.price}"></td>
					<td>${dto.c_date}<input type="hidden" name="dtos[${status.index}].c_date" value="${dto.c_date}"></td>
					<td>
						${dto.c_time}
						<input type="hidden" name="dtos[${status.index}].c_time" value="${dto.c_time}">
						<input type="hidden" name="dtos[${status.index}].c_id" value="${dto.c_id}">
					</td>
					<td><button type="button" onClick="deleteCart('${dto.c_date}_${dto.c_time}');">삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</form>
</div>

<div class="content_total_section container">
	<div class="total_wrap">
		<table class="ttable">
			<tr>
				<td>
					<table class="ttable">
						<tr>
							<td>1시간 당 가격</td>
							<td><span class="totalPrice_span">${list[0].price}</span> 원</td>
						</tr>
						<tr>
							<td>총 주문 시간</td>
							<td>
								<div id="sizeDiv">${list.size()} 시간</div>
								<input type="hidden" id="size">
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table class="ttable">
						<tr>
							<td></td>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<div class="boundary_div">구분선</div>
		<table class="ttable">
			<tr>
				<td>
					<table class="ttable">
						<tbody>
							<tr>
								<td><strong>총 결제 예상 금액</strong></td>
								<td>
									<div id="total">${list[0].price*list.size()} 원</div>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td></td>
			</tr>
		</table>
	</div>
</div>

<!-- 구매 버튼 영역 -->
<div class="content_btn_section container">
	<a href="#" onClick="submit();" style="color: inherit; text-decoration: none;">주문하기</a>
</div>

<%@ include file="../footer.jsp"%>