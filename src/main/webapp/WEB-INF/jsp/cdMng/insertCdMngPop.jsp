<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>쿠폰구독서비스</title>
    
    <script>

         
         function goRegister() {
             var strMsg = "저장하시겠습니까?"
             var reqUrl;
             if(confirm(strMsg)){
                 if ("${pageType}" == "U") {
                     reqUrl = "<c:url value='/cdMng/updateCd.do'/>";
                 }
                 else if ("${pageType}" == "I") {
                     reqUrl = "<c:url value='/cdMng/insertCd.do'/>";
                 }
                 callAjaxException(reqUrl);
             }             
         }

         function goSelect(obj) {
             $('#cdItceVl').val("");
             
             var codeLth=obj.value;
             
             document.listForm.cdLth.value=codeLth.split('/')[1];
             document.listForm.cdGrpId.value=codeLth.split('/')[0];
             
             cdIdMaxLength = $('#cdLth').val();
             $('#cdItceVl').attr('maxlength', cdIdMaxLength);
         }           
    
        
        function callAjaxException(reqUrl) {
            $.ajax({
                type : "POST",
                dataType : "json",
                url : reqUrl,
                data : $("#listForm").serialize(),
                success:function(data) {
                    if (data.result == "success") {
                        alert('저장이 완료되었습니다.');
                        window.close();
                        opener.document.location.reload();
                    }
                    else if (data.result == "fail") {
                        if (data.code == "E1") {
                            alert("저장처리 중 오류가 발생하셨습니다.");
                        }
                        if (data.code == "E2") {
                            alert("중복된 코드아이디가 존재합니다.");
                            $("#cdItceVl").focus();
                            
                        }                        
                    }
                },
                error:function(xhr, status, error){
                    alert("Error");
                }
            });
        }        
        
  
        $(document).ready(function(){
          var cdItceVl=  $("#cdItceVl").val();
          if(cdItceVl != ""){
              $("#cdItceVl").attr("readonly",true);
          }else{
              $("#cdItceVl").attr("readonly",false);
          }  
          //한글입력 안되게 처리
          $("input[name=cdItceVl]").keyup(function(event){ 
              if (!(event.keyCode >=37 && event.keyCode<=40)) {
                  var inputVal = $(this).val();
                  $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
              }
          });
        });
    </script>
</head>
<body>
    <form:form id="listForm" name="listForm" method="post">
     <input type="hidden" id="cdGrpId" name="cdGrpId"  value='${resultList.cdGrpId}' />
     <input type="hidden" id="cdItceVl2" name="cdItceVl2"  value='${resultList.cdItceVl}' />
    <div class="l-popup">
        <h1 class="c-h1">코드${pageType eq "U" ? "수정" : "등록" }</h1>    
        <div class="c-section">
              <div class="c-section c-section--sm">
                    <div class="c-table c-table--type-x">
                        <table>
                            <colgroup>
                                <col style="width: 12%" />
                                <col style="width: 38%" />
                                <col style="width: 12%" />
                                <col style="width: 38%" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row" class="c-table__row"><span class='c-require'>*</span>코드그룹</th>
                                    <td class="c-table__data is-left">
                                        <div class="c-forms">
                                            <label for="for--admin-name" class="is-hidden">코드그룹</label>
                                            <c:choose>
                                                <c:when test="${empty resultList}">
                                                    <select id="for--admin-ch" name="cdGrdSel" class="c-forms__select" onchange="goSelect(this);">
                                                        <option value="0000/">코드그룹선택</option>
                                                        <c:forEach var="result" items="${cdGrdList}" varStatus="status">
                                                            <option value="${result.cdGrpId}/${result.cdLth}"><c:out value="[${result.cdGrpId}] ${result.cdGrpNm}" /></option>
                                                        </c:forEach>
                                                    </select>  
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" id="for--admin-name" name="" class="c-forms__text" value='${resultList.cdGrpId}' ${!empty (resultList.cdGrpId)? 'readonly' : ''}/>
                                                </c:otherwise>
                                            </c:choose>                                              
                                        </div>
                                    </td>
                                    <th scope="row" class="c-table__row"><span class='c-require'>*</span>코드길이</th>
                                    <td class="c-table__data is-left">
                                        <div class="c-forms">
                                            <label for="for--admin-name" class="is-hidden">코드길이</label>
                                            <input type="text" id="cdLth" name="cdLth" class="c-forms__text" value='${resultList.cdLth}' readonly ${empty (resultList.cdLth)? 'placeholder="코드그룹 선택시 자동으로 선택됩니다"' : ''}/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="c-table__row"><span class='c-require'>*</span>코드아이디</th>
                                          <td class="c-table__data is-left">
                                        <div class="c-forms">
                                            <label for="for--admin-name" class="is-hidden">코드아이디</label>
                                            <input type="text" id="cdItceVl" name="cdItceVl" class="c-forms__text" value='${resultList.cdItceVl}' maxlength='${resultList.cdLth}'  />
                                        </div>
                                    </td>
                                    <th scope="row" class="c-table__row"><span class='c-require'>*</span>코드명</th>
                                    <td class="c-table__data is-left">
                                        <div class="c-forms">
                                            <label for="for--admin-name" class="is-hidden">코드명</label>
                                            <input type="text" id="cdItceNm" name="cdItceNm" class="c-forms__text" value='${resultList.cdItceNm}' />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="c-table__row"><span class='c-require'>*</span>정렬순서</th>
                                          <td class="c-table__data is-left">
                                        <div class="c-forms">
                                            <label for="for--admin-name" class="is-hidden">정렬순서</label>
                                            <input type="text" id="sortSeq" name="sortSeq" class="c-forms__text" value='${resultList.sortSeq}' maxlength="4" />
                                        </div>
                                    </td>
                                    <th scope="row" class="c-table__row"><span class='c-require'>*</span>사용여부</th>
                                    <td class="c-table__data is-left">
                                        <div class="c-selection__item">
                                        <div class="c-forms">
                                            <input type="radio" name="useYn" id="for--type-menu" class="c-forms__radio" ${resultList.cdUseYn eq 'Y' || resultList.cdUseYn ne 'N' ? 'checked="checked"' : ''}  value="Y"/> 
                                            <label for="for--type-menu" class="c-forms__label">YES</label>
                                        </div>
                                        </div>
                                        <div class="c-selection__item">
                                        <div class="c-forms">
                                            <input type="radio" name="useYn" id="for--type-program"  class="c-forms__radio" ${resultList.cdUseYn eq 'N' ? 'checked="checked"' : ''} value="N"/>
                                            <label for="for--type-program" class="c-forms__label">NO</label>
                                        </div>
                                    </div>
                                    </td>
                                </tr>                                
                                <tr>
                                    <th scope="row" class="c-table__row"><span class='c-require'>*</span>코드설명</th>
                                    <td class="c-table__data is-left" colspan="3">
                                        <div class="c-forms is-extend">
                                            <label for="for--admin-name" class="is-hidden">코드설명</label>
                                            <input type="text" id="cdItceExpl" name="cdItceExpl" class="c-forms__text" value='${resultList.cdItceExpl}' />
                                        </div>
                                    </td>
                              
                                </tr>
                                <tr>
                                    <th scope="row" class="c-table__row">등록자</th>
                                    <td class="c-table__data is-left">  
                                    <c:if test="${resultList.lastChgrId != '' and resultList.lastChgrId != null}">
                                        <c:out value="${resultList.fstRgntNm} (${resultList.fstRgntId})"/>
                                    </c:if>
                                    </td>
                                    <th scope="row" class="c-table__row">등록일시</th>
                                    <td class="c-table__data is-left">
                                    <c:out value="${resultList.fstRegDttm}"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="c-table__row">최종변경자</th>
                                    <td class="c-table__data is-left">
                                    <c:if test="${resultList.lastChgrId != '' and resultList.lastChgrId != null}">
                                        <c:out value="${resultList.lastChgrNm} (${resultList.lastChgrId})"/>
                                    </c:if>
                                    </td>
                                    <th scope="row" class="c-table__row">최종변경일시</th>
                                    <td class="c-table__data is-left">
                                     <c:out value="${resultList.lastChngDttm}"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="c-button-group c-button-group--margin-top-lg is-gutter is-right">
                    <button type="button" class="c-button c-button--lg" onclick = "goRegister();" >저장</button>
                    <button type="button" class="c-button c-button--lg c-button--black" onclick = "goCancel();">닫기</button>
                </div>
        </div>
    </div>
    </form:form>
</body>
</html>
