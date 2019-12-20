<%-- 
    Document   : newjsp
    Created on : Jul 9, 2019, 9:19:06 PM
    Author     : Admin
--%>
<%@page import="com.thesis.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weather.nominal Attribute</title>
    </head>
    <body>
        <h1 align="center">Weather.nominal Attribute: </h1>
        <table>
            <tr>
                <td><%= com.thesis.Weathernominal.getDataSet("C:\\Program Files\\Weka-3-8\\data\\weather.nominal.arff")%></td>
            </tr>
        </table>
            <a href="chart/weathernominal-chart/outlook-chart.html"><h2>Class:outlook(Nom)</h2></a>
            <a href="chart/weathernominal-chart/temperature-chart.html"><h2>Class:temperature(Nom)</h2></a>
            <a href="chart/weathernominal-chart/humidity-chart.html"><h2>Class:humidity(Nom)</h2></a>
            <a href="chart/weathernominal-chart/windy-chart.html"><h2>Class:windy(Nom)</h2></a>
            <a href="chart/weathernominal-chart/play-chart.html"><h2>Class:play(Nom)</h2></a>
    </body>
</html>