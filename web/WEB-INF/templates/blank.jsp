<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <c:choose>
                <c:when test="${pageTitle != null}" >
                    ${pageTitle}
                </c:when> 
                <c:otherwise>
                    Adi Wira
                </c:otherwise>
            </c:choose>
        </title>
        <!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/layout.css" /> -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/general.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/styles.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/reset.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/prettyphoto.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/redmond/jquery-ui.css" />
        <c:forEach items="${styles}" var="style">
            <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/${style}.css" />
        </c:forEach>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery.modal.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery.prettyphoto.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/global.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/raphael-min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/dracula_graffle.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/dracula_graph.js"></script>
        <c:forEach items="${externalScripts}" var="script">
            <script type="text/javascript" src="${script}"></script>
        </c:forEach>
        <c:forEach items="${scripts}" var="script">
            <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/${script}.js"></script>
        </c:forEach>
    </head>
    <body>
       <tiles:insertAttribute name="content" />   
    </body>
</html>