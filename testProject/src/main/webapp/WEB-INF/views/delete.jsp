  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!--로그인 세션 없으면 이 페이지는 들어 올 수 없음-->
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="/resources/css/user_delete.css" />
    <script type="text/javascript" src="/resources/js/includeHTML.js"></script>
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
      integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
      crossorigin="anonymous"
    />
  </head>

  <body>

    <div id="wrap">
        <div id="header">
            <jsp:include page="/resources/html/header2.jsp" />
        </div>
        <div id="main">
            <div class="delete_header">
                <h1>
                  <i class="fas fa-won-sign"></i>
                  <a href="/resources/html/index.html">내 주변 경기도 지역화폐 가맹점</a>
                </h1>
                <h2>회원 탈퇴</h2>
                <form class="delete_form" action="delete" method="post">
                    <div class="wrap_border">
                        <div class="user_column">
                            <div class="user_name">
                                <h3>${user.name}님</h3>
                                <p>회원 탈퇴를 원하시면 비밀번호를 입력해 주세요.</p>
                            </div>
                        </div>
                        <!--비밀번호 입력-->
                        <div class="user_column user_pw_column">
                            <label class="control_label" for="password">비밀번호</label>
                            <input class="form_control" type="password" id="password" name="passWord" required/>
                        </div>
                    </div>    
                  <!--탈퇴/취소버튼-->
                  <div class="user_btn_column">
                    <input id="delete_btn" type="submit" value="회원탈퇴" onclick="alert('회원 탈퇴에 성공하였습니다.');"/>
                    <input id="cancel_btn" type="button" value="취소" onclick="location.href='mypage'"/><!--회원정보 페이지로 이동-->
                  </div>    
                </form>
        </div>
        <div id="footer"></div>
    </div>
    <script type="text/javascript" src="/resources/js/header.js"></script>
  </body>
</html>