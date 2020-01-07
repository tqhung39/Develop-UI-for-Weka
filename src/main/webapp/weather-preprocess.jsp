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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            table, th, td {
            padding: 20px;
            border: 1px solid black; 
            border-collapse: separate;
            text-align: center;
            }
            .table-dataset  {
                border-radius: 12px;
            }
            body {
                background-image: url('');
            }
            .title {
                background-color: #FFF8DC;
            }
        </style>
        <script>
            function weatherFunction() {
                var c = document.getElementById("weather");
                var d = document.getElementById("weather2");
                    if (c.style.display === "none" & d.style.display === "none") {
                      c.style.display = "block";
                      d.style.display = "block";
                    } else {
                      c.style.display = "none";
                      d.style.display = "none";
                    }
                  }
        </script>
    </head>
    <body>
        <div>
            <div class="title">
            <p style="font-size: 50px; text-align: center">Preprocess<p>
            </div>
                <div id="dataset" class="row">
                    <div class="col-md-4">
                        <table class="table-dataset" style="width: 100%">
                            <tr>
                                <th>Dataset</th>
                                <th>Attribute</th>
                            </tr>
                            <tr>
                                <td><h3>Weather nominal</h3></td>
                                <td><button onclick="weatherFunction()">Show/Hide</button>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-4" id="weather" style="display: none">
                        <table id="weathernominalattribute"  class="table-dataset" style="width: 100%">
                            <tr>
                                <th>No.</th>
                                <th>Name</th>
                            </tr>
                            <tr>
                                <td align="center">1</td>
                                <td align="center"><a href="chart/weathernominal-chart/outlook-chart.html">outlook</a></td>
                            </tr>
                            <tr>
                                <td align="center">2</td>
                                <td align="center"><a href="chart/weathernominal-chart/temperature-chart.html">temperature</a></td>
                            </tr>
                            <tr>
                                <td align="center">3</td>
                                <td align="center"><a href="chart/weathernominal-chart/humidity-chart.html">humidity</a></td>
                            </tr>
                            <tr>
                                <td align="center">4</td>
                                <td align="center"><a href="chart/weathernominal-chart/windy-chart.html">windy</a></td>
                            </tr>
                            <tr>
                                <td align="center">5</td>
                                <td align="center"><a href="chart/weathernominal-chart/play-chart.html">play</a></td>
                            </tr>
                        </table>
                        </div>
                        <div class="col-md-4" id="weather2" style="display: none">
                             <h5><%= com.thesis.Weathernominal.getDataSet("C:/Users/Admin/Documents/ThesisMaven/target/ThesisMaven-1.0-SNAPSHOT/upload/weather.nominal.arff")%></h5>
                        </div>    
                </div>
        </div>
    </body>
</html>

