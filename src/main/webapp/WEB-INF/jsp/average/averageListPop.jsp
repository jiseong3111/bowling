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
                    <div class="c-group__key">검색조건 : </div>
                    <div class="c-group__key">
                        <div class="c-forms">
                            <label for="for--search-option" class="is-hidden">검색구분</label>
                            <select id="searchType" class="c-forms__select" name="searchType">
                                <option value="">전체</option>
                                <c:forEach var="result" items="${fxprBfTnList}" varStatus="status">
                                    <option value="${result.FXPRBFTN}">${result.FXPRBFTN}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="c-group__key">검색조건 : </div>
                    <div class="c-group__key">
                        <div class="c-forms">
                            <label for="for--search-option" class="is-hidden">검색구분</label>
                            <select id="searchType1" class="c-forms__select" name="searchType1">
                                <option value="">전체</option>
                                <c:forEach var="result" items="${fxprBfTnList}" varStatus="status">
                                    <option value="${result.FXPRBFDT}">${result.FXPRBFDT}</option>
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
                        <col style="width: 3%" />
                        <col style="width: 10%" />
                        <col style="width: 10%" />
                        <col style="width: 8%" />
                        <col style="width: 10%" />
                        <col style="width: 12%" />
                        <col style="width: 10%" />
                        <col style="width: 10%" />
                        <col style="width: 20%" />
                        <col style="width: 30%" />
                        <col style="width: 5%" />
                        <col style="width: 5%" />
                        <col style="width: 5%" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col" class="c-table__col">번호</th>
                        <th scope="col" class="c-table__col">업체코드</th>
                        <th scope="col" class="c-table__col">쿠폰핀번호</th>
                        <th scope="col" class="c-table__col">회원번호</th>
                        <th scope="col" class="c-table__col">계약번호</th>
                        <th scope="col" class="c-table__col">채널회원식별키</th>
                        <th scope="col" class="c-table__col">쿠폰지급일</th>
                        <th scope="col" class="c-table__col">지급취소일</th>
                        <th scope="col" class="c-table__col">사용일자</th>
                        <th scope="col" class="c-table__col">사용취소일자</th>
                        <th scope="col" class="c-table__col">유효시작일자</th>
                        <th scope="col" class="c-table__col">유효종료일자</th>
                        <th scope="col" class="c-table__col">상태</th>
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
                                    <td class="c-table__data"><c:out value="${result.rnum}"/></td>

                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>

        </div>

        <div class="c-button-group c-button-group--margin-top-lg is-gutter is-right">
            <button type="button" onClick="self.close();" class="c-button c-button--md c-button--gray">닫기</button>
        </div>
    </div>
</form>
</div>

</body>
</html>
