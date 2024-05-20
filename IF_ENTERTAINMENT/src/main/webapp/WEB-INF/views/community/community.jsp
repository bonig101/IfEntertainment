<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Artist List</title>
</head>
<body>
    <h1>Artist List</h1>
    <c:forEach items="${artistList}" var="artistGroup">
        <div>
            <img src="${artistGroup.agProfile}" alt="Artist Profile" style="width:300px;">
            <h2>${artistGroup.agName}</h2>
            <p>Date: ${artistGroup.agDate}</p>
            <p>Intro: ${artistGroup.agIntro}</p>
            <h3>Artists</h3>
            <c:forEach items="${artistGroup.artistList}" var="artist">
                <div>
                    <p>User No: ${artist.userNo}</p>
                    <p>Birth: ${artist.artistBirth}</p>
                    <p>Fakename: ${artist.artistFakename}</p>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
</body>
</html>
