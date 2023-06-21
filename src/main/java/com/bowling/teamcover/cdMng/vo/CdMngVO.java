package com.bowling.teamcover.cdMng.vo;

import com.bowling.teamcover.cmm.vo.PagingVO;

import java.math.BigDecimal;

public class CdMngVO extends PagingVO {
    /** 코드아이디 */
    private String cdGrpId;

    /** 코드명 */
    private String cdGrpNm;

    /** 코드설명 */
    private String cdExpl;

    /** 코드길이 */
    private String cdLth;

    /** 사용여부 */
    private String useYn;

    /** 코드인스턴스값 */
    private String cdItceVl;

    /** 코드인스턴스명 */
    private String cdItceNm;

    /** 코드인스턴스설명 */
    private String cdItceExpl;

    /** 정렬순서 */
    private BigDecimal sortSeq;

    /** 사용여부 */
    private String cdUseYn;

    /** 최초등록일시 */
    private String cdFstRegDttm;

    /** 최초등록자번호 */
    private String cdFstRgntNo;

    /** 최종변경일시 */
    private String cdLastChngDttm;

    /** 최종변경자번호 */
    private String cdLastChgrNo;

    /** 수정대상 */
    private String cdItceVl2;



    /**
     * @return the cdGrpId
     */
    public String getCdGrpId() {
        return cdGrpId;
    }

    /**
     * @param cdGrpId the cdGrpId to set
     */
    public void setCdGrpId(String cdGrpId) {
        this.cdGrpId = cdGrpId;
    }



    /**
     * @return the cdGrpNm
     */
    public String getCdGrpNm() {
        return cdGrpNm;
    }

    /**
     * @param cdGrpNm the cdGrpNm to set
     */
    public void setCdGrpNm(String cdGrpNm) {
        this.cdGrpNm = cdGrpNm;
    }

    public String getCdExpl() {
        return cdExpl;
    }

    public void setCdExpl(String cdExpl) {
        this.cdExpl = cdExpl;
    }

    public String getCdLth() {
        return cdLth;
    }

    public void setCdLth(String cdLth) {
        this.cdLth = cdLth;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getCdItceVl() {
        return cdItceVl;
    }

    public void setCdItceVl(String cdItceVl) {
        this.cdItceVl = cdItceVl;
    }

    public String getCdItceNm() {
        return cdItceNm;
    }

    public void setCdItceNm(String cdItceNm) {
        this.cdItceNm = cdItceNm;
    }

    public String getCdItceExpl() {
        return cdItceExpl;
    }

    public void setCdItceExpl(String cdItceExpl) {
        this.cdItceExpl = cdItceExpl;
    }

    public BigDecimal getSortSeq() {
        return sortSeq;
    }

    public void setSortSeq(BigDecimal sortSeq) {
        this.sortSeq = sortSeq;
    }

    public String getCdUseYn() {
        return cdUseYn;
    }

    public void setCdUseYn(String cdUseYn) {
        this.cdUseYn = cdUseYn;
    }

    public String getCdFstRegDttm() {
        return cdFstRegDttm;
    }

    public void setCdFstRegDttm(String cdFstRegDttm) {
        this.cdFstRegDttm = cdFstRegDttm;
    }

    public String getCdFstRgntNo() {
        return cdFstRgntNo;
    }

    public void setCdFstRgntNo(String cdFstRgntNo) {
        this.cdFstRgntNo = cdFstRgntNo;
    }

    public String getCdLastChngDttm() {
        return cdLastChngDttm;
    }

    public void setCdLastChngDttm(String cdLastChngDttm) {
        this.cdLastChngDttm = cdLastChngDttm;
    }

    public String getCdLastChgrNo() {
        return cdLastChgrNo;
    }

    public void setCdLastChgrNo(String cdLastChgrNo) {
        this.cdLastChgrNo = cdLastChgrNo;
    }

    public String getCdItceVl2() {
        return cdItceVl2;
    }

    public void setCdItceVl2(String cdItceVl2) {
        this.cdItceVl2 = cdItceVl2;
    }


}
