<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            JSTL Experiments
        </title>
        <link href="stylesheet.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>
            Grades Experiments
        </h1>
        <%
            //Creating a simple array to use later
            String[] grades = {"A", "B", "C", "D", "F",
                };
            pageContext.setAttribute("grades", grades);      
        %> 
       
        <ul>
            <c:forEach var="i" begin="0" end="${fn:length(grades)-1}">
                <li>
                    ${fn:toUpperCase(grades[i])}
                </li>
            </c:forEach>    
        </ul>
        <br>
        <br>
        <p>
            Check your grade : 
        </p>
        <br>
        <form id="theForm" name="theForm" method="POST" action="reply">
            <label for="rate">
                On a scale of 1-100, what did you score?
            </label>
            <input type="number" id="rate" name="rate" value="" max="100" min="1">
            <br>
            <br>
            <input type="submit" id="submit" name="submit" value="Submit">
        </form>
        <br>
        <p>
            <c:choose>
                <c:when test="${response <= 69}">
                   Thats too bad :( You failed, your grade is F
                </c:when>
                <c:when test="${response > 69 && response <= 85}">
                    There is some hope for you! 
                </c:when>
                    <c:when test="${response > 85}">
                    You passed!!!! Good Job!!!!!
                </c:when>
                <c:otherwise>
                    ${errMsg}
                </c:otherwise>
            </c:choose>
        </p>
        <br
    </body>
</html>
