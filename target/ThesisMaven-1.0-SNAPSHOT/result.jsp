<%-- 
    Document   : result
    Created on : Dec 8, 2019, 10:38:44 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Raleway">
        <style>
            body {
                font-family: "Raleway", "sans-serif";
            }
</style>
</head>

<body>
    <h2>${message}</h2>
    <table class="table">
        <tr>
            <th class="text-primary">Dataset</th>
            <th class="text-primary">Date</th>
        </tr>
        <td>${filename}</td>
        <td>${date}</td>
    </table>
    </br>
    <a href="index-page.jsp"><button class="btn btn-primary ml-5">Back
        </button></a>
</body>
</html>