<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <c:choose>
                <c:when test="${pageTitle != null}" >
                    ${pageTitle}
                </c:when> 
                <c:otherwise>
                    Innovation KB
                </c:otherwise>
            </c:choose>
        </title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/layout.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/style.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/normalize.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/reset.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/pepper-grinder/jquery-ui.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/datatable/demo_table.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/datatable/demo_table_jui.css" />
        <c:forEach items="${styles}" var="style">
            <link rel="stylesheet" href="<%=request.getContextPath()%>/res/css/${style}.css" />
        </c:forEach>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-ui.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery.datatables.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery.modal.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery.prettyphoto.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/global.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/raphael-min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/dracula_graffle.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/arbor/arbor.js"></script>
        
        <c:forEach items="${externalScripts}" var="script">
            <script type="text/javascript" src="${script}"></script>
        </c:forEach>
        <c:forEach items="${scripts}" var="script">
            <script type="text/javascript" src="<%=request.getContextPath()%>/res/js/${script}.js"></script>
        </c:forEach>
	<script type="text/javascript">
		var baseUrl = "${pageContext.servletContext.contextPath}/";
	</script>
    </head>
    <body>
	<tiles:insertAttribute name="header" />
	<div id="content">
		<tiles:insertAttribute name="content" />
	</div>
	<div id="dialog-box">
		<div id="content-area">
                    
                </div>
		<div id="option-area"></div>
	</div>
    </body>
</html>