<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="game.model.domain.Member"%>
<%@ include file="/client/inc/style.jsp"%>
<%!Member member; %>
<!DOCTYPE html>
<html>
<head>
<script>
$(function(){
	<%if(session.getAttribute("member")==null){%>
		alert("로그인이 필요한 서비스입니다.");
		location.href="/client/login/index.jsp";
	<%
		}else{
		member=(Member)session.getAttribute("member");
	%>
		getMember(<%=member%>);
	<%}%>
})
function getMember(<%=member%>){
	<%
		out.print(member.getId());
		out.print(member.getPass());
		out.print(member.getName());
		out.print(member.getEmail());
	%>
}
</script>
</head>
<body>
</body>
</html>