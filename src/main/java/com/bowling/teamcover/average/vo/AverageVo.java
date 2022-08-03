package com.bowling.teamcover.average.vo;

import com.bowling.teamcover.cmm.vo.PagingVO;

public class AverageVo extends PagingVO {
    private String mbno;
    private String cuno;

    private String cunm;
    private String fxprBfdt;
    private String gmCnt;
    private String ttScr;

    private String ttGmCnt;

    public String getTtGmCnt() {
        return ttGmCnt;
    }

    public void setTtGmCnt(String ttGmCnt) {
        this.ttGmCnt = ttGmCnt;
    }

    public String getAvrgScr() {
        return avrgScr;
    }

    public void setAvrgScr(String avrgScr) {
        this.avrgScr = avrgScr;
    }

    private String avrgScr;
    private String sprmScr;
    private String lestScr;

    private String tno;

    private String rnum;

    private String mbrNm;

    private String fGame;

    private String sGame;

    private String tGame;

    private String fxprBfTn;

    private String rcpd;

    private String rcptMcnt;

    private String nextDuesMm;

    private String ffGame;

    private String rank;

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getFfGame() {
        return ffGame;
    }

    public void setFfGame(String ffGame) {
        this.ffGame = ffGame;
    }

    public String getFxprBfTn() {
        return fxprBfTn;
    }

    public void setFxprBfTn(String fxprBfTn) {
        this.fxprBfTn = fxprBfTn;
    }

    public String getRcpd() {
        return rcpd;
    }

    public void setRcpd(String rcpd) {
        this.rcpd = rcpd;
    }

    public String getRcptMcnt() {
        return rcptMcnt;
    }

    public void setRcptMcnt(String rcptMcnt) {
        this.rcptMcnt = rcptMcnt;
    }

    public String getNextDuesMm() {
        return nextDuesMm;
    }

    public void setNextDuesMm(String nextDuesMm) {
        this.nextDuesMm = nextDuesMm;
    }

    public String getfGame() {
        return fGame;
    }

    public void setfGame(String fGame) {
        this.fGame = fGame;
    }

    public String getsGame() {
        return sGame;
    }

    public void setsGame(String sGame) {
        this.sGame = sGame;
    }

    public String gettGame() {
        return tGame;
    }

    public void settGame(String tGame) {
        this.tGame = tGame;
    }

    public String getMbrNm() {
        return mbrNm;
    }

    public void setMbrNm(String mbrNm) {
        this.mbrNm = mbrNm;
    }

    public String getRnum() {
        return rnum;
    }

    public void setRnum(String rnum) {
        this.rnum = rnum;
    }

    public String getMbno() {
        return mbno;
    }

    public void setMbno(String mbno) {
        this.mbno = mbno;
    }

    public String getCuno() {
        return cuno;
    }

    public void setCuno(String cuno) {
        this.cuno = cuno;
    }

    public String getFxprBfdt() {
        return fxprBfdt;
    }

    public void setFxprBfdt(String fxprBfdt) {
        this.fxprBfdt = fxprBfdt;
    }

    public String getGmCnt() {
        return gmCnt;
    }

    public void setGmCnt(String gmCnt) {
        this.gmCnt = gmCnt;
    }

    public String getTtScr() {
        return ttScr;
    }

    public void setTtScr(String ttScr) {
        this.ttScr = ttScr;
    }


    public String getSprmScr() {
        return sprmScr;
    }

    public void setSprmScr(String sprmScr) {
        this.sprmScr = sprmScr;
    }

    public String getLestScr() {
        return lestScr;
    }

    public void setLestScr(String lestScr) {
        this.lestScr = lestScr;
    }

    public String getCunm() {
        return cunm;
    }

    public void setCunm(String cunm) {
        this.cunm = cunm;
    }

    public String getTno() {
        return tno;
    }

    public void setTno(String tno) {
        this.tno = tno;
    }

    @Override
    public String toString() {
        return "AverageVo{" +
                "mbno='" + mbno + '\'' +
                ", cuno='" + cuno + '\'' +
                ", cunm='" + cunm + '\'' +
                ", fxprBfdt='" + fxprBfdt + '\'' +
                ", gmCnt='" + gmCnt + '\'' +
                ", ttScr='" + ttScr + '\'' +
                ", avrgScr='" + avrgScr + '\'' +
                ", sprmScr='" + sprmScr + '\'' +
                ", lestScr='" + lestScr + '\'' +
                ", rnum='" + rnum + '\'' +
                '}';
    }
}
