<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="/statics/css/font3.css"/>
<style>

    body {
        display: flex;
        flex-direction: column;
        padding: 0;
        margin: 0;
    }

    /* 헤더 박스 (로고, 로그인) */
    header {
        height: 60px;
        padding: 8px;
        display: flex;
        justify-content: space-between;
        flex-grow: 0;
        border-bottom: 1px solid gainsboro;
    }

    /* 헤더의 버튼들 */
    header > button {
        border: transparent;
        background-color: transparent;
        font-size: larger;
    }

    /*  로그인 전체 박스 중앙정렬 */
    .container {
        /* background-color: aqua; */
        min-height: 600px;
        height: 100%;
        /* width: 400px; */
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin: 24px;
        margin-bottom: 48px;
        /* background-color: aquamarine; */
    }

    /* 약관동의, 회원정보를 입력해주세요 글씨 */
    .container > p {
        font-size: x-large;
    }

    /* <!-- terms and conditions --> */
    .TandC {
        border: 1px solid gray;
        padding: 16px;
    }

    /* 약관 동의서들  */
    .TandC > div {
        padding: 4px;
        display: flex;
        justify-content: space-between;
    }

    /* 약관 간단 설명에서 (필수)  */
    .TandC strong {
        color: red;
    }

    /* 약관 상세보기 버튼  */
    .TandC button {
        background-color: transparent;
        border: transparent;
        text-decoration: underline;
    }

    /* 약관 상세보기 버튼 hover */
    .TandC button:hover {
        cursor: pointer;
    }

    /* 회원 정보 박스 */
    .MemberInfo_box {
        display: flex;
        flex-direction: column;
        width: 400px;
    }

    /* 입력창 */
    .MemberInfo_box input {
        width: 100%;
        height: 60px;
        font-size: large;
        padding: 8px;
        box-sizing: border-box;
    }

    /* 회원정보 각 요소 박스(입력창+텍스트) */
    .MemberInfo_box > div {

        margin-top: 8px;
        margin-bottom: 8px;

    }

    /* 회원정보 글씨 */
    .MemberInfo_box p {
        margin: 0;
        padding: 0;
        display: none;
    }


</style>


</head>
<body>


<header>

    <!-- 클릭 시 메인 페이지로 이동 -->
    <button onclick="history.back()">볼링 관리 시스템</button>
    <!-- 클릭 시 로그인 페이지 이동 -->
    <button onclick="history.back()">로그인</button>

</header>


<!--  -->
<form id="signUpForm" action="/signUp" class="container" enctype="multipart/form-data">

    <!-- 이용약관 -->
    <p>
        약관 동의
    </p>

    <!-- terms and conditions -->
    <div class="TandC">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <!-- 전체 동의 -->
        <div style="border-bottom: 1px solid gray;">
            <span>전체 동의</span>
            <input type="checkbox" name="" id="">
        </div>

        <!-- 필수 1 -->
        <div>
            <span><strong>(필수)</strong> 개인회원 약관에 동의 <button>상세 보기</button></span>
            <input type="checkbox" name="" id="">
        </div>

        <!-- 필수 2 -->
        <div>
            <span><strong>(필수)</strong> 개인정보 수집 및 이용에 동의 <button>상세 보기</button></span>
            <input type="checkbox" name="" id="">
        </div>

        <!-- 선택 1 -->
        <div>
            <span>(선택) 마케팅 정보 수신 동의 - 이메일 <button>상세 보기</button></span>
            <input type="checkbox" name="" id="">
        </div>

        <!-- 선택 2 -->
        <div>
            <span>(선택) 마케팅 정보 수신 동의 - SMS/MMS <button>상세 보기</button></span>
            <input type="checkbox" name="" id="">
        </div>

    </div>

    <p>
        <!-- 회원 정보 -->
        회원정보를 입력해주세요
    </p>

    <!-- Collection of personal(member) information? -->
    <!-- 회원 정보 -->
    <div class="MemberInfo_box">

        <!-- 휴대폰 번호 또는 이메일 주소 -->
        <div>
            <input type="text" id="userId" name="userId" placeholder="로그인 ID">
        </div>

        <!-- 비밀번호 -->
        <div>
            <input type="password" id="password" name="password" placeholder="비밀번호">
            <p>비밀번호 메세지</p>
        </div>

        <!-- 비밀번호 확인 -->
        <div>
            <input type="password" placeholder="비밀번호 확인">
            <p>비밀번호 확인 메세지</p>
        </div>

        <!-- 닉네임 -->
        <div>
            <input type="text" placeholder="닉네임">
            <p>닉네임 메세지</p>
        </div>

        <div>
            <!-- 회원가입 -->
            <input type="submit" value="회원가입" >
        </div>
    </div>
</form>
<script>
</script>
</body>
</html>