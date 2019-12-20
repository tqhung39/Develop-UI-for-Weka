<%-- 
    Document   : glass
    Created on : Jul 9, 2019, 10:18:27 PM
    Author     : Admin
--%>

<%@page import="com.thesis.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Glass Attribute</title>
    </head>
    <body>
        <h1 align="center">Glass Attribute:</h1>
        <table>
            <tr>
                <td><%= com.thesis.Glass.getDataSet("C:\\Program Files\\Weka-3-8\\data\\glass.arff")%></td>
            </tr>
        </table>
            <a href="chart/glass-chart/RI-chart.html"><h2>Class:RI(Num)</h2></a>
            <a href="chart/glass-chart/Na-chart.html"><h2>Class:Na(Num)</h2></a>
            <a href="chart/glass-chart/Mg-chart.html"><h2>Class:Mg(Num)</h2></a>
            <a href="chart/glass-chart/Al-chart.html"><h2>Class:Al(Num)</h2></a>
            <a href="chart/glass-chart/Si-chart.html"><h2>Class:Si(Num)</h2></a>
            <a href="chart/glass-chart/K-chart.html"><h2>Class:K(Num)</h2></a>
            <a href="chart/glass-chart/Ca-chart.html"><h2>Class:Ca(Num)</h2></a>
            <a href="chart/glass-chart/Ba-chart.html"><h2>Class:Ba(Num)</h2></a>
            <a href="chart/glass-chart/Fe-chart.html"><h2>Class:Fe(Num)</h2></a>
            
    </body>
</html>
