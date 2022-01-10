<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
</head>
<style>
	footer{
		position: relative;
		height: 100px;
		padding: 100px 15vw;
		margin: 0 auto;
		margin-top: 100px;
		font-family: '나눔스퀘어B';
		font-weight: bold;
    	border-top: 1px rgba(100, 100, 100, 0.2) solid;
	}
	.footer-contain{
		float: left;
	}
	.footer-icon-box{
		float: right;
	}
	.footer-icon-box > *{
		cursor: pointer;
	    font-size: 30px;
	    margin-left: 5px;
	    
		vertical-align: bottom;
		height: 30px;
	}
	.fa-instagram {
	    background: #d6249f;
	    background: radial-gradient(circle at 30% 107%, #fdf497 0%, #fdf497 5%, #fd5949 45%,#d6249f 60%,#285AEB 90%);
	    -webkit-background-clip: text;
	    -webkit-text-fill-color: transparent;
	}

	.fa-facebook-square {
		color: #3b5998;
		background-image: linear-gradient( to bottom, transparent 20%, white 20%, white 93%, transparent 93% );
		background-size: 55%;
		background-position: 70% 0;
		background-repeat: no-repeat;
	}
	
	.fa-twitter, .fa-twitter-square {
	    color: #00aced
	}
	.kakaotalk-icon{
		height: 30px;
		max-height: 30px;
		border-radius: 10px;
	}
</style>
</head>
<body>
	<footer>
		<div class='footer-contain'>&copy; MoaMoa Corporation</div>
		<div class='footer-icon-box'>
			<i class="fa fa-instagram"></i>
			<i class="fa fa-facebook-square"></i>
			<i class="fa fa-twitter-square"></i>
			<img class="kakaotalk-icon" src="/CMoaMoa/image/kakaotalk.png">
		</div>
	</footer>
</body>
</html>