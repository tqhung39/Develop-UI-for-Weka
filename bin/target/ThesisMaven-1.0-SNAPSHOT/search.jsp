<%-- 
    Document   : index
    Created on : Jul 10, 2019, 9:36:00 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
 
<html>
  <head>
  </head>
  <body>
    <br/><br/>
    <form method="post" name="frm" action="Search">
      <table>
        <tr><td>
        <h1>Search Dataset</h1></td></tr>
        <tr><td ><b>Dataset name:</b></td>
          <td><input  type="text" name="pid" id="pid">
        </td></tr>        
        <tr><td colspan=2 align="center">
        <input  type="submit" name="submit" value="Search"></td></tr>
      </table>
    </form>
  </body>
</html>