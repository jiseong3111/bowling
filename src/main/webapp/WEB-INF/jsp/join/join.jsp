<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="/statics/css/font3.css" />
<link rel="stylesheet" type="text/css" href="/statics/css/hompage.css" />
<html>
<body>
<div class="wrap subpage">
    <div class="wrapIn">
        <!--content-->
        <div class="container page05">
            <div class="containerIn">
                <!--상단 네비게이션 -->
                <div class="navi">
                    <ul>
                        <li><a href="/"><img src="/statics/img/common/home.svg"/></a></li>
                        <li><a href="/singUpFirst">서비스가입</a></li>
                        <li><a href="/singUpFirst">페이앱카페 가입하기</a></li>
                    </ul>
                </div>
                <!--상단 네비게이션 -->

                <div class="page05Box">
                    <form name="frm_info">
                        <h3 class="textTitle">1. 로그인 ID</h3>
                        <div class="text_blue signSubtext">*필수 입력항목</div>
                        <div class="firstBox">
                            <ul class="signUpInputList">
                                <li>
                                    <label class="signupLabel">회사명(상호) <span class="text_blue">*</span></label>
                                    <input type="text" placeholder="회사명(상호)을 입력하세요." id="companyName" maxlength="50"/>
                                </li>
                                <li>
                                    <div>
                                        <label class="signupLabel">사업자번호 <span class="text_blue">*</span></label>
                                        <ul class="radioList">
                                            <li><input type="radio" name="businessNum" id="bn01" value="C" required="required"/><label for="bn01">법인</label></li>
                                            <li><input type="radio" name="businessNum" id="bn02" value="I" required="required"/><label for="bn02">개인</label></li>
                                            <li><input type="radio" name="businessNum" id="bn03" value="E" required="required"/><label for="bn03">기타</label></li>
                                            <li class="inputBtnBox"><input type="text" placeholder="-제외" id="businessNumText" name="businessNumText" maxlength="10"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required="required"/>
                                                <button type="button" class="bluelineBtn" onclick="bizNochk();">중복확인</button></li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="w100">
                                    <label class="signupLabel"> 주요판매품목<span class="text_blue">*</span>   <a href="javascript:void(0);" class="riskIndustry" onclick="hompageJS.popup('open','#riskIndustry');"><span>가입 위험업종</span><span class="icon">i</span></a></label>
                                    <input type="text" placeholder="주요 판매 품목을 입력하세요." id="mainSales" maxlength="100"/>
                                </li>
                                <li class="w100">
                                    <label class="signupLabel"> 월거래금액 <span class="text_blue">*</span></label>
                                    <ul class="radioList monthTranAmount">
                                        <li><input type="radio" name="monthTranAmount" id="mta01" value="1" required="required"/><label for="mta01">1억원 미만</label></li>
                                        <li><input type="radio" name="monthTranAmount" id="mta02" value="2" required="required"/><label for="mta02">1억원 ~ 3억원</label></li>
                                        <li><input type="radio" name="monthTranAmount" id="mta03" value="3" required="required"/><label for="mta03">3억원 ~ 5억원</label></li>
                                        <li><input type="radio" name="monthTranAmount" id="mta04" value="4" required="required"/><label for="mta04">5억원 ~ 10억원</label></li>
                                        <li><input type="radio" name="monthTranAmount" id="mta05" value="5" required="required"/><label for="mta05">10억원 ~ 50억원</label></li>
                                        <li><input type="radio" name="monthTranAmount" id="mta06" value="6" required="required"/><label for="mta06">50억원 ~ 100억원</label></li>
                                        <li><input type="radio" name="monthTranAmount" id="mta07" value="7" required="required"/><label for="mta07">100억원 이상 </label></li>
                                    </ul>
                                </li>
                                <li>
                                    <label class="signupLabel">대표자명 <span class="text_blue">*</span></label>
                                    <input type="text" placeholder="대표자 이름을 입력하세요." required="required" id="repName" maxlength="50"/>
                                </li>
                                <li class="calendarBox">
                                    <div>
                                        <label class="signupLabel">대표자 법정생년월일 </label>
                                        <input type="text" id="repBirth"  class="datepicker" maxlength="8"/>
                                    </div>
                                </li>
                                <li>
                                    <label class="signupLabel">담당자이메일 <span class="text_blue">*</span></label>
                                    <input type="email" placeholder="ex) payappcafe@email.com" required="required" id="repEmail" maxlength="50"/>
                                </li>
                                <li>
                                    <div>
                                        <label class="signupLabel">담당자 전화번호 <span class="text_blue">*</span></label>
                                        <input type="tel" placeholder="-제외" required="required" id="repTel" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="11"/>
                                    </div>
                                </li>
                                <li class="w100 addressBox">
                                    <label class="signupLabel">사업장등록증 주소 <span class="text_blue">*</span></label>
                                    <button type="button" class="bluelineBtn findAddr" onclick="jusopop();">주소찾기 </button><input type="text" readonly="readonly" class="addressInput" required="required" id="rtAddrPart1" name="rtAddrPart1" maxlength="200"/>
                                    <input type="text" placeholder="상세주소" id= "rtAddrDetail" name="rtAddrDetail" class="addressDetailInput" required="required" maxlength="200"/>
                                </li>
                            </ul>
                        </div>
                        <h3 class="textTitle">2. 결제대행사(PG) 선택</h3>
                        <%-- <div class="text_gray signSubtext">※ PG사 미선택 후 가입신청을 하신 경우에는 고객센터(070-8732-5600)로 문의하시기 바랍니다.</div>--%>
                        <div class="seconBox">
                            <ul class="pgSelectBox">
                                <c:forEach items="${pgList}" var="list">
                                    <li>
                                        <div>
                                            <input type="checkbox" name="pgSelect" id="${list.companyCd}" value="${list.companyCd}"/><label for="${list.companyCd}">${list.companyNm}</label>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <!--취소 가입신청 버튼 -->
                        <div class="buttonBox ac">
                            <a href="/main" class="whiteBtn">취소</a>
                            <button type="button" class="blueBtn" onclick="validate();"> 가맹점 가입 신청 </button>
                        </div>
                        <!--취소 가입신청 버튼 -->
                    </form>

                    <!-- 가입 위험업종 팝업 -->
                    <div class="layerpopup" id="riskIndustry">
                        <div class="layerpopupIn">
                            <div class="layerpopupHead">
                                <div class="layerpopupHeadIn">
                                    <div>페이앱카페 및 카드사 심사 가입 위험종목</div>
                                    <a href="javascript:void(0);"   onclick="hompageJS.popup('close','#riskIndustry');"><span class="icon-multipli"></span></a>
                                </div>
                            </div>
                            <div class="layerpopupCon">
                                <div class="tableWrapBox">
                                    <table>
                                        <colgroup>
                                            <col width="50%"/>
                                            <col width="50%"/>
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>등록 불가 업종</th>
                                            <th>중점 관리 업종</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>GPS, PDP, 아이템(게임머니)거래, 무기명 선불카드(국제전화선불카드, 전자화폐 등), 상품권(온/오프라인 각종 상품권 外 상점 자체발행 상품권 등), 경마/경륜권, 주식, 온라인 광고, 적립금 제공, 휴대폰SMS서비스, 대여업종, 해외명품, 신용카드조회기, 성인용품(성인컨텐츠), 순금, 방문판매, 회원제 쇼핑몰, 애완동물(살아 있는 모든것), 저가경매, 보일러, 이온수기, 스포츠센터, 중고차, 다단계(허벌라이프 등), 오픈마켓, 멀티쇼핑몰 (나이* 등 브랜드 신발 및 의류 판매), 소셜커머스, 담배(전자담배 포함), 주류, 부동산중개수수료, 총포/도검, 안경 및 콘택트렌즈(도수용), 군복, 해외서버이용업체, 무형의 서비스를 제공하는 상점</td>
                                            <td>게임사이트, 회원(학회)가입/참가비, 여행, 웹호스팅, 홈페이지 제작, 온/오프라인 강의, 구매대행, 각종 중고용품, 정기구독 잡지, 공동구매, 가공되지 않은 식품, 건강보조식품 및 용품, 후원금, B2B, C2C, 시즌상품(시즌권, 에어컨, 스키, 초코렛 등), 200만원 이상 고가상품, 30만원 이상 귀금속</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="layerpopupBottom">
                                <a href="javascript:void(0);"  onclick="hompageJS.popup('close','#riskIndustry');">닫기</a>
                            </div>
                        </div>
                    </div>
                    <!-- 가입 위험업종 팝업 -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>