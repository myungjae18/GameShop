<%@page import="game.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/client/inc/style.jsp"%>
<%@ include file="/client/inc/top.jsp"%>
<%
	int game_id=Integer.parseInt(request.getParameter("game_id"));
%>
<html>
<head>
<script>
$(function(){
	getComments();
	gameInfo();
	getImage();
})
function getComments(){
	$.ajax({
		type:"get",
		url:"/rest/client/game/comment/<%=game_id%>",
		success:function(result){
			var count=0;
			var str="";
			for(var i=0;i<result.length;i++){
				var type=result[i].recommend;
				if(type==1){
					count++;
				}
				
	        	str+="<div class='co-one'>"
		        if(result[i].recommend==1){
		        str+="<img src='/images/good.png' id='co-recom-img'>";
		        }else{
		        str+="<img src='/images/bad.png' id='co-recom-img'>";
		        }
		        str+="<p>";
		        str+="<font id='co'>";
		        str+="<font id='co-name'>"+result[i].member.nick;
		        str+="</font>&nbsp";
		        if(result[i].recommend==1){
		        str+="<font id='co-recom' color='blue'>추천</font><br><br>"+result[i].review;
		        }else{
		        str+="<font id='co-recom' color='red'>비추천</font><br><br>"+result[i].review;
		        }
		        str+="<br><br>";
		        str+="<font id='co-date'>"+result[i].regdate+"</font>";
		        str+="</font>";
		        str+="</p>";
		        str+="</div>";
			}
			$("#grade").html(
				"총 "+result.length+"명 평가 (추천: "+count+"명 비추천: "+(result.length-count)+"명)"
			)
			$(".comments").append(str);
		}
	});
}

function gameInfo(){
	$.ajax({
		type:"get",
		url:"/rest/client/games/<%=game_id%>",
		success:function(result){
			$(".entry-title").html(result.game_name);
			$(".price").html(result.game_price+"원");
			$("#detail_first").html(result.game_detail);
		}
	});
}

function getImage(){
	$.ajax({	     
		url : "/rest/client/game/images",
		type : "get",
		data : {
			game_id : <%=game_id%>
		},
		success : function(result) {
			for(var i=0;i<result.length;i++){
				$("#image_"+i+" img").attr({
					'src' : '/data/game/' + result[i].img_filename
				});
				$("#image_"+i+" img").click(function(){
					var url = $(this).attr("src");
					var left = (screen.width/2)-(700/2);
					var top = (screen.height/2)-(400/2);
					window.open(url,null,
					"height=400,width=700,top="+top+", left="+left+",status=yes,toolbar=no,menubar=no,location=no");
				});
			}
		}
	});
}

function recommend(type){
	if(type=="1"){
		$("input[name='recommend']").val("1");
		$("#norec").css("background-color","#2b2b2b");
		$("#rec").css("background-color","yellow");
	}else if(type=="0"){
		$("input[name='recommend']").val("0");
		$("#norec").css("background-color","yellow");
		$("#rec").css("background-color","#2b2b2b");
	}
}

	function registComment(){
		<%if(member==null){ %>
			alert("로그인이 필요한 서비스입니다");
			return;
		<%} %>
		if($("input[name='recommend']").val()==""){
			alert("추천/비추천을 선택해주세요");	
			return;
		}else if($("textarea[name='review']").val()==""){
			alert("게임에 대한 평가를 최소 1자 이상 입력해주세요");
			return;
		}
		$("form").attr({
			action:"/client/game/comments/regist",
			method:"post"
		});
		$("form").submit();
		alert("리뷰가 등록되었습니다");
	}

	function loginCheck(type){
		<%if(member==null){%> 
			alert("로그인이 필요한 서비스입니다");
			return;
		<%}else{%>
			if(type=="cart"){
				checkCart();
			}else if(type=="pay")
				buyThis();	
		<%}%>
	}

	<%if(member!=null){%>
	function checkCart(){
		$.ajax({
			url:"/rest/client/pay/cart/game",
			type:"get",
			data:{
				"game_id":<%=game_id%>,
				"member_id":<%=member.getMember_id()%>
			},
			success:function(result){
				if(result!=""){
					alert("이미 장바구니에 추가한 게임입니다");
					return;
				}else{
					registCart(<%=game_id%>);
				}
			}
		});
	}
	<%}%>
	
	
	function registCart(game_id){
		$("form").attr({
			action:"/client/pay/cart/regist",
			method:"post"
		});
		$("form").submit();
		alert("장바구니에 상품이 등록되었습니다");
	}

	function buyThis(){
		alert("나구매버튼");
	}
</script>
</head>
<form id="cart-data" style="display:none">
	<%if(member!=null){ %>
	<input type="hidden" name="member_id" value="<%=member.getMember_id()%>" />
	<%} %>
	<input type="hidden" name="game_id" value="<%=game_id%>"/>
</form>
<body bgcolor="#2b2b2b">
	<div id="site-content" style="background-color:#2b2b2b">
		<!-- Top -->
		<main class="main-content">
		<div class="container">
			<div class="page">
				<div class="entry-content">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<div class="product-images">
								<!-- 이미지들 -->
								<figure class="large-image">
									<a href="#" id="image_0"><img></a>
								</figure>
								<div class="thumbnails">
									<a href="#" id="image_1"><img></a> <a href="#"
										id="image_2"><img></a> <a href="#" id="image_3"><img></a>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-8">
							<div>
								<h2 class="entry-title"></h2>
								<small class="price"></small>
								<!-- p 태그는 게임설명..  -->
								<p id="detail_first"></p>
							</div>
							<h3 style="color: white" id="grade"></h3>
							<!-- <div class="addtocart-bar" style="width: 30%"> -->
							<form>
								<input type="button" value="장바구니에 추가" onclick="loginCheck('cart')">&nbsp&nbsp
								<input type="button" value="구매하기" onclick="loginCheck('pay')" style="background-color: orange">
							</form>
							<!-- </div> -->
						</div>
					</div>
					<br>
					<hr>
					<br>
					<form>
						<div>
							<%if(member!=null){ %>
							<input type="hidden" name="member_id"
								value="<%=member.getMember_id()%>" /> <input type="hidden"
								name="game_id" value="<%=game_id %>" />
							<h1 id="my_nick" style="color: white"><%=member.getNick() %></h1>
							<%}else{ %>
							<h1 id="need-login" style="color: orange">로그인을 해주세요.</h1>
							<%} %>
							<h2 id="recommendType">
								<input type="hidden" name="recommend" /> <a style="color: blue"
									id="rec" onclick="recommend(1)"><b>추천</b></a> / <a
									style="color: red" id="norec" onclick="recommend(0)"><b>비추천</b></a>
							</h2>
							<textarea placeholder="댓글 입력...." name="review"
								style="background-color: white"></textarea>
							<br> <br> <input type="button" value="댓글 등록"
								id="registCom" onclick="registComment()" />
						</div>
					</form>
					<hr>	
					<div class="comments">
					</div>
				</div>
			</div>
		</div>
		<!-- .container --> </main>
		<!-- .main-content -->
		<!-- bottom -->
	</div>
</body>
</html>