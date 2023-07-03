<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:include page="/WEB-INF/jsp/cmm/menu.jsp"/>
        <div class="loginBoxLogo">
            <img src="/statics/img/common/logo.png" alt="PayAppCafe">
            <h1>통합관리자</h1>
        </div>
        <div class="loginBoxWrap">
            <div class="loginBox" style="top:200px;">
                <form id="frmLogin" action="j_spring_security_check" enctype="multipart/form-data" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="loginInputBox">
                        <div class="inputB"><span class="icon icon-user"></span><input type="text" id="userId" name = "userId" placeholder="아이디를 입력하세요."/></div>
                        <div class="inputB"><span class="icon-lock1 icon"></span><input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요."/></div>
                        <div class="loginbtnBox"><button type="submit">로그인</button></div>
                    </div>

                    <div class="loginInfo">
                        <div>
                            ※ 페이앱카페 가맹점관리시스템은 서비스 가입 후 이용 가능합니다. 자세한 내용은 홈페이지를 참조하시나 아래의 담당자에게 연락하시기 바랍니다.
                        </div>
                        <ul>
                            <li>고객센터 : 070-8732-5600,  pac@bpsoft.co.kr</li>
                            <li>운영시간 : 10:00 ~ 17:00  (주말/공휴일 제외)</li>
                        </ul>
                    </div>
                </form>

                <div class="loginbtnBox"><button onclick="joinPageRedirect()">회원가입</button></div>
            </div>
        </div>
<script>
    function joinPageRedirect() {
        location.replace("/joinPage")
    }
</script>
