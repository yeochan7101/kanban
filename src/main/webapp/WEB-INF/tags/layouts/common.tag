<%@ tag body-content="scriptless" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ attribute name="header" fragment="true" %>
<%@ attribute name="footer" fragment="true" %>
<%@ attribute name="title" %>
<c:url var="cssUrl" value="/static/css/" />
<c:url var="jsUrl" value="/static/js/" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <link rel="stylesheet" type="text/css" href="${cssUrl}style.css" />
        <c:if test="${addCss != null}">
        <c:forEach var="file" items="${addCss}">
            <link rel="stylesheet" type="text/css" href="${cssUrl}${file}.css" />
        </c:forEach>
        </c:if>
        <script src="${jsUrl}common.js"></script>
        <c:if test="${addScript != null}">
        <c:forEach var="file" items="${addScript}">
            <script src="${jsUrl}${file}.js"></script>
        </c:forEach>
        </c:if>
    </head>
    <body>
        <header>
           <jsp:invoke fragment="header" />
        </header>
        <main>
            <jsp:doBody />
        </main>
        <footer>
            <jsp:invoke fragment="footer" />
        </footer>
    </body>
</html>