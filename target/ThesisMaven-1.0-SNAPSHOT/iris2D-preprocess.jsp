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
            function irisFunction() {
                var a = document.getElementById("iris");
                var b = document.getElementById("iris2");
                    if (a.style.display === "none" & b.style.display === "none") {
                      a.style.display = "block";
                      b.style.display = "block";
                    } else {
                      a.style.display = "none";
                      b.style.display = "none";
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
                                <td><h3>Iris2D</h3></td>
                                <td><button onclick="irisFunction()">Show/Hide</button>
                            </tr>
                        </table>
                    </div>
                        <div class="col-md-4" id="iris" style="display: none">
                            <table id="iris2Dattribute" class="table-dataset" style="width: 100%">
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                </tr>
                                <tr>
                                    <td align="center">1</td>
                                    <td align="center"><a href="chart/iris2D-chart/petallength-chart.html">petallength</a></td>
                                </tr>
                                 <tr>
                                    <td align="center">2</td>
                                    <td align="center"><a href="chart/iris2D-chart/petalwidth-chart.html">petalwidth</a></td>
                                </tr>
                                 <tr>
                                    <td align="center">3</td>
                                    <td align="center"><a href="chart/iris2D-chart/class-chart.html">class</a></td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-4" id="iris2" style="display: none">
                             <h5><%= com.thesis.Iris.getDataSet("H:/Develop-UI-for-Weka/target/ThesisMaven-1.0-SNAPSHOT/upload/iris.2D.arff")%></h5>
                        </div>
        </div>
    </body>
</html>

