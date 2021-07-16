<%-- 
    Document   : index
    Created on : 31-05-2021, 22:34:50
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Photographer</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <%@include file="components/header.jsp" %>
            <div class="row">
                <div class="main">
                    <div class="left">
                        <div class="left-home">
                            <c:if test="${not empty viewImageModel}">
                                <div class="btn-btn">
                                    <span class="btn-btn-view"><a href="gallery?id=${modelGallery.id}">Back to album</a></span>
                                    <c:if test="${not empty idBefore}">
                                        <span class="btn-btn-view"><a href="gallery?id=${modelGallery.id}&view=${idBefore}"> << </a></span>
                                    </c:if>
                                        <span class="btn-btn-view">${idCurrent}</span>
                                    <c:if test="${not empty idAfter}">
                                        <span class="btn-btn-view"><a href="gallery?id=${modelGallery.id}&view=${idAfter}"> >> </a></span>
                                    </c:if>
                                </div>
                                <img id="myImg" src="images/${viewImageModel.url}" alt="Images">                            
                            </c:if>
                            <c:if test="${empty viewImageModel}">
                                <h4 class="subtitle2 mb-20">${modelGallery.name}</h4>
                                <div class="slides mb-10">
                                    <c:set var = "i" scope = "session" value = "0"/>
                                    <c:forEach var="item" items="${modelGallery.images}">
                                        <c:if test="${i == 0}">
                                            <button onclick="pauseOnclick()">
                                                <img class="slide active mb-10" src="images/${item.url}" alt="homeImage">
                                            </button>
                                        </c:if>
                                        <c:if test="${i != 0}">
                                            <button  onclick="pauseOnclick()">
                                                <img class="slide mb-10" src="images/${item.url}" alt="homeImage">
                                            </button>
                                        </c:if>
                                        <c:set var = "i" scope = "session" value = "${i+1}"/>
                                    </c:forEach>
                                    <div id="playpause" class="play" style="opacity: -1">
                                        <button class="controls" id="pause"><i class="fas fa-pause" style="font-size:24px;"></i></button>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        <c:if test="${empty viewImageModel}">
                            <div class="category">
                                <c:forEach var="item" items="${modelPaging}">
                                    <div class="thumnail">
                                        <a  href="gallery?id=${idGallery}&view=${item.id}">
                                            <img src="images/${item.url}" alt="">
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                            <center>   
                                <c:forEach begin="1" end="${totalPage}" var="i">
                                    <div class="paging">
                                        <a  href="gallery?id=${idGallery}&index=${i}">${i}</a>
                                        </div>
                                </c:forEach>
                            </center>
                        </c:if>
                    </div>
                    <%@include file="components/right.jsp" %>
                </div>
            </div>
            <%@include file="components/footer.jsp" %>
        </div>
        <script src="js/images.js"></script>
        <c:if test="${empty viewImageModel}">
            <script src="js/slide.js"></script>
        </c:if>
    </body>
</html>
