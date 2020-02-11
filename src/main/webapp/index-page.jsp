<!DOCTYPE html>
<html lang="en">
    <title>Homepage</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css"/>



    <style>
        body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
        body {font-size:16px;}
        .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
        .w3-half img:hover{opacity:1}
        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: #f1f1f1;
            color: black;
            text-align: center;
        }
        .page-footer {
            margin-left: 300px;
        }
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
                margin-left: 795px;
                padding-left: 20px;
                padding-right: 20px;
        }
        #sticky-footer {
            flex-shrink: none;
            margin-top: 240px;
        }
    </style>
    <body>

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar bg-primary w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <div class="w3-container">
                <h3 class="w3-padding-64 text-light"><b>Weka<br>Website</b></h3>
            </div>
            <div class="w3-bar-block">
                <a href="index-page.jsp" onclick="w3_close()" class="w3-bar-item w3-button text-light">Home</a>
                <a href="#footer" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white text-light">Contact</a>
                <div class="w3-dropdown-hover">
                    <button class="w3-button text-light">List of Dataset</button>
                    <div class="w3-dropdown-content w3-bar-block w3-border">
                        <p class="w3-bar-item w3-button text-dark">Glass </p>
                        <p href="iris" class="w3-bar-item w3-button text-dark">Iris.2D</p>
                        <p href="weather" class="w3-bar-item w3-button text-dark">Weathernominal</p>
                    </div>
                </div>

            </div>
        </nav>
        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
        <ul id="myUL">
            <li><a href="#">Glass</a></li>
            <li><a href="#">Iris2D</a></li>
            <li><a href="#">Weather</a></li>
        </ul>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:340px;margin-right:40px">

            <!-- Header -->
            <div class="w3-container" style="margin-top:-100px" id="showcase">
                <br/>
                <h1 class="w3-jumbo text-primary" align="center"><b>EXPLORER</b></h1>
    <form method="post" action="uploadFile" enctype="multipart/form-data">
        <h3>Choose a dataset: <input  type="file" name="uploadFile" id="upload"/><input class="btn btn-primary" type="submit" value="Upload"/></h3>
    </form>
                </br>                
            <button class="start-btn" type="button" onclick="getSelected()">Start</button>
            <div class="w3-container" style="margin-top:80px" id="preprocess">
                <h3 class="w3-xxxlarge w3-text-blue"><b><u>Preprocess:</u></b></h3>
            </div>
            </br>
            <div class="w3-row-padding">
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
            <div class="w3-container" id="designers" style="margin-top:75px">
                <h3 class="w3-xxxlarge w3-text-blue"><b><u>Classify:</u></b></h3>
            </div>
                </br>
            <!-- Photo grid (modal) -->
            <div class="w3-col 8 m6 w3-margin-bottom" id="glass" style="display:none">
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
            <div class="w3-col 8 m6 w3-margin-bottom" id="weather" style="display:none">
                <div class="w3-display-container">
                    <img src="images/1.png" style="width:50%" onclick="onClick(this)" id="weather">
                    </br>
                    <h3><a href="weather-classify.jsp">Weathernominal Dataset</a></h3>                   
                </div>
            </div>
            
             <!-- Services -->
  <div class="w3-container" id="services" style="margin-top:75px">
  </div>
  
            <!-- Modal for full size images on click-->
            <div id="modal01" class="w3-modal w3-black" style="padding-top:0" onclick="this.style.display = 'none'">
                <span class="w3-button w3-black w3-xxlarge w3-display-topright">×</span>
                <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
                    <img id="img01" class="w3-image">
                    <p id="caption"></p>
                </div>
            </div> 

            <!-- End page content -->
            </div>
            </div>
        </div>

  <footer id="sticky-footer" class="py-4 bg-light text-white-50">
    <div class="container text-center">
      <small>Copyright &copy; by Tran Quoc Hung</small>
      </br>
      <small>ITITIU15082</small>
    </div>
  </footer>
        <script>
            // Script to open and close sidebar
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }

            // Modal Image Gallery
            function onClick(element) {
                document.getElementById("img01").src = element.src;
                document.getElementById("modal01").style.display = "block";
                var captionText = document.getElementById("caption");
                captionText.innerHTML = element.alt;
            }

            function myFunction() {
                var input, filter, ul, li, a, i, txtValue;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                ul = document.getElementById("myUL");
                li = ul.getElementsByTagName("li");
                for (i = 0; i < li.length; i++) {
                    a = li[i].getElementsByTagName("a")[0];
                    txtValue = a.textContent || a.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        li[i].style.display = "";
                    } else {
                        li[i].style.display = "none";
                    }
                }
            }
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
                } else {
                    glass.style.display ='none';
                    glasspre.style.display = 'none';
                    iris.style.display = 'none';
                    irispre.style.display = 'none';
                    weather.style.display = 'block';
                    weatherpre.style.display = 'block';
                }
            }
        </script>

    </body>
</html>
