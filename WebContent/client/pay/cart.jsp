<%@page import="game.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/client/inc/top.jsp"%>
<%@ include file="/client/inc/style.jsp"%>
<%!
	Member member;
	int member_id;
	int game_id;
%>
<html>
<head>
<script>
$(function(){
	<%if(session.getAttribute("member")==null){%>
		alert("로그인이 필요한 서비스입니다.");
		location.href="/client/login/index.jsp";
		return;
	<%
		}else{
			member_id=member.getMember_id();
		}
	%>
	getCart();
})
function getCart(){
	$.ajax({
		url:"/rest/client/pay/cart/<%=member_id %>",
		type:"get",
		success:function(result){
			if(result.length==0){
				alert("장바구니에 상품이 없습니다.");
				history.back();
			}else{
				for(var i=0;i<result.length;i++){
					var obj=result[i].game;
					var str="";
					str+="<tr>";
					str+="<td class='product-img'>";
					str+="<div class='product-thumbnail'>";
					str+="<img name='cart-img"+obj.game_id+"'>";
					str+="</div>";
					str+="<div class='product-detail'>";
					str+="<td class='product-name'><h3 class='product-title'>"+obj.game_name+"</h3></td>";
					str+="</div>";
					str+="</td>";
					str+="<td class='product-price'>"+obj.game_price+"원</td>";
					//이벤트 세일 가져오기
					str+="<td class='product-qty'>-"+obj.game_sale+"%</td>";
					str+="<td class='product-total'>"+obj.game_price*(100-obj.game_sale)*0.01+"원</td>";
					str+="<td class='product-total' style='text-align:center'>";
					str+="<input type='checkBox'/>";
					str+="</td>";
					str+="</tr>";
					
					getCartImg(obj.game_id);
					$("tbody").append(str);
				}
			}
		}
	});
}

function getCartImg(game_id){
	$.ajax({
		url:"/rest/client/pay/cart/image",
		type:"get",
		data:{
			"game_id":game_id
		},
		success:function(result){
			$("img[name='cart-img"+game_id+"']").attr({
				src:"/data/game/"+result[0].img_filename,
				width:"200px"
			});
		}
	});
}
</script> 
</head>
<body>
	<div id="site-content">
		<!-- Top -->
		<main class="main-content">
		<div class="container">
			<div class="page">
				<table class="cart">
					<thead>
						<tr>
							<th class="product-img">Game Img</th>
							<th class="product-name">Game Name</th>
							<th class="product-price">Price</th>
							<th class="product-qty">Sale</th>
							<th class="product-total">Total</th>
							<th class="product-total">Select</th>							
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<!-- .cart -->
				<div class="cart-total">
					<p>
						<strong>할인 전 금액</strong>59000원
					</p>
					<p class="total">
						<strong>결제 금액</strong><span class="num">39000원</span>
					</p>
					<p>
						<input type="hidden" id="game_id"/>
						<a href="/client/game/products.jsp" class="button muted">쇼핑 계속하기</a>
						<a href="/client/pay/pay.jsp" class="button">결제하기</a>
					</p>
				</div>
				<!-- .cart-total -->
			</div>
		</div>
		<!-- .container --> </main>
		<!-- .main-content -->
	</div>
	<div class="overlay"></div>
</body>
</html>