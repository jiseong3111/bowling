<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!-- admin top start -->
<div class="adminTopLayout">
    <h1><a href="/main/dashboard"></a> <strong>볼링관리 시스템</strong></h1>
    <!--right top menu-->
    <div class="admTRBox">
        <!-- user -->
        <div class="userBox">
            <a href="javascript:void(0);" class="userBtn">
                <span class="userIcon"><span class="icon-user"></span></span>
                <span class="userName" id="userName"><c:out value="${storeNm}   ${mgrNm}" />님</span>
                <span class="userText">반갑습니다</span>
                <span class="icon-down"></span>
            </a>
            <!--사용자 정보변경 -->
            <div class="userBoxChange">
                <ul>
                    <li><a href="javascript:void(0);" onclick="selectMyInfo();">내정보 변경</a></li>
                </ul>
            </div>
            <!--사용자 정보변경 -->
            <button class="logoutBtn" onclick="COMMON.logout('/logout');"><span class="icon-login"></span><span>로그아웃</span></button>
        </div>
        <!-- user -->
    </div>
</div>
<!-- admin top end -->

<!-- header layerpopup -->
<div class="layerpopup  myInfoChange">
    <div class="layerpopupIn">
        <div class="layerpopupHead">
            <div class="layerpopupHeadIn">
                <div>개인정보 변경</div>
                <a href="javascript:void(0);" onclick="adminS.popup('close','.myInfoChange');"><span class="icon-multipli"></span></a>
            </div>
        </div>
        <div class="layerpopupCon">
            <div class="myInfoChangeWrap">
                <div class="myinfoBox first">
                    <div class="tableHead">
                        <div class="tableHeadL"><h3 class="conT">기본정보</h3></div>
                        <div class="tableHeadR ar"><span class="smallFont text_gray"><span class="text_red">*</span> 필수항목입니다.</span></div>
                    </div>
                    <form id="frmBasicInfo">
                        <input type="hidden" name="mgrNo" value="<c:out value="${mgrNo}" /> ">
                        <input type="hidden" name="mgrId" value="<c:out value="${mgrId}" /> ">
                        <table class="table_normal">
                            <colgroup>
                                <col width="30%"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th class="al" >회사명</th>
                                <td id="storeNm">${storeNm}</td>
                            </tr>
                            <tr>
                                <th class="al" >아이디</th>
                                <td id="mgrId">${mgrId}</td>
                            </tr>
                            <tr>
                                <th class="al" >이름 <span class="text_red">*</span></th>
                                <td><input id="mgrNm" name="mgrNm" type="text" placeholder="이름을 입력하세요." class="w100" onkeyup="this.value = COMMON.truncByBytes(this.value, 50);"/></td>
                            </tr>
                            <tr>
                                <th class="al" >이메일 <span class="text_red">*</span></th>
                                <td><input id="encEmailAddr" name="encEmailAddr" type="email" placeholder="이메일을 입력하세요." class="w100" data-type="email"/></td>
                            </tr>
                            <tr>
                                <th class="al" >연락처</th>
                                <td><input  id="encMobileNo" name="encMobileNo" type="tel" placeholder="- 없이 입력하세요." class="w100" maxlength="11" data-type="mobile" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btnBox ar">
                            <button type="button" onclick="updateBasicInfo()" class="btn_m_blue">기본정보 저장</button>
                        </div>
                    </form>
                </div>

                <div class="myinfoBox">
                    <h3 class="conT">비밀번호</h3>
                    <form id="frmUpdPwd">
                        <input id="mgrNo" name="mgrNo" type="hidden" value="<c:out value="${mgrNo}"/>"/>
                        <table class="table_normal">
                            <colgroup>
                                <col width="30%"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th class="al">현재 비밀번호 <span class="text_red">*</span></th>
                                <td><input id="password" name="password" type="password" placeholder="비밀번호를 입력하세요." maxlength="12" class="w100"/></td>
                            </tr>
                            <tr>
                                <th class="al">새 비밀번호 <span class="text_red">*</span></th>
                                <td><input id="newPassword" name="newPassword" type="password" placeholder="비밀번호를 입력하세요." maxlength="12" class="w100"/></td>
                            </tr>
                            <tr>
                                <th class="al">새 비밀번호 확인 <span class="text_red">*</span></th>
                                <td><input id="newPasswordConfirm" name="newPasswordConfirm" type="password" placeholder="비밀번호를 입력하세요." maxlength="12" class="w100"/></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="text_gray smallFont">※ 비밀번호는 8자 이상으로 알파벳 소대문자, 특수문자, 숫자 혼합으로 구성해야 합니다.</div><br>
                        <div class="btnBox ar">
                            <button type="button" onclick="updatePwd();" class="btn_m_blue">비밀번호 저장</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <div class="layerpopupBottom">
            <a href="javascript:void(0);" onclick="adminS.popup('close','.myInfoChange');">닫기</a>
        </div>
    </div>
</div>
<script>
    $(function(){
        adminS.leftmenu();
        adminS.scrollbar();
    });

    // 내정보 조회
    function selectMyInfo() {

        COMMON.ajaxJsonPost("/my/selectMyInfo", {}, function(data){
            $('#mgrNm').val(data.mgrNm);
            $('#encEmailAddr').val(data.encEmailAddr);
            $('#encMobileNo').val(data.encMobileNo);
            $('#pwdExtendAllowYn').val(data.pwdExtendAllowYn);

            adminS.popup('open','.myInfoChange');

            $(".userBtn").trigger("click");
        });

    }

    // 기본정보 변경
    function updateBasicInfo() {

        if (!$("#mgrNm").val()) {

            COMMON.openAlert("이름을 입력해주세요.", function (){
                $("#mgrNm").focus();
            });

            return false;

        } else if (!$("#encEmailAddr").val()) {

            COMMON.openAlert("이메일을 입력해주세요.", function (){
                $("#encEmailAddr").focus();
            });

            return false;

        } else if (!COMMON.validationForm($("#frmBasicInfo"))) {
            return false;
        }

        // 내정보 변경
        COMMON.ajaxFormPost("/my/updateMyInfo", $("#frmBasicInfo"), function(data){
            COMMON.openAlert(data.resultMsg, function(){
                // 화면전환 없이 부모창 내 로그아웃 옆 내 이름 text 변경
                $("#userName").text('${storeNm}' + ' ' + $("#mgrNm").val());
            });
        });

    }

    // 비밀번호 변경
    function updatePwd() {

        if (!COMMON.pwdValidation()) {
            return false;
        }

        // 비밀번호 변경
        COMMON.ajaxFormPost("/updatePwd", $("#frmUpdPwd"), function(data){
            COMMON.openAlert(data.resultMsg, function (){
                if (data.resultCd != "0000") {
                    $("#password").focus();
                } else {
                    $("#password").val("");
                    $("#newPassword").val("");
                    $("#newPasswordConfirm").val("");
                }
            });
        });

    }

</script>
<!-- header layerpopup -->
