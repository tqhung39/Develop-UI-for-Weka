<!DOCTYPE html>
<html lang="en">
    <title>List of Dataset</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
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
    </style>
    <body>

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
            <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
            <div class="w3-container">
                <h3 class="w3-padding-64"><b>Weka<br>Website</b></h3>
            </div>
            <div class="w3-bar-block">
                <a href="home.html" onclick="w3_close()" class="w3-bar-item w3-button">Home</a>
                <a href="#footer" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Contact</a>
                <div class="w3-dropdown-hover">
                    <button class="w3-button">List of Dataset</button>
                    <div class="w3-dropdown-content w3-bar-block w3-border">
                        <a href="glass" class="w3-bar-item w3-button">Glass </a>
                        <a href="iris" class="w3-bar-item w3-button">Iris.2D</a>
                        <a href="weather" class="w3-bar-item w3-button">Weathernominal</a>
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
                <h1 class="w3-jumbo" align="center"><b>EXPLORER</b></h1>
    <form method="post" action="uploadFile" enctype="multipart/form-data">
        <h3>Choose a dataset: <input type="file" name="uploadFile"/><input type="submit" value="Upload"/></h3>
    </form>
                <h3 class="w3-xxxlarge w3-text-red"><a href="preprocess.jsp"><b>Preprocess:</b></a></h3>
                <h3 class="w3-xxxlarge w3-text-red"><b>Classify:</b></h3>

            </div>

            <!-- Photo grid (modal) -->
            <div class="w3-col l3 m6 w3-margin-bottom" id="glass">
                <div class="w3-display-container">
                    <img src="images/1.png" style="width:90%" onclick="onClick(this)" id="glass">
                    <h3><a href="glass-classify.jsp">Glass Dataset</a></h3>                    
                </div>
            </div>
            <div class="w3-col l3 m6 w3-margin-bottom" id="iris2D">
                <div class="w3-display-container">
                    <img src="images/1.png" style="width:90%" onclick="onClick(this)" id="iris">
                    <h3><a href="iris2D-classify.jsp">Iris.2D Dataset</a></h3>
                </div>
            </div>
            <div class="w3-col l3 m6 w3-margin-bottom" id="weather">
                <div class="w3-display-container">
                    <img src="images/1.png" style="width:90%" onclick="onClick(this)" id="weather">
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
    <div class="w3-light-grey w3-container w3-padding-32" style="margin-top:75px;padding-right:600px">
        <p class="w3-right"><b>2019 All Rights Reserved</b></p>
        </br>
        <p class="w3-right" style="margin-right:-227px;"><b>Powered by Tran Quoc Hung</b></p>
        </br>
        <p class="w3-right" style="margin-right:-295px;"><b>Email: quochung.030997@gmail.com</b></p>
    </div>       
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
        </script>

    </body>
</html>
