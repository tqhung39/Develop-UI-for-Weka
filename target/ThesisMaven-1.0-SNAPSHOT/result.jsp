<%-- 
    Document   : result
    Created on : Dec 8, 2019, 10:38:44 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" href="style.css" type="text/css"/>
    <title>Upload Result</title>
    <style>
#dataset {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#dataset td, #dataset th {
  border: 1px solid #ddd;
  padding: 8px;
}

#dataset tr:nth-child(even){background-color: #f2f2f2;}

#dataset tr:hover {background-color: #ddd;}

#dataset th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #ff1100;
  color: white;
}
</style>
</head>

<body>
    <h2>${message}</h2>
    <table id="dataset">
        <tr>
            <th>Dataset</th>
            <th>Date</th>
        </tr>
        <td>${filename}</td>
        <td>${date}</td>
    </table>
    </br>
    <button class="ui right labeled icon button" onclick="history.back(-1)">
        <i class="left arrow icon "></i>
        <p>Back</p>
        </button>
</body>
</html>