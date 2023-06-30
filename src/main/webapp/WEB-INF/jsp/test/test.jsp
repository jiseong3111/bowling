<%--
  Created by IntelliJ IDEA.
  User: 82109
  Date: 2023-06-21
  Time: 오후 6:19
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/include/header.jsp" %>
<%@ include file="/WEB-INF/jsp/include/navigation.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: LIMGY
  Date: 2022-12-05
  Time: 오후 12:23
  To change this template use File | Settings | File Templates.
--%>
<%--화면에 들어갈 body 입력하기 adminContentLayout div 부터 입력 start--%>
<div class="adminContentLayout">
    <div class="adminContentLayoutIn scrollbar-outer">
        <div class="adCTopNavi">
            <h2>회원관리</h2>
            <div class="adCTR">
                <ul>
                    <li><span class="icon-home2"></span></li>
                    <li><span>회원/거래조회</span></li>
                    <li><span>회원관리</span></li>
                </ul>
            </div>
        </div>
        <form id="frmSearch">
            <input type="hidden" name="searchType" value="S">
            <!-- 검색 영역-->
            <div class="serarchBox list">
                <div class="serarchBoxIn">
                    <ul>
                        <li class="block">
                            <strong>가입기간</strong>
                            <div class="mlCont">
                                <ul class="inputList">
                                    <li><input type="radio" name="period" value="W01" id="period01W" <c:out value="${searchVO.period eq 'W01' ? 'checked' : ''}"/>><label for="period01W"><span>1주일</span></label></li>
                                    <li><input type="radio" name="period" value="M01" id="period01M" <c:out value="${searchVO.period eq 'M01' ? 'checked' : ''}"/>><label for="period01M"><span>1개월</span></label></li>
                                </ul>
                                <span class="calendarBox">
                                        <span class="front">
                                            <input type="text" class="from" name="fromDate" id="fromDate" value="<c:out value='${searchVO.fromDate}'/>" readonly="readonly">
                                        </span>
                                        <span class="gap">~</span>
                                        <span class="back">
                                            <input type="text" class="to" name="toDate" id="toDate" value="<c:out value='${searchVO.toDate}'/>" readonly="readonly">
                                        </span>
                                    </span>
                            </div>
                        </li>
                        <li class="block">
                            <strong>가맹점</strong>
                            <div class="mlCont">
                                <ul class="inputList">
                                    <li>
                                        <select class="width200" name="repStoreNo" onchange="COMMON.changeRepStoreNo(this);">
                                            <option value="">전체</option>
                                            <c:forEach items="${repStoreList}" var="repStore">
                                                <option value="<c:out value="${repStore.storeNo}" />" <c:out value="${repStore.repStoreNo eq searchVO.repStoreNo ? 'selected' : ''}"/>><c:out value="[${repStore.storeNo}]${repStore.storeNm}" /></option>
                                            </c:forEach>
                                        </select>
                                    </li>
                                    <li>
                                        <select class="width200" name="storeNo" <c:out value="${empty storeList ? 'disabled' : ''}"/>>
                                            <option value="">전체</option>
                                            <c:forEach items="${storeList}" var="store">
                                                <option value="<c:out value="${store.storeNo}" />" <c:out value="${store.storeNo eq searchVO.storeNo ? 'selected' : ''}"/>><c:out value="[${store.storeNo}]${store.storeNm}" /></option>
                                            </c:forEach>
                                        </select>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="block">
                            <strong>회원상태</strong>
                            <div class="mlCont">
                                <ul class="inputList ">
                                    <li><input type="checkbox" id="payMethodAll" ${empty searchVO.storeMbrStatusCdList ? 'checked' : ''} data-type="ALL"><label for="payMethodAll">전체</label></li>
                                    <c:forEach items="${storeMbrStatusCdList}" var="payMethodCd" varStatus="status">
                                        <li>
                                            <input type="checkbox" data-type="ONE"
                                                   name="storeMbrStatusCdList[<c:out value="${status.index}" />].cd"
                                                   id="payMethod<c:out value="${status.index}" />" value="<c:out value="${payMethodCd.cd}" />"
                                                ${searchVO.storeMbrStatusCdList[status.index].cd eq  payMethodCd.cd ? 'checked' : ''}>
                                            <label for="payMethod<c:out value="${status.index}" />"><c:out value="${payMethodCd.cdNm}" /></label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                        <li class="block">
                            <strong>검색조건 </strong>
                            <div class="mlCont">
                                <ul class="inputList">
                                    <li>
                                        <select name="searchColumn" id="searchColumn">
                                            <option value ="">전체</option>
                                            <option value="accountId"      <c:out value="${searchVO.searchColumn eq 'accountId' ? 'selected' : ''}" />>계정아이디</option>
                                            <option value="accountNm"      <c:out value="${searchVO.searchColumn eq 'accountNm' ? 'selected' : ''}" />>계정명</option>
                                            <option value="repStoreNm"     <c:out value="${searchVO.searchColumn eq 'repStoreNm' ? 'selected' : ''}" />>대표가맹점</option>
                                            <option value="bizNo"          <c:out value="${searchVO.searchColumn eq 'bizNo' ? 'selected' : ''}" />>사업자등록번호</option>
                                        </select>
                                    </li>
                                    <li>
                                        <input type="text" name="searchData" id="searchData" value="<c:out value="${searchVO.searchData}" />" <c:out value="${empty searchVO.searchColumn || searchVO.searchColumn eq '' ? 'readonly' : ''}" /> />
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <button type="button" class="serarchBtn" onclick="goSearch(1); return false;"><span class="icon-search"></span><span>검색</span>
                    </button>
                </div>
            </div>
            <!-- 검색 영역-->

            <!-- table -->
            <div class="tableHead mb12">
                <div class="tableHeadL smallFont text_gray">
                    <span>검색결과</span> <strong class="text_blue"><fmt:formatNumber type="number" maxFractionDigits="0" value="${selectStoreMbrListCount}" /></strong> <span>건 </span>
                </div>
                <div class="tableHeadR ar">
                    <select onchange="goSearch(1, $(this).val());">
                        <option value="20"  <c:out value="${searchVO.pageSize eq 20  ? 'selected' : ''}" />>20개</option>
                        <option value="50"  <c:out value="${searchVO.pageSize eq 50  ? 'selected' : ''}" />>50개</option>
                        <option value="100" <c:out value="${searchVO.pageSize eq 100 ? 'selected' : ''}" />>100개</option>
                    </select>
                </div>
            </div>

            <!-- table list -->
            <div class="tableWrap mb50">
                <table class="table_normal list">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>계정아이디</th>
                        <th>계정명</th>
                        <th>대표가맹점</th>
                        <th>사업자등록번호</th>
                        <th>회원상태</th>
                        <th>가입일시</th>
                        <th>탈퇴일시</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${selectStoreMbrListCount gt 0}">
                            <c:forEach items="${storeMbrList}" var="list">
                                <tr>
                                    <td class="ac"><c:out value="${list.rowNo}"/></td>
                                    <td class="ac"><a onclick="storeMemberDetail(${list.mbrNo})"><c:out value="${list.encConnectAcctId}"/></a></td>
                                    <td class="ac"><c:out value="${list.encConnectAcctNm}"/></td>
                                    <td class="ac"><c:out value="${list.storeNm}"/></td>
                                    <td class="ac"><c:out value="${list.bizNo}"/></td>
                                    <td class="ac"><c:out value="${list.mbrStatusCdNm}"/></td>
                                    <td class="ac"><c:out value="${list.joinDate}"/></td>
                                    <td class="ac"><c:out value="${list.leaveDate}"/></td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td class="ac" colspan="8">데이터가 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </form>

        <!-- 상세페이지로 이동시 form -->
        <form id="frmStoreMbrDetail" action="/member/storeMemberDetail" method="post">
            <input type="hidden" name="mbrNo" value="">
        </form>
    </div>
</div>
<%--화면에 들어갈 body 입력하기 end--%>

<script>
    $(function (){
        init();
    });

    function init() {
        $('.scrollbar-outer').scrollbar(); // Layout Scroll 가능하도록 추가
        adminS.datepikerS(); // 검색 조건 내 기간 datepicker 추가
    }

    // 검색
    function goSearch(pageNo, pageSize) {

        if (!COMMON.validationDate("M", 1)) {
            return false;
        }

        // pageNo에 값이 있다는 것은 페이지 이동을 클릭했다는 의미이므로 pagination 내 form에 이동할 페이지를 입력한다.
        if (pageNo == 0 || pageNo) {
            $("#currPageNo").val(pageNo);
            // offset 의 경우 index 를 기준으로 진행하기 때문에 실제 pageNo 에서 -1 을 진행한다.
            $("#offset").val((pageNo - 1) * $("#pageSize").val());
        }

        if (pageSize) {
            $("#pageSize").val(pageSize);
        }

        var frmSearch = $("#frmSearch");
        frmSearch.attr("action", "/member/storeMember");
        frmSearch.attr("method", "post");
        frmSearch.submit();
    }

    // 상세페이지 이동
    function storeMemberDetail(mbrNo) {
        $("#frmStoreMbrDetail input[name=mbrNo]").val(mbrNo);
        $("#frmStoreMbrDetail").submit();
    }
</script>
</body>
</html>
