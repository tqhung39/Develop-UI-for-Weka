<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<style>
	.start-btn{
		display: inline-block;
                margin-bottom: 0;
                font-weight: 400;
                text-align: center;
                white-space: nowrap;
                vertical-align: middle;
                -ms-touch-action: manipulation;
                touch-action: manipulation;
                cursor: pointer;
                background-image: none;
                border: 1px solid transparent;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.42857143;
                border-radius: 4px;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                color: #fff;
                background-color: #337ab7;
                border-color: #2e6da4;
                margin-top: 20px;
                margin-left: 405px;
                padding-left: 20px;
                padding-right: 20px;
	}
</style>

</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1 class="animated swing"><a href="">Weka Website</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="index-page.jsp" accesskey="1" title="">Homepage</a></li>
				<li><a href="#copyright" title="">Contact Us</a></li>
			</ul>
		</div>
	</div>
	<div id="banner" class="container">
		<div class="title">
			<h2>EXPLORER</h2>
		</div>
	</div>
</div>
<div id="wrapper">
	<div id="three-column" class="container">
		<div class="title" style="width: 100%">
			<form method="post" action="uploadFile" enctype="multipart/form-data">
				<h3>Choose a dataset: <input  type="file" name="uploadFile" id="upload"/><input class="btn btn-primary" type="submit" value="Upload"/></h3>
			</form>
			<button class="start-btn" type="button" onclick="getSelected()">Start</button>
		</div>
		<div class="boxA">
                    <h1 style="font-size: 300%">Preprocess</h1>
                </br>
                <div class="w3-half" id="glasspre" style="display:none">
                    <img src="images/1.png" style="width:50%" onclick="onClick(this)" id="glass1">
                    </br>
                    <h3><a href="glass-preprocess.jsp">Glass Dataset</a></h3>
                </div>
                <div class="w3-half" id="iris2Dpre" style="display:none">
                    <img src="images/1.png" style="width:50%" onclick="onClick(this)" id="iris1">
                    </br>
                    <h3><a href="iris2D-preprocess.jsp">Iris.2D Dataset</a></h3>
                </div>
                <div class="w3-half" id="weatherpre" style="display:none">
                    <img src="images/1.png" style="width:50%" onclick="onClick(this)" id="weather1">
                    </br>
                    <h3><a href="weather-preprocess.jsp">Weathernominal Dataset</a></h3>
                </div>
		</div>
		<div class="boxC">
			<h1 style="font-size: 300%">Classify</h1>
                        </br>
			<div class="w3-col 8 m6 w3-margin-bottom" id="glass" style="display:none" >
                <div class="w3-display-container">
                    <img src="images/1.png" style="width:50%" onclick="onClick(this)" id="glass">
                    </br>
                    <h3><a href="glass-classify.jsp">Glass Dataset</a></h3>                    
                </div>
            </div>
            <div class="w3-col 8 m6 w3-margin-bottom" id="iris2D" style="display:none">
                <div class="w3-display-container">
                    <img src="images/1.png" style="width:50%" onclick="onClick(this)" id="iris">
                    </br>
                    <h3><a href="iris2D-classify.jsp">Iris.2D Dataset</a></h3>
                </div>
            </div>
            <div class="w3-col 8 m6 w3-margin-bottom" id="weather" style="display:none" >
                <div class="w3-display-container">
                    <img src="images/1.png" style="width:50%" onclick="onClick(this)" id="weather">
                    </br>
                    <h3><a href="weather-classify.jsp">Weathernominal Dataset</a></h3>                   
                </div>
            </div>
		</div>
	</div>
</div>
<div id="copyright" class="container">
	<p>Copyright &copy; by Tran Quoc Hung</p>
	<p>ITITIU15082</p>
</div>
        <script>
            function getSelected(){
                var upload = document.getElementById("upload");
                var uploadFile = upload.innerHTML = "${filename}";
                var glasspre = document.getElementById("glasspre");
                var irispre = document.getElementById("iris2Dpre");
                var weatherpre = document.getElementById("weatherpre");
                var glass = document.getElementById("glass");
                var iris = document.getElementById("iris2D");
                var weather = document.getElementById("weather");
                if (uploadFile === "glass.arff"){
                    glass.style.display = 'block';
                    glasspre.style.display = 'block';
                    iris.style.display = 'none';
                    irispre.style.display = 'none';
                    weather.style.display = 'none';
                    weatherpre.style.display = 'none';
                } else if(uploadFile === "iris.2D.arff"){
                    glass.style.display = 'none';
                    glasspre.style.display = 'none';
                    iris.style.display = 'block';
                    irispre.style.display = 'block';
                    weather.style.display = 'none';
                    weatherpre.style.display = 'none';
                } else if(uploadFile === "weather.nominal.arff"){
                    glass.style.display ='none';
                    glasspre.style.display = 'none';
                    iris.style.display = 'none';
                    irispre.style.display = 'none';
                    weather.style.display = 'block';
                    weatherpre.style.display = 'block';                    
                } else {
                    alert("Please upload your dataset !");
                }
            }
        </script>

    </body>
</html>
