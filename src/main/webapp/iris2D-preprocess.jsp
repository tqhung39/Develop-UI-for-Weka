<%-- 
    Document   : preprocess
    Created on : Dec 13, 2019, 1:56:40 PM
    Author     : Admin
--%>
<%@page import="com.thesis.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Raleway">
        <style>
            body {
                background-image: url('');
                font-family: 'Raleway', 'sans-serif'
            }
            .title {
                background-color: #FFF8DC;
            }
        </style>
        <script>
            function irisFunction() {
                var x = document.getElementById("iris");
                var y = document.getElementById("iris2");
                    if (x.style.display === "none" & y.style.display === "none") {
                      x.style.display = "block";
                      y.style.display = "block";                     
                    } else {
                      x.style.display = "none";
                      y.style.display = "none";
                    }
                  }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
  <a class="navbar-brand pl-5 text-light">Iris 2D Preprocessing</a>
</nav>
        </br>
        <div class="container">
                <div id="dataset" class="row">
                    <div class="col-md-4">
                        <table class="table">
                    <thead class="bg-light">
                      <tr>
                        <th class="text-primary">Dataset</th>
                        <th class="text-primary">Attribute</th>
                      </tr>
                    </thead>
                    <tbody>
                    <td>Glass</td>
                    <td><button class="btn btn-primary" onclick="irisFunction()">Show/Hide</button></td>
                    </tbody>
                  </table>
                    </div>
                    <div class="col-md-7" id="iris" style="display: none">
                        <table id="glassattribute" class="table" style="width: 100%">
                            <thead class="bg-light">
                            <tr>
                                <th class="text-primary">No.</th>
                                <th class="text-primary">Name</th>
                            </tr>
                            </thead>
                            <tr>
                                <td>1</td>
                                <td><a href="chart/iris2D-chart/pentallength-chart.html">pentallength</a></td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td><a href="chart/iris2D-chart/pentalwidth-chart.html">pentalwidth</a></td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td><a href="chart/iris2D-chart/class-chart.html">class</a></td>
                            </tr>
                        </table>
                    </div>
                </div>
                        <div class="" id="iris2" style="display: none">
                            <hr>
                            <h2 class="text-primary">Input</h2>
                            <br/>
                             <% for (String line: com.thesis.Iris.getFile("C:/Users/Admin/Documents/ThesisMaven/target/ThesisMaven-1.0-SNAPSHOT/upload/iris.2D.arff")) {%>
                             <p style="font-size: 20"><%= line %><p>
                             <% } %>
                </div>
    </body>
</html>