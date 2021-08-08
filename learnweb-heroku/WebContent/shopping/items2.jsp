<%@ page import="java.util.List"%>
<%@ page import="shopping.Item"%>
<%@ page import="shopping.ItemsViewModel"%>
<%@ page import="shopping.ItemSummaryView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	function selectCode(selectedCode) {
		document.getElementById('selectedCode').value = selectedCode
		document.itemSelect.submit();
	}
</script>



<style type="text/css">
body {
	padding-top: 50px;
	background-color: lightgray;
}

.jumbotron {
	background-image: url("");
	color: grey;
}

.starter-template {
	padding: 40px 80px;
	background-color: white;
}

.icon-size {
	font-size: 200%;
}

.color-talk {
	color: lightseagreen;
}

.color-wrench {
	color: steelblue;
}

.color-heart {
	color: plum;
}

table {
	width: 65%;
	border-collapse: collapse;
}

thead tr {
	border-color: #80cfcf;
}

td {
	border-bottom: 1px solid #242424;
	line-height: 1.00rem;
}
</style>
<title>2st Dev Try</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>


	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">先生のページ</span> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Project man</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#works">Works</a></li>
					<li><a href="#skills">Skills</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<jsp:include page="/WEB-INF/views/header2.jsp" />

	<div class="container">
		<div class="starter-template">
			<div class="row text-center">
				<h2 id="works">見かけによらず、粘り強い！！</h2>
				<div class="col-sm-4">
					<h2 class="color-talk">
						<span class="glyphicon glyphicon-volume-up icon-size"></span><br>はなす
					</h2>
					<p>
						コミュニケーションが好きで、<br>日本語と英語、タガログ語などが身近ですが、<br>簡単な言葉を好んで使います。
					</p>
				</div>
				<div class="col-sm-4">
					<h2 class="color-wrench">
						<span class="glyphicon glyphicon-wrench icon-size"></span><br>つくる
					</h2>
					<p>
						プロジェクトに携わるのを目標に地道に、経験を積んでいます。<br>価値のある仕事に貢献をできたらいいなと思っています。
					</p>
				</div>
				<div class="col-sm-4">
					<h2 class="color-heart">
						<span class="glyphicon glyphicon-heart icon-size"></span><br>みぬく
					</h2>
					<p>
						話の筋道や、<br>どんな人かをよく見ます。常識や偏見に惑わされないように、自分を律することを心がけます。<br>美しい会話が好きです。
					</p>
				</div>
			</div>
			<hr>
			<h2 id="works">Works</h2>
			<div class="row">
				<div class="col-sm-6">
					<h3>学習したAPPのLIST</h3>
					<p>模倣したものを、自分なりにアレンジしながら作ったアプリを動画のリストにしました。無事に動くと嬉しい気持ちになります。初歩的なものばかりですが、理解できたことや覚えたことを使ってステップアップを視覚化しています。随時、更新中。</p>
				</div>
				<div class="col-sm-6">
					<section class="features">
						<h2 title="to get hope.no matter what someone say">LIST</h2>
						<div class="container">
							<%
								ItemsViewModel vm = new ItemsViewModel();
								List<Item> items = vm.itemList();
							%>
							<form action="itemDetail" name="itemSelect" method="post">
								<table>
									<col width=15%>
									<col width=45%>
									<col width=25%>
									<col width=15%>
									<thead>
										<tr>
											<td>code</td>
											<td>name</td>
											<td></td>
										</tr>
									</thead>
									<tbody>
										<!-- Loop Start -->
										<%
											for (Item item : items) {
										%>
										<tr>
											<td><%=item.getProductCd()%></td>
											<td><%=item.getProductNm()%></td>
											<td><button type="button"
													onclick="selectCode('<%=item.getProductCd()%>')">Details</button></td>
										</tr>
										<!-- Loop End -->
										<%
											}
										%>
									</tbody>
								</table>
								<input type="hidden" name="selectedCode" id="selectedCode">
							</form>
							<a href="https://twitter.com/DevGatherWay">MyLearningRecords</a>
						</div>
					</section>

				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<h3>SpringフレームワークMaven,Gradle</h3>
					<p>業務に必要な知識、技術だと思い勉強中。</p>
				</div>
				<div class="col-sm-6">
					<img
						src=""
						class="img-responsive">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<h3>発見、向上、学習のためのSNS</h3>
					<p>ソーシャルコミュニケーションサービス（自分で開発したものではない。）を使います。使い方次第で、すごい可能性を秘めていると実感しています。学習記録としても利用しています。</p>
				</div>
				<div class="col-sm-6">
					<img
						src=""
						class="img-responsive">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<h3>Others</h3>
					<ul>
						<li>Github</li>
						<li>Twitter</li>
						<li>Line</li>
					</ul>
				</div>
			</div>
			<hr>
			<h2 id="skills">Skills</h2>
			<div class="row">
				<div class="col-sm-12">
					<h3>Programing Language</h3>
					<ul>
						<li>Java</li>
						<li>JavaScript</li>
						<li>HTML CSS</li>
					</ul>
					<h3>Database</h3>
					<ul>
						<li>MySQL</li>
						<li>H2</li>
					</ul>
				</div>
			</div>
			<a class="btn btn-primary pull-right" href="#">Topに戻る</a>
			<p></p>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	<script type="text/javascript" src="js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>