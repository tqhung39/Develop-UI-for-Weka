<%-- 
    Document   : iris2D
    Created on : Jul 9, 2019, 8:47:32 PM
    Author     : Admin
--%>

<%@page import="com.thesis.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iris.2D Attribute</title>
    </head>
    <body>
        <h1 align="center">Iris.2D Attribute: </h1>
        <table>
            <tr>
                <td><%= com.thesis.Iris.getDataSet("C:\\Program Files\\Weka-3-8\\data\\iris.2D.arff")%></td>
            </tr>
        </table>
            <a href="chart/iris2D-chart/class-chart.html"><h2>Class: class(Nom)</h2></a>
            <a href="chart/iris2D-chart/petallength-chart.html"><h2>Class:petallength(Num)</h2></a>
            <a href="chart/iris2D-chart/petalwidth-chart.html"><h2>Class:petalwidth(Num)</h2></a>
    </body>
</html>
