<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script>
    $(document).ready(function(){

    });
</script>
<!-- admin left start -->
<div class="adminLeftLauout">
    <div class="adminLeftLauoutIn">
        <div class="menuToggleBtn">
            <button type="button"><span class="icon-prev"></span></button>
        </div>
        <ul>
            <c:forEach items="${menuList}" var="menu">
                <c:if test="${menu.mgrMenuVOList.size() > 0}">
                <li class="<c:if test='${fn:contains(menu, currMenuId)}'>on</c:if>">
                    <a href="javascript:void(0);">${menu.cdNm}<span class="icon"></span></a>
                    <ul>
                        <c:forEach items="${menu.mgrMenuVOList}" var="menuDetail">
                            <li class="<c:if test='${currMenuId eq menuDetail.execFileNm}'>on</c:if>"><a href="${menuDetail.execFileNm}">${menuDetail.menuNm}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                </c:if>
            </c:forEach>
        </ul>
        <!-- 하단 주소 및 안내 -->
        <div class="leftBottomInfo">
            <ul>
                <li>
                    <div class="title">가맹점 관리 고객센터</div>
                    <div>운영 10:00 ~ 17:00 (주말/공휴일 제외)</div>
                    <div>070-8732-5600</div>
                    <div><a href="javascript:void(0);">pac@bpsoft.co.kr</a></div>
                    <div><a href="www.bpsoft.co.kr" target="_blank">(주)비피그룹(www.bpsoft.co.kr)</a></div>
                </li>
            </ul>
            <div class="copy">
                COPYRIGHT(C) PayAppCafe. ALL RIGHT RESERVED
            </div>
        </div>
        <!-- 하단 주소 및 안내 끝-->
    </div>
</div>
<!-- admin left end -->