<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>쿠폰구독서비스</title>
    <meta name="format-detection" content="telephone=no" />


    <script>

        function chkValidation() {

            if ($("#mbno").val() == "") {
                alert("회원번호를 입력해 주세요.");
                $("#mbno").focus();
                return false;
            }
            if ($("#cuno").val() == "") {
                alert("클럽명을 선택해 주세요.");
                $("#cuno").focus();
                return false;
            }
            if ($("#mbrNm").val() == "") {
                alert("회원명을 입력해 주세요.");
                $("#mbrNm").focus();
                return false;
            }
            if ($("#tno").val() == "") {
                alert("전화번호를 입력해 주세요.");
                $("#tno").focus();
                return false;
            }
            if ($("#emad").val() == "") {
                alert("이메일주소를 입력해 주세요.");
                $("#emad").focus();
                return false;
            }


            return true;
        }

        function goRegister() {
            var strMsg = "저장 하시겠습니까?";
            var reqUrl;

            if (chkValidation()) {
                if (confirm(strMsg)) {
                    if ("${pageType}" == "U") {

                    }
                    else if ("${pageType}" == "I") {
                        reqUrl = "<c:url value='/member/insertMember.do'/>";
                    }

                    callAjaxException(reqUrl);
                }
            }
        }


        function callAjaxException(reqUrl) {
            var form = $("#mainForm")[0];
            var formData = new FormData(form);
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                dataType: "json",
                url: reqUrl,
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {

                    if (data.result == "success") {
                        alert("저장 처리가 완료되었습니다.");
                        self.close();
                        opener.document.location.reload();
                    } else if (data.result == "fail") {
                        alert("저장처리 중 오류가 발생했습니다.");
                    }
                },
                error: function(xhr, status, error) {
                    alert("시스템 오류가 발생하였습니다.\n\n잠시 후 다시 시도해주시기 바랍니다.\n\n( 지속적으로 발생 시 시스템 관리자에게 문의해 주시기 바랍니다");
                }
            });
        }
    </script>
</head>
<body style="justify-content: inherit; background-color: white;">
<form id="mainForm" name="mainForm" method="post">

    <div class="l-popup">
        <c:choose>
            <c:when test="${pageType == 'U'}">
                <h1 class="c-h1">회원 수정</h1>
            </c:when>
            <c:otherwise>
                <h1 class="c-h1">회원 등록</h1>
            </c:otherwise>
        </c:choose>

        <div class="c-section c-section--sm">

            <div class="c-table c-table--type-x">
                <table>
                    <colgroup>
                        <col style="width: 25%" />
                        <col style="width: 25%" />
                        <col style="width: 25%" />
                        <col style="width: 25%" />
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="c-table__row"><span class='c-require'>*</span> 회원번호</th>
                        <td class="c-table__data is-left" >
                            <div class="c-forms">
                                <label for="sndrInfo" class="is-hidden"> 회원번호</label>
                                <input type="text" id="mbno" name="mbno"  maxlength="100"  class="c-forms__text" value="<c:out value='${resultInfo.mbno}'/>"/>
                            </div>
                        </td>
                        <th scope="row" class="c-table__row"><span class='c-require'>*</span> 클럽명</th>
                        <td class="c-table__data is-left" >
                            <div class="c-forms">
                                <label for="cuno" class="is-hidden"> 클럽명</label>
                                <select id="cuno" class="c-forms__select"  name="cuno" >
                                    <option value="">선택</option>
                                    <c:forEach var="result" items="${cuList}" varStatus="status">
                                        <option value="${result.cuno}" ${result.cuno eq resultInfo.cuno ? 'selected="selected"' : ''}><c:out value='${result.cunm}'/></option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="c-table__row"><span class='c-require'>*</span> 회원명</th>
                        <td class="c-table__data is-left" >
                            <div class="c-forms">
                                <label for="mbrNm" class="is-hidden"> 회원명</label>
                                <input type="text" id="mbrNm" name="mbrNm"  maxlength="100"  class="c-forms__text" value="<c:out value='${resultInfo.mbrNm}'/>"/>
                            </div>
                        </td>
                        <th scope="row" class="c-table__row"><span class='c-require'>*</span> 전화번호</th>
                        <td class="c-table__data is-left" >
                            <div class="c-forms">
                                <label for="tno" class="is-hidden"> 전화번호</label>
                                <input type="text" id="tno" name="tno"  maxlength="100"  class="c-forms__text" value="<c:out value='${resultInfo.tno}'/>"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="c-table__row"><span class='c-require'>*</span> 이메일주소</th>
                        <td class="c-table__data is-left" >
                            <div class="c-forms">
                                <label for="emad" class="is-hidden"> 이메일주소</label>
                                <input type="text" id="emad" name="emad"  maxlength="100"  class="c-forms__text" value="<c:out value='${resultInfo.emad}'/>"/>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="c-button-group c-button-group--margin-top-lg is-gutter is-right">
            <c:choose>
                <c:when test="${pageType == 'U'}">
                    <button type="button" onClick="goRegister()" class="c-button c-button--md">수정</button>
                    <button type="button" onClick="self.close();" class="c-button c-button--md c-button--gray">닫기</button>
                </c:when>
                <c:otherwise>
                    <button type="button" onClick="goRegister()" class="c-button c-button--md">저장</button>
                    <button type="button" onClick="self.close();" class="c-button c-button--md c-button--gray">닫기</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</form>
</body>
</html>
