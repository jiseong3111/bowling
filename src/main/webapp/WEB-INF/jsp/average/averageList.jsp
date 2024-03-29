<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8" />
    <title>에버 관리</title>
    <jsp:include page="/WEB-INF/jsp/cmm/menu.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/index.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/login.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/styles.css" type="text/css" />

    <script>
        var popupWidth = 990;
        var popupHeight = 940;
        // 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
        var popupX = (window.screen.width / 2) - (popupWidth / 2);

        // 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
        var popupY= (window.screen.height / 2) - (popupHeight / 2);

        //수정 팝업
        function goView(mbno) {
            var popup= window.open("<c:url value='/average/averageSelectOne.do?mbno='/>"+mbno,"averageSelectOne", "toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,fullscreen=no,scrollbars=yes,top="+popupY+",left="+popupX+",width="+popupWidth+",height="+popupHeight+",screenY=100");
            popup.focus();
        }

        function goSearch() {
            $("#currPage").val("1");
            document.mainForm.action = "<c:url value='/average/averageList.do'/>";
            document.mainForm.submit();
        }

        function goSampleFile(){
            var reqUrl = "<c:url value='/average/sampleDown.do'/>";
            callAjaxException(reqUrl)
        }

        function goUploadFile(){
            var reqUrl = "<c:url value='/average/averageUploadList.do'/>";
            alert("파일 업로드 중입니다...");
            callAjaxException(reqUrl)
        }

        function callAjaxException(reqUrl) {
            var form = $('#mainForm')[0]
            var data = new FormData(form);

            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: reqUrl,
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success:function(data) {
                    if(data.result == "success"){
                        alert("다운로드가 완료 되었습니다.\n"+"경로 : "+data.address);
                    } else if(data.result == "fail"){
                        alert("오류발생#####");
                    } else if(data.result == "notSize"){
                        alert("엑셀에 회원 명단을 다시 확인해 주세요.");
                    } else if(data.result == "excelUpload"){
                        alert("파일 업로드 완료.");
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
<body >
<div class="l-page">
    <form id="mainForm" name="mainForm" method="post">
        <input type="hidden" id="currPage" name="currPage" value="${search.currPage}" />
        <input type="hidden" id="iCnt" name="iCnt" value="0" />
        <input type="hidden" id="searchCurrPage" name="searchCurrPage" value="<c:out value='${search.searchCurrPage}'/>"/>
        <input type="hidden" id="searchPageUnit" name="searchPageUnit" value="<c:out value='${search.searchPageUnit}'/>"/>
        <input type="hidden" name="searchType_org" id="searchType_org" value="${search.searchType}"/>
        <input type="hidden" name="searchText_org" id="searchText_org" value="${search.searchText}"/>

        <div class="l-page__contents">
            <div class="l-tools">
                <div class="l-tools__breadcrumbs">
                    <div class="l-breadcrumbs">
                        홈 &gt; 에버리지 &gt; <span class="l-breadcrumbs__current">에버 관리</span>
                    </div>
                </div>
            </div>
            <div class="l-contents">
                <h1 class="c-h1">에버 관리</h1>
                <div class="c-box">
                    <div class="c-group c-group--flexible">
                        <div class="c-group__row">
                            <div class="c-group__col">
                                <div class="c-group__item">
                                    <div class="c-group__key">회원명 : </div>
                                    <div class="c-group__value">
                                        <div class="c-forms">
                                            <label for="searchType" class="is-hidden">검색키워드</label>
                                            <input type="text" id="searchType" class="c-forms__text"  name="searchType" maxlength="50" value="${search.searchType}" <c:if test="${search.searchType eq '' or search.searchType eq null}"></c:if>/>
                                        </div>
                                    </div>
                                    <div class="c-group__key" style="padding-left: 20px;">회원번호 : </div>
                                    <div class="c-group__value">
                                        <div class="c-forms">
                                            <label for="searchType1" class="is-hidden">검색키워드</label>
                                            <input type="text" id="searchType1" class="c-forms__text"  name="searchType1" maxlength="50" value="${search.searchType1}" <c:if test="${search.searchType1 eq '' or search.searchType1 eq null}"></c:if>/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="c-group__row">
                            <div class="c-group__col">
                                <div class="c-group__key">사용내역 : </div>
                                <div class="c-group__value">
                                    <div>
                                        <input type="file" id="uploadFile" name="uploadFile" class="c-forms__file_sm"/>
                                        <div>
                                            <div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="c-box__button">
                                <button type="button" class="c-button c-button--xs c-button--gray" onclick="goSearch();">조회</button>
                            </div>
                        </div>
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
                            </div>
                            <div class="c-util">
                                <div class="c-util__item">
                                    <button type="button" onClick="goUploadFile()" class="c-button c-button--xs c-button--gray">업로드</button>
                                </div>
                            </div>
                            <div class="c-util">
                                <div class="c-util__item">
                                    <button type="button" onClick="goSampleFile()" class="c-button c-button--xs c-button--gray">샘플파일</button>
                                </div>
                            </div>
                            <div class="c-util">
                                <div class="c-util__item">
                                    <button type="button" onClick="goExcel()" class="c-button c-button--xs c-button--coral"> 엑셀다운</button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="c-table">
                        <table>
                            <colgroup>
                                <col style="width: 13%" />
                                <col style="width: 5%" />
                                <col style="width: 3%" />
                                <col style="width: 3%" />
                                <col style="width: 5%" />
                                <col style="width: 5%" />
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col" class="c-table__col">클럽명</th>
                                <th scope="col" class="c-table__col">회원명</th>
                                <th scope="col" class="c-table__col">순위</th>
                                <th scope="col" class="c-table__col">게임수</th>
                                <th scope="col" class="c-table__col">총점수</th>
                                <th scope="col" class="c-table__col">평균에버</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty resultList}">
                                    <tr>
                                        <td class="c-table__data" colspan="7" align="center">검색된 결과가 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td class="c-table__data"><c:out value="${result.cunm}" /></td>
                                            <td class="c-table__data"><a href="#" onclick="goView('${result.mbno}'); return false;" class="c-link c-link--colored"><c:out value="${result.mbrNm}" /></a></td>
                                            <td class="c-table__data"><c:out value="${result.rank}" /></td>
                                            <td class="c-table__data"><c:out value="${result.ttGmCnt}" /></td>
                                            <td class="c-table__data"><c:out value="${result.ttScr}" /></td>
                                            <td class="c-table__data"><c:out value="${result.avrgScr}" /></td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
