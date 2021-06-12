<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	 <form>
    <div class="search_content">
      <button type="button" class="dlt_btn" onclick="location.href='/shop/delete/' + ${history.hisNo}">
        <i class="far fa-trash-alt"></i>
      </button>
      <div class="history_section_wrap">
        <div class="history_section">
          <div class="history_area">
            <p>현재위치: <c:out value="${history.address}" /></p>
          </div>
          <div class="history_industry">
            <p>업종: <c:out value="${history.shopType}" /></p>
          </div>
          <div class="history_radius">
            <p>반경: <c:out value="${history.sectors}" /></p>
          </div>
        </div>
        <div class="history_button">
          <button type="button" class="history_search_btns" onclick="location.href='${history.hrefURL}'" >검색하기</button>
        </div>
      </div>
    </div>
  </form>
  <link rel="stylesheet" href="/static/css/search_history.css" />
  <script
    src="https://kit.fontawesome.com/6478f529f2.js"
    crossorigin="anonymous"
  ></script>
</body>
</html>