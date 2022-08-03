package com.bowling.teamcover.cmm.vo;

public class PagingVO {
    /** 순번 */
    private String rnum;

    /** 현재페이지 번호 */
    private String currPage;

    /** 페이지사이즈 */
    private String pageSize;

    /** 페이지당 row 갯수 */
    private String pageUnit;

    /** offset */
    private String offset;

    /** limit수 */
    private String limit;

    private String totalCnt;

    /** 최초등록일시 */
    private String fstRegDttm;

    /** 최초등록자번호 */
    private String fstRgntNo;

    /** 최초등록자아이디 */
    private String fstRgntId;

    /** 최초등록자명 */
    private String fstRgntNm;

    /** 최종변경일시 */
    private String lastChngDttm;

    /** 최종변경자번호 */
    private String lastChgrNo;

    /** 최종변경자아이디 */
    private String lastChgrId;

    /** 최종변경자명 */
    private String lastChgrNm;

    /** 이전페이지 페이지 번호 */
    private String searchCurrPage;

    /** 이전페이지 row 갯수 */
    private String searchPageUnit;

    /** 검색 시작일자 */
    private String searchSDate;

    /** 검색 종료일자 */
    private String searchEDate;

    /** 검색 기타 */
    private String searchEtc;

    /** 검색 구분 */
    private String searchType;

    /** 검색 구분1 */
    private String searchType1;

    /** 검색 구분2 */
    private String searchType2;

    /** 검색 구분3 */
    private String searchType3;

    /** 검색 구분4 */
    private String searchType4;

    /** 검색 구분5 */
    private String searchType5;

    /** 검색 텍스트 */
    private String searchText;

    /** 검색 텍스트1 */
    private String searchText1;
    /** 검색 텍스트2 */
    private String searchText2;

    /** 검색 전화번호1 */
    private String searchMbphNo1;

    /** 검색 전화번호2 */
    private String searchMbphNo2;

    /** 검색 전화번호3 */
    private String searchMbphNo3;

    private String searchTypeMain;

    private String searchTypeSub;

    /** 페이지 타입 (I:등록/ U:수정) */
    private String pageType;

    /** 페이지 타입 (I:등록/ U:수정) */
    private String type;



    /**
     * @return the searchText2
     */
    public String getSearchText2() {
        return searchText2;
    }

    /**
     * @param searchText2 the searchText2 to set
     */
    public void setSearchText2(String searchText2) {
        this.searchText2 = searchText2;
    }

    /**
     * @return the rnum
     */
    public String getRnum() {
        return rnum;
    }

    /**
     * @param rnum the rnum to set
     */
    public void setRnum(String rnum) {
        this.rnum = rnum;
    }

    /**
     * @return the currPage
     */
    public String getCurrPage() {
        return currPage;
    }

    /**
     * @param currPage the currPage to set
     */
    public void setCurrPage(String currPage) {
        this.currPage = currPage;
    }

    /**
     * @return the pageSize
     */
    public String getPageSize() {
        return pageSize;
    }

    /**
     * @param pageSize the pageSize to set
     */
    public void setPageSize(String pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * @return the pageUnit
     */
    public String getPageUnit() {
        return pageUnit;
    }

    /**
     * @param pageUnit the pageUnit to set
     */
    public void setPageUnit(String pageUnit) {
        this.pageUnit = pageUnit;
    }

    /**
     * @return the offset
     */
    public String getOffset() {
        return offset;
    }

    /**
     * @param offset the offset to set
     */
    public void setOffset(String offset) {
        this.offset = offset;
    }

    /**
     * @return the limit
     */
    public String getLimit() {
        return limit;
    }

    /**
     * @param limit the limit to set
     */
    public void setLimit(String limit) {
        this.limit = limit;
    }

    /**
     * @return the totalCnt
     */
    public String getTotalCnt() {
        return totalCnt;
    }

    /**
     * @param totalCnt the totalCnt to set
     */
    public void setTotalCnt(String totalCnt) {
        this.totalCnt = totalCnt;
    }

    /**
     * @return the fstRegDttm
     */
    public String getFstRegDttm() {
        return fstRegDttm;
    }

    /**
     * @param fstRegDttm the fstRegDttm to set
     */
    public void setFstRegDttm(String fstRegDttm) {
        this.fstRegDttm = fstRegDttm;
    }

    /**
     * @return the fstRgntNo
     */
    public String getFstRgntNo() {
        return fstRgntNo;
    }

    /**
     * @param fstRgntNo the fstRgntNo to set
     */
    public void setFstRgntNo(String fstRgntNo) {
        this.fstRgntNo = fstRgntNo;
    }

    /**
     * @return the fstRgntId
     */
    public String getFstRgntId() {
        return fstRgntId;
    }

    /**
     * @param fstRgntId the fstRgntId to set
     */
    public void setFstRgntId(String fstRgntId) {
        this.fstRgntId = fstRgntId;
    }

    /**
     * @return the fstRgntNm
     */
    public String getFstRgntNm() {
        return fstRgntNm;
    }

    /**
     * @param fstRgntNm the fstRgntNm to set
     */
    public void setFstRgntNm(String fstRgntNm) {
        this.fstRgntNm = fstRgntNm;
    }

    /**
     * @return the lastChngDttm
     */
    public String getLastChngDttm() {
        return lastChngDttm;
    }

    /**
     * @param lastChngDttm the lastChngDttm to set
     */
    public void setLastChngDttm(String lastChngDttm) {
        this.lastChngDttm = lastChngDttm;
    }

    /**
     * @return the lastChgrNo
     */
    public String getLastChgrNo() {
        return lastChgrNo;
    }

    /**
     * @param lastChgrNo the lastChgrNo to set
     */
    public void setLastChgrNo(String lastChgrNo) {
        this.lastChgrNo = lastChgrNo;
    }

    /**
     * @return the lastChgrId
     */
    public String getLastChgrId() {
        return lastChgrId;
    }

    /**
     * @param lastChgrId the lastChgrId to set
     */
    public void setLastChgrId(String lastChgrId) {
        this.lastChgrId = lastChgrId;
    }

    /**
     * @return the lastChgrNm
     */
    public String getLastChgrNm() {
        return lastChgrNm;
    }

    /**
     * @param lastChgrNm the lastChgrNm to set
     */
    public void setLastChgrNm(String lastChgrNm) {
        this.lastChgrNm = lastChgrNm;
    }

    /**
     * @return the searchCurrPage
     */
    public String getSearchCurrPage() {
        return searchCurrPage;
    }

    /**
     * @param searchCurrPage the searchCurrPage to set
     */
    public void setSearchCurrPage(String searchCurrPage) {
        this.searchCurrPage = searchCurrPage;
    }

    /**
     * @return the searchPageUnit
     */
    public String getSearchPageUnit() {
        return searchPageUnit;
    }

    /**
     * @param searchPageUnit the searchPageUnit to set
     */
    public void setSearchPageUnit(String searchPageUnit) {
        this.searchPageUnit = searchPageUnit;
    }

    /**
     * @return the searchSDate
     */
    public String getSearchSDate() {
        return searchSDate;
    }

    /**
     * @param searchSDate the searchSDate to set
     */
    public void setSearchSDate(String searchSDate) {
        this.searchSDate = searchSDate;
    }

    /**
     * @return the searchEDate
     */
    public String getSearchEDate() {
        return searchEDate;
    }

    /**
     * @param searchEDate the searchEDate to set
     */
    public void setSearchEDate(String searchEDate) {
        this.searchEDate = searchEDate;
    }

    /**
     * @return the searchEtc
     */
    public String getSearchEtc() {
        return searchEtc;
    }

    /**
     * @param searchEtc the searchEtc to set
     */
    public void setSearchEtc(String searchEtc) {
        this.searchEtc = searchEtc;
    }

    /**
     * @return the searchType
     */
    public String getSearchType() {
        return searchType;
    }

    /**
     * @param searchType the searchType to set
     */
    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    /**
     * @return the searchType1
     */
    public String getSearchType1() {
        return searchType1;
    }

    /**
     * @param searchType1 the searchType1 to set
     */
    public void setSearchType1(String searchType1) {
        this.searchType1 = searchType1;
    }

    /**
     * @return the searchType2
     */
    public String getSearchType2() {
        return searchType2;
    }

    /**
     * @param searchType2 the searchType2 to set
     */
    public void setSearchType2(String searchType2) {
        this.searchType2 = searchType2;
    }

    /**
     * @return the searchType3
     */
    public String getSearchType3() {
        return searchType3;
    }

    /**
     * @param searchType3 the searchType3 to set
     */
    public void setSearchType3(String searchType3) {
        this.searchType3 = searchType3;
    }

    /**
     * @return the searchType4
     */
    public String getSearchType4() {
        return searchType4;
    }

    /**
     * @param searchType4 the searchType4 to set
     */
    public void setSearchType4(String searchType4) {
        this.searchType4 = searchType4;
    }

    /**
     * @return the searchType5
     */
    public String getSearchType5() {
        return searchType5;
    }

    /**
     * @param searchType5 the searchType5 to set
     */
    public void setSearchType5(String searchType5) {
        this.searchType5 = searchType5;
    }

    /**
     * @return the searchText
     */
    public String getSearchText() {
        return searchText;
    }

    /**
     * @param searchText the searchText to set
     */
    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

    /**
     * @return the searchText1
     */
    public String getSearchText1() {
        return searchText1;
    }

    /**
     * @param searchText1 the searchText1 to set
     */
    public void setSearchText1(String searchText1) {
        this.searchText1 = searchText1;
    }

    /**
     * @return the searchMbphNo1
     */
    public String getSearchMbphNo1() {
        return searchMbphNo1;
    }

    /**
     * @param searchMbphNo1 the searchMbphNo1 to set
     */
    public void setSearchMbphNo1(String searchMbphNo1) {
        this.searchMbphNo1 = searchMbphNo1;
    }

    /**
     * @return the searchMbphNo2
     */
    public String getSearchMbphNo2() {
        return searchMbphNo2;
    }

    /**
     * @param searchMbphNo2 the searchMbphNo2 to set
     */
    public void setSearchMbphNo2(String searchMbphNo2) {
        this.searchMbphNo2 = searchMbphNo2;
    }

    /**
     * @return the searchMbphNo3
     */
    public String getSearchMbphNo3() {
        return searchMbphNo3;
    }

    /**
     * @param searchMbphNo3 the searchMbphNo3 to set
     */
    public void setSearchMbphNo3(String searchMbphNo3) {
        this.searchMbphNo3 = searchMbphNo3;
    }

    /**
     * @return the searchTypeMain
     */
    public String getSearchTypeMain() {
        return searchTypeMain;
    }

    /**
     * @param searchTypeMain the searchTypeMain to set
     */
    public void setSearchTypeMain(String searchTypeMain) {
        this.searchTypeMain = searchTypeMain;
    }

    /**
     * @return the searchTypeSub
     */
    public String getSearchTypeSub() {
        return searchTypeSub;
    }

    /**
     * @param searchTypeSub the searchTypeSub to set
     */
    public void setSearchTypeSub(String searchTypeSub) {
        this.searchTypeSub = searchTypeSub;
    }

    /**
     * @return the pageType
     */
    public String getPageType() {
        return pageType;
    }

    /**
     * @param pageType the pageType to set
     */
    public void setPageType(String pageType) {
        this.pageType = pageType;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }
}
