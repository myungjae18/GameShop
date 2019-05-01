<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/admin/static/css/barStyle.css"/>
<style>
#chart {
	background-color: #4CAF50;
}

*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.chart-title {
	margin: 0 0 20px 0;
	padding: 0 0 5px 0;
	border-bottom: 1px solid #999;
	font-family: sans-serif;
	font-weight: normal;
	color: #333;
}

.container {
	width: 500px;
	margin: 20px;
	background: #fff;
	padding: 20px;
	overflow: hidden;
	float: left;
	border: 1px solid black;
}

/* Vertical */
.vertical .progress-bar {
	float: left;
	height: 300px;
	width: 40px;
	margin-right: 25px;
}

.vertical .progress-track {
	position: relative;
	width: 40px;
	height: 100%;
	background: #ebebeb;
}

.vertical .progress-fill {
	position: relative;
	background: #825;
	height: 50%;
	width: 40px;
	color: #fff;
	text-align: center;
	font-family: "Lato", "Verdana", sans-serif;
	font-size: 12px;
	line-height: 20px;
}

.rounded .progress-track, .rounded .progress-fill {
	box-shadow: inset 0 0 5px rgba(0, 0, 0, .2);
	border-radius: 3px;
}
</style>
<%@ include file="/admin/inc/bar.jsp" %>
<script>
	$(function() {
		vertical();
	});
	function vertical() {
		$('.vertical .progress-fill span').each(function() {
			var percent = $(this).html();
			var pTop = 100 - (percent.slice(0, percent.length - 1)) + "%";
			$(this).parent().css({
				'height' : percent,
				'top' : pTop
			});
		});
	}
</script>
</head>
<body>
	<div>
		<h2>매출 현황</h2>
	</div>
	<div class="container vertical flat">
		<h2 class="chart-title">Daily Sales</h2>
		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>10%</span>
				</div>
			</div>
		</div>
		
		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>50%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>25%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>36%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>80%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>60%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>75%</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container vertical flat">
		<h2 class="chart-title">Top 6 Sales</h2>
		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>10%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>24%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>30%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>55%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>60%</span>
				</div>
			</div>
		</div>

		<div class="progress-bar">
			<div class="progress-track">
				<div class="progress-fill">
					<span>82%</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>