<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>쿠폰구독서비스</title>
    <meta name="format-detection" content="telephone=no" />
    <jsp:include page="/WEB-INF/jsp/cmm/menu.jsp"/>
    <script>
        function popup(url){
            var popup = window.open(url, "CdMng", "width=900,height=600");
            popup.focus();
        }
    </script>
</head>
<body>
    <div class="l-page">
    
        <form:form id="listForm" name="listForm" method="post">
        <div class="l-page__contents">
            <div class="l-tools">
                <div class="l-tools__breadcrumbs">
                    <div class="l-breadcrumbs">
                        홈 &gt; 시스템관리 &gt; <span class="l-breadcrumbs__current">코드관리</span>
                    </div>
                </div>
            </div>
            <div class="l-contents">
                <h1 class="c-h1">코드관리</h1>


                <div class="c-box">
                    <div class="c-group c-group--flexible">
                        <div class="c-group__row">
                            <div class="c-group__col">
                                <div class="c-group__item">
                                    <div class="c-group__key">
                                        <div class="c-forms">
                                        
                                            <label for="for--search-category" class="is-hidden">카테고리</label>
                                            <select id="searchType" name="searchType" class="c-forms__select" onchange="searchTypeClear();">
                                                <option value="" >검색구분</option>
                                                <option value="0" ${search.searchType eq '0' ? 'selected="selected"' : ''}>코드아이디</option>
                                                <option value="1" ${search.searchType eq '1' ? 'selected="selected"' : ''}>코드명</option>
                                                <option value="2" ${search.searchType eq '2' ? 'selected="selected"' : ''}>코드그룹아이디</option>
                                                <option value="3" ${search.searchType eq '3' ? 'selected="selected"' : ''}>코드그룹명</option>
                                            </select>
                                        </div>
                                    </div>           
                                    <div class="c-group__value">
                                        <div class="c-forms">
                                            <label for="for--keyword" class="is-hidden">검색키워드</label>
                                            <input type="text" id="searchText" name="searchText" maxlength="100" value='<c:out value="${search.searchText}" escapeXml="false"/>' class="c-forms__text"  <c:if test="${search.searchType eq '' or search.searchType eq null}">disabled="disabled"</c:if>/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            
                        </div>
                    </div>

                    <div class="c-box__button">
                        <button type="button" class="c-button c-button--xs c-button--gray" onclick="goSearch()">조회</button>
                    </div>
                </div>
                <div class="c-section c-section--lg">
                    <input type="hidden" name="currPage" value=""/>
                    <div class="c-aligner c-aligner--type-table c-aligner--margin-bottom-sm">
                        <div class="is-left is-bottom">
                            <div class="c-list-info">
                                전체 <span class="c-list-info__number">${page.totalRecordCount}</span>건, <span class="c-list-info__number">${page.currentPageNo} / ${page.totalPageCount}</span> 페이지&nbsp&nbsp&nbsp&nbsp(코드아이디값 * 는 코드그룹인 데이터를 의미합니다.)
                            </div>
                        </div>
                        <div class="is-right is-bottom">
                            <div class="c-util">
                                <div class="c-util">
                                    <div class="c-util__item">
                                        <button type="button" onClick="goExcel()" class="c-button c-button--xs c-button--coral" <c:if test="${page.totalRecordCount eq 0}">disabled="disabled"</c:if>>엑셀다운</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="c-table">
                        <table>
                            <colgroup>
                                <col style="width: 5%" />
                                <col style="width: 5%" />
                                <col style="width: 15%" />
                                <col style="width: 10%" />
                                <col style="width: 15%" />
                                <col style="width: 5%" />
                                <col style="width: 45%" />
                                <col style="width: 5%" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col" class="c-table__col">번호</th>
                                    <th scope="col" class="c-table__col">코드그룹아이디</th>
                                    <th scope="col" class="c-table__col">코드그룹명</th>
                                    <th scope="col" class="c-table__col">코드아이디</th>
                                    <th scope="col" class="c-table__col">코드명</th>
                                    <th scope="col" class="c-table__col">코드정렬순서</th>
                                    <th scope="col" class="c-table__col">코드설명</th>
                                    <th scope="col" class="c-table__col">사용여부</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${empty resultList}">
                                    <tr>
                                        <td class="c-table__data" colspan="8" align="center">검색된 결과가 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="result" items="${resultList}" varStatus="status">
                                        <tr>
                                            <td class="c-table__data"><c:out value="${result.rnum}" /></td>
                                            <td class="c-table__data"><a href="javascript:popup('<c:url value="/cdMng/insertCdGrdForm.do?cdGrpId=${result.cdGrpId}"/>');"  class="c-link c-link--colored"><c:out value="${result.cdGrpId}" /></a></td>
                                            <td class="c-table__data is-left"><c:out value="${result.cdGrpNm}" escapeXml="false"/></td>
                                            <td class="c-table__data">
                                            <c:choose>
                                                <c:when test="${result.cdItceVl !='*'}" >
                                                    <a href="javascript:popup('<c:url value="/cdMng/insertCdGrdForm.do?cdGrpId=${result.cdGrpId}&cdItceVl=${result.cdItceVl}"/>');"   class="c-link c-link--colored"><c:out value="${result.cdItceVl}" escapeXml="false"/></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value="${result.cdItceVl}" />                                    
                                                </c:otherwise>
                                            </c:choose>
                                            </td>
                                            <td class="c-table__data is-left"><c:out value="${result.cdItceNm}" escapeXml="false"/></td>
                                            <td class="c-table__data is-left">
                                                <c:if test="${result.cdItceVl !='*'}" >
                                                    <c:out value="${result.sortSeq}" />
                                                </c:if>
                                            </td>
                                            <td class="c-table__data" style="text-align: left">
                                                <c:choose>
                                                    <c:when test="${fn:length( result.cdItceExpl ) > 50}">
                                                        <c:out value="${fn:substring(result.cdItceExpl,0,50)} ..." escapeXml="false"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="${result.cdItceExpl}" escapeXml="false"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="c-table__data"><c:out value="${result.useYn}" /></td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="c-button-group c-button-group--margin-top-lg is-gutter is-right">
                        <button type="button" class="c-button c-button--lg c-button--blue-line" onclick="popup('<c:url value="/cdMng/insertCdGrdForm.do"/>')">코드그룹신규등록</button>
                        <button type="button" class="c-button c-button--lg c-button--blue-line" onclick="popup('<c:url value="/cdMng/insertCdForm.do"/>')">코드신규등록</button>
                    </div>                    


                </div>
            </div>
        </div>
        </form:form>    
    </div>
</body>
</html>
