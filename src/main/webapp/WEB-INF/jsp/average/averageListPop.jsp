<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>쿠폰구독 서비스</title>
    <meta name="format-detection" content="telephone=no" />

    <script>
       /* $(document).ready(function(){
            $("#fGame,#sGame,#tGame").keyup(function(){
                var fGame = $('#fGame').val();
                var sGame = $('#sGame').val();
                var tGame = $('#tGame').val();
                var total = Number(fGame)+Number(sGame)+Number(tGame);
                var avrg = Number(total)/3;
                $('#spanttScr').html(total);
                $('#ttScr').val(total);
                $('#spanavrgScr').html(Math.floor(avrg));
                $('#avrgScr').val(Math.floor(avrg));
            });

        });*/

        function ttChg(index){
            var fGame = $('#fGame'+index).val();
            var sGame = $('#sGame'+index).val();
            var tGame = $('#tGame'+index).val();
            var gmCnt = 0;
            if(fGame > 0){
                gmCnt++;
            }
            if(sGame > 0){
                gmCnt++;
            }
            if(tGame > 0){
                gmCnt++;
            }
            var total = Number(fGame)+Number(sGame)+Number(tGame);
            var avrg = Number(total)/3;
            $('#spanttScr'+index).html(total);
            $('#gmCnt'+index).html(gmCnt);
            $('#ttScr'+index).val(total);
            $('#spanavrgScr'+index).html(Math.floor(avrg));
            $('#avrgScr'+index).val(Math.floor(avrg));
        }
        function goSearch() {
            $("#currPage").val("1");
            document.listForm.action = "<c:url value='/average/averageSelectOne.do'/>";
            document.listForm.submit();
        }

        function goRegister() {
            var strMsg = "저장 하시겠습니까?";
            var reqUrl;

            if (confirm(strMsg)) {
                reqUrl = "<c:url value='/average/updateAverage.do'/>";

                callAjaxException(reqUrl);
            }
        }

        function callAjaxException(reqUrl) {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: reqUrl,
                data: $("#listForm").serialize(),
                success: function(data) {

                    if (data.result == "success") {
                        alert("저장 처리가 완료되었습니다.");
                        self.close();
                        opener.document.location.reload();
                    } else if (data.result == "fail") {
                        alert("저장처리 중 오류가 발생했습니다.");
                        location.reload();
                    }
                },
                error: function(xhr, status, error) {
                    alert("시스템 오류가 발생하였습니다.\n\n잠시 후 다시 시도해주시기 바랍니다.\n\n( 지속적으로 발생 시 시스템 관리자에게 문의해 주시기 바랍니다");
                }
            });
        }


    </script>
</head>
<body>
<form id="listForm" name="listForm" method="post">
    <input type="hidden" id="currPage" name="currPage"/>
    <input type="hidden" id="searchCurrPage" name="searchCurrPage" value="<c:out value="${search.searchCurrPage}"/>"/>
    <input type="hidden" id="searchPageUnit" name="searchPageUnit" value="<c:out value="${search.searchPageUnit}"/>"/>
    <input type="hidden" name="searchType_org" id="searchType_org" value="${search.searchType}"/>
    <input type="hidden" name="searchType1_org" id="searchType1_org" value="${search.searchType1}"/>
    <input type="hidden" name="searchText_org" id="searchText_org" value="${search.searchText}"/>
    <input type="hidden" name="mbno" id="mbno" value="${averageVo.mbno}"/>
    <div class="l-contents">
        <h1 class="c-h1">[${resultList.get(0).mbrNm}] 에버 수정</h1>

        <div class="c-box">
            <div class="c-group c-group--flexible">
                <div class="c-group__row">
                    <div class="c-group__col">
                        <div class="c-group__item">
                            <div class="c-group__key">클럽명 :</div>
                            <div class="c-group__value">
                                <c:out value="${resultList.get(0).cunm}"/>

                            </div>
                        </div>
                    </div>
                    <div class="c-group__col">
                        <div class="c-group__item">
                            <div class="c-group__key">회원번호 :</div>
                            <div class="c-group__value">
                                <c:out value="${resultList.get(0).mbno}"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="c-group__row">
                    <div class="c-group__key">정기전회차 : </div>
                    <div class="c-group__key">
                        <div class="c-forms">
                            <label for="for--search-option" class="is-hidden">검색구분</label>
                            <select id="searchType" class="c-forms__select" name="searchType">
                                <option value="">전체</option>
                                <c:forEach var="result" items="${fxprBfTnList}" varStatus="status">
                                    <option value="${result.FXPRBFTN}" ${result.FXPRBFTN eq search.searchType ? 'selected="selected"' : ''}>${result.FXPRBFTN}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="c-group__key">정기전일자 : </div>
                    <div class="c-group__key">
                        <div class="c-forms">
                            <label for="for--search-option" class="is-hidden">검색구분</label>
                            <select id="searchType1" class="c-forms__select" name="searchType1">
                                <option value="">전체</option>
                                <c:forEach var="result" items="${fxprBfTnList}" varStatus="status">
                                    <option value="${result.FXPRBFDT}" ${result.FXPRBFDT eq search.searchType1 ? 'selected="selected"' : ''}>${result.FXPRBFDT}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="c-box__button">
                <button type="button" onClick="goSearch()" class="c-button c-button--xs c-button--gray">조회</button>
            </div>
        </div>

        <div class="c-section c-section--lg">

            <div class="c-aligner c-aligner--type-table c-aligner--margin-bottom-sm">
                <div class="is-left is-bottom">
                    <div class="c-list-info">
                        전체 <span class="c-list-info__number"><fmt:formatNumber value="${page.totalRecordCount}" pattern="#,###" /></span>건, <span class="c-list-info__number"><fmt:formatNumber value="${page.currentPageNo}" pattern="#,###" /> / <fmt:formatNumber value="${page.totalPageCount}" pattern="#,###" /></span> 페이지
                    </div>
                </div>
                <div class="is-right is-bottom">
                    <div class="c-util">
                        <div class="c-util__item">
                            <div class="c-forms is-reduce">
                                <label for="for--list-num" class="is-hidden">리스트수</label>
                                <select id="pageUnit" name="pageUnit" onChange="jsPage('1')" class="c-forms__select">
                                    <option value="10"  ${search.pageUnit eq '10' ? 'selected="selected"' : ''}>10</option>
                                    <option value="20"  ${search.pageUnit eq '20' ? 'selected="selected"' : ''}>20</option>
                                    <option value="30"  ${search.pageUnit eq '30' ? 'selected="selected"' : ''}>30</option>
                                    <option value="50"  ${search.pageUnit eq '50' ? 'selected="selected"' : ''}>50</option>
                                    <option value="100" ${search.pageUnit eq '100' ? 'selected="selected"' : ''}>100</option>
                                    <select>
                            </div>
                        </div>
                        <div class="c-util">
                            <div class="c-util__item">
                                <button type="button" id="excelBtn" onClick="goExcel()" class="c-button c-button--xs c-button--coral"<c:if test="${page.totalRecordCount eq 0}">disabled="disabled"</c:if> >엑셀다운</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="c-table">
                <table>
                    <colgroup>
                        <col style="width: 10%" />
                        <col style="width: 4%" />
                        <col style="width: 6%" />
                        <col style="width: 6%" />
                        <col style="width: 8%" />
                        <col style="width: 6%" />
                        <col style="width: 6%" />
                        <col style="width: 6%" />
                        <col style="width: 4%" />
                        <col style="width: 6%" />
                        <col style="width: 6%" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="c-table__col">클럽명</th>
                        <th scope="col" class="c-table__col">회원번호</th>
                        <th scope="col" class="c-table__col">회원명</th>
                        <th scope="col" class="c-table__col">정기전회차</th>
                        <th scope="col" class="c-table__col">정기전일자</th>
                        <th scope="col" class="c-table__col">첫번째 게임</th>
                        <th scope="col" class="c-table__col">두번째 게임</th>
                        <th scope="col" class="c-table__col">세번째 게임</th>
                        <th scope="col" class="c-table__col">총 게임수</th>
                        <th scope="col" class="c-table__col">총점</th>
                        <th scope="col" class="c-table__col">평균점수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty resultList}">
                            <tr>
                                <td class="c-table__data" colspan="13" align="center">검색된 결과가 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="result" items="${resultList}" varStatus="status">
                                <tr>
                                    <td class="c-table__data"><c:out value="${result.cunm}"/></td>
                                    <td class="c-table__data"><c:out value="${result.mbno}"/></td>
                                    <td class="c-table__data"><c:out value="${result.mbrNm}"/></td>
                                    <td class="c-table__data"><c:out value="${result.fxprBfTn}"/></td>
                                    <td class="c-table__data"><c:out value="${result.fxprBfdt}"/></td>
                                    <td class="c-table__data"><input type="text" id="fGame${status.index}" name="fGame" style="min-width: 60px; width: 60px;" onkeyup="ttChg(${status.index})" class="c-forms__text" value="<c:out value="${result.fGame}"/>"/></td>
                                    <td class="c-table__data"><input type="text" id="sGame${status.index}" name="sGame" style="min-width: 60px; width: 60px;" onkeyup="ttChg(${status.index})" class="c-forms__text" value="<c:out value="${result.sGame}"/>"/></td>
                                    <td class="c-table__data"><input type="text" id="tGame${status.index}" name="tGame" style="min-width: 60px; width: 60px;" onkeyup="ttChg(${status.index})" class="c-forms__text" value="<c:out value="${result.tGame}"/>"/></td>
                                    <td class="c-table__data"><span id="gmCnt${status.index}"><c:out value="${result.gmCnt}"/></span></td>
                                    <td class="c-table__data"><span id="spanttScr${status.index}" name="spanttScr"><c:out value="${result.ttScr}"/></span></td>
                                    <td class="c-table__data"><span id="spanavrgScr${status.index}" name="spanavrgScr"><c:out value="${result.avrgScr}"/></span></td>
                                    <input type="hidden" id="ttScr${status.index}" name="ttScr" value="<c:out value="${result.ttScr}"/>"/>
                                    <input type="hidden" id="avrgScr${status.index}" name="avrgScr" value="<c:out value="${result.avrgScr}"/>"/>
                                    <input type="hidden" id="fxprBfTn${status.index}" name="fxprBfTn" value="<c:out value="${result.fxprBfTn}"/>"/>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>

        </div>

        <div class="c-button-group c-button-group--margin-top-lg is-gutter is-right">
            <button type="button" onClick="goRegister()" class="c-button c-button--md">저장</button>
            <button type="button" onClick="self.close();" class="c-button c-button--md c-button--gray">닫기</button>
        </div>
    </div>
</form>
</div>

</body>
</html>
