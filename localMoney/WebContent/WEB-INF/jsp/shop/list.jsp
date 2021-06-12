<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>::: Spring with MyBatis :::</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
    <h3>가게 목록</h3>

    <table style="width: 100%;" border="1">
        <tbody>
            <c:if test="${!empty listShop}">
                <c:forEach items="${listShop}" var="shop" varStatus="status">
                    <tr>
                        <td style="text-align: center;">
                            <c:out value="${shop.shopName}" />
                        </td>
                        <td style="text-align: left;">
                            <c:out value="${shop.shopPost}" />
                        </td>
                        <td style="text-align: left;">
                            <c:out value="${shop.shopLocationX}" />
                        </td>
                        <td style="text-align: center;">
                            <c:out value="${shop.shopLocationY}" />
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty listShop}">
                <tr>
                    <td style="text-align: center;" 
                        colspan="7">목록이 존재하지 않습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</body>
</html>