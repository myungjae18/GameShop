<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/client/inc/top.jsp"%>
<%@ include file="/client/inc/style.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script>
$(function(){
	<%if(session.getAttribute("member")==null){%>
		alert("로그인이 필요한 서비스입니다.");
		location.href="/client/login/index.jsp";
	<%}	%>
	<%if(request.getParameter("game_id")==null){%>
		alert("비정상적인 접근입니다");
	<%}else{%>
		order(<%=request.getParameter("game_id")%>);
	<%}%>
})
function order(game_id){
	alert(game_id);
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="payment">
<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="/action_page.php">
      
        <div class="row">
          <div class="col-50">
            <h3>카드 청구서 주소</h3>
            <label for="fname"><i class="fa fa-user"></i> 이름</label>
            <input type="text" id="fname" name="firstname" placeholder="John M. Doe">
            <label for="email"><i class="fa fa-envelope"></i> 이메일</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> 주소</label>
            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i>상세주소</label>
            <input type="text" id="city" name="city" placeholder="New York">
            <label for="city"><i class="fa fa-institution"></i>우편번호</label>
            <input type="text" id="city" name="city" placeholder="13943">
          </div>

          <div class="col-50">
            <h3>결제</h3>
            <label for="fname">승인된 카드</label>
            <div class="icon-container">
				<img src="/images/cards.PNG" width="200px">
            </div>
            <label for="cname">카드 이름</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">신용카드 번호</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">만기 월</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">만기 년</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </label>
        <input type="submit" value="Continue to checkout" class="btn">
      </form>
    </div>
  </div>
  
</div>
</div>

</body>
</html>