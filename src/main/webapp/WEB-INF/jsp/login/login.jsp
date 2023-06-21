<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:include page="/WEB-INF/jsp/cmm/menu.jsp"/>
        <div class="loginBoxLogo">
            <img src="/statics/img/common/logo.png" alt="PayAppCafe">
            <h1>통합관리자</h1>
        </div>
        <div class="loginBoxWrap">
            <div class="loginBox" style="top:200px;">
                <form id="frmLogin">
                    <div class="loginInputBox">
                        <div class="inputB"><span class="icon icon-user"></span><input type="text" id="mgrId" name = "mgrId" placeholder="아이디를 입력하세요."/></div>
                        <div class="inputB"><span class="icon-lock1 icon"></span><input type="password" id="ecpyPwd" name="ecpyPwd" placeholder="비밀번호를 입력하세요."/></div>
                        <div class="loginbtnBox"><button onclick="doLogin(); return false;">로그인</button></div>
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
            </div>
        </div>
        <script type="text/javascript">
            $(function(){
                init();
            });

            function init() {
                $("#mgrId").focus();

                if ('${msg}') {
                    COMMON.openAlert('${msg}');
                }
            }

            // 로그인 AJAX
            function doLogin() {

                if (!$("#mgrId").val()) {
                    COMMON.openAlert("아이디를 입력 해주세요.", function(){
                        $("#mgrId").focus();
                    });

                    return false;
                } else if (!$("#ecpyPwd").val()) {
                    COMMON.openAlert("패스워드를 입력 해주세요.", function(){
                        $("#ecpyPwd").focus();
                    });

                    return false;
                }


                COMMON.ajaxFormPost("/loginProc", $("#frmLogin"), function(data){

                    // 패스워드 만료됐을 경우 비밀번호 변경 창으로 이동
                    if (data.resultCd == "0000" && data.resultVO.pwdExpire == "Y") {
                        COMMON.goPage("/pwdUpdate");
                    } else if (data.resultCd == "0000" &&  data.resultVO.pwdExpire == "N") { // 정상일 경우 2차인증 화면으로 이동

                        if (data.resultVO.authUseYn == "Y") {
                            COMMON.goPage("/otpLogin");
                        } else {
                            COMMON.goPage("/main/dashboard");
                        }

                    } else {
                        // 로그인 실패
                        COMMON.openAlert(data.resultMsg);
                    }

                }, function(){
                    COMMON.openAlert("로그인 중 시스템 오류가 발생하였습니다.</br> 관리자에게 문의 바랍니다.");
                });

            }
        </script>