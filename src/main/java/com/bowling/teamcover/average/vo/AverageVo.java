package com.bowling.teamcover.average.vo;

public class AverageVo {
    private String mbno;
    private String cuno;

    private String cunm;
    private String fxprBfdt;
    private String gmCnt;
    private String ttScr;
    private String avrgScr;
    private String sprmScr;
    private String lestScr;

    private String rnum;

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

    public String getAvrgScr() {
        return avrgScr;
    }

    public void setAvrgScr(String avrgScr) {
        this.avrgScr = avrgScr;
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
