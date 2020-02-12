<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w4.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
	<base target="_parent">
    <title>RegGenerator</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">

	<style>
		*{
			background: #fff;
			font-family: 'Roboto', sans-serif;
			font-size: 16px;
		}
		.wrapper{
			max-width: 800px;
			margin: 0 auto;
		}
		.main-heading{
			font-size: 20px;
			color: #212121;
			margin-bottom: 0px;
			padding: 20px;
		}
		.margin-top-5{
			margin-top: 5px;
		}
		.nav-heading{
			display: block;
			width: 100%;
			background: transparent;
			color: #fff;
			text-align: center;
			font-size: 30px;
		}
		.reg-nav{
			margin-bottom: 20px;
			/* change nav bg color */
			background: #212121;
			height:100px;
		}
		.pt-50{
			padding-top: 2px;
		}
		.reg-nav-footer{
			margin-top: 20px;
			/* change footer bg color */
			background: #212121;
			/* position:absolute; */
			bottom:0;
			width:100%;
			height:90px;
		}
		.footer-heading{
			display: block;
			width: 100%;
			background: transparent;
			color: #fff;
			text-align: center;
			font-size: 16px;
		}
	</style>
</head>
<body>
	<div class="wrapper-body">
		<nav class="navbar navbar-expand-sm reg-nav">
			<div class="nav-heading">
				RegGenerator
			</div>
		</nav>
		<div class="container">
			<div class="wrapper">
				<div class="row">
					<div class="col-sm-12 col-md-12 col-lg-12">
						<form method="post" action="generateRegex">
							<div class="row">
								<div class="col-sm-12 col-md-12 col-lg-12">
									<div class="form-group" style="margin-top:15px">
										<label for="string" class="sr-only">Enter the String</label>
										<input name="string" type="text" class="form-control" id="string"  placeholder=" Enter String here..." required/>
									</div>
								</div>
								<div class="col-sm-12 col-md-12 col-lg-12">
									<button type="submit" class="btn btn-success" name="regex"  value="regex">Generate Regex</button>
									<!--<button type="submit" class="btn btn-primary" name="normal_regex" value="myra_regex">Myra Regex</button>-->
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="row">

					<!--<div class="col-sm-12 col-md-12 col-lg-12">-->
					<!--<div class="heading text-center">-->
					<!--<div class="inline-block">Original String:</div>-->
					<!--<span>{{ originalString }}</span>-->
					<!--</div>-->
					<!--</div>-->
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div class="heading text-center">
							<h3 class="main-heading margin-top-5 margin-bottom-10">Original String</h3>
						</div>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12">
						<textarea style="width: 100%;" rows="3" cols="50" readonly id="textarea_string">${orginalString}</textarea>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12 pt-50">
						<button type="button" class="btn btn-primary" onclick="copyString()">Copy To Clipboard</button>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div class="heading text-center">
							<h3 class="main-heading margin-top-5 margin-bottom-10">Normal Regex</h3>
						</div>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12">
						<textarea style="width: 100%;" rows="3" cols="50" readonly id="textarea_normal">${regexString}</textarea>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12 pt-50">
						<button type="button" class="btn btn-primary" onclick="copyNormal()">Copy To Clipboard</button>
						<button type="button" class="btn btn-info"><a href="https://regexr.com/" target="_blank" style="color: #fff;text-decoration:none">Validate On Regxr</a></button>
						<button type="button" class="btn btn-warning" onclick="validate()" hidden>Validate Here</button>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12">
						<div class="heading text-center">
							<h3 class="main-heading margin-top-5 margin-bottom-10">Myra Regex</h3>
						</div>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12">
						<textarea style="width: 100%;" rows="3" cols="50" readonly id="textarea_regex">${myraRegex}</textarea>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12 pt-50">
						<button type="button" class="btn btn-primary" style="margin-top:0px" onclick="copyMyra()">Copy To Clipboard</button>
					</div>
					<div class="col-sm-12 col-md-12 col-lg-12" id="insertIFrame" style="padding-top:20px">

					</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-sm reg-nav-footer">
			<div class="footer-heading">
				Team Crawler Support
			</div>
		</nav>
	</div>
</body>
</html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	function copyMyra() {
	if (!$.trim($("#textarea_regex").val())) {
alert("Ahaaa! You can't copy empty Regex");
}
else{
let textarea = document.getElementById("textarea_regex");
  		textarea.select();
  		document.execCommand("copy");}
}
	function copyNormal() {
  			if (!$.trim($("#textarea_normal").val())) {
alert("Ahaaa! You can't copy empty Regex");
}
else{
let textarea = document.getElementById("textarea_normal");
  		textarea.select();
  		document.execCommand("copy");}
}
	function copyString() {
  			if (!$.trim($("#textarea_string").val())) {
alert("Ahaaa! You can't validate empty String");
}
else{
let textarea = document.getElementById("textarea_string");
  		textarea.select();
  		document.execCommand("copy");}
}
function validate() {
  		//let textarea = document.getElementById("textarea_original");
  		//textarea.select();
  		alert("This feature will let you perform validation in the same page and will be live soon.")
}

if (!$.trim($("#textarea_normal").val())) {
    // textarea is empty or contains only white-space
}
</script>