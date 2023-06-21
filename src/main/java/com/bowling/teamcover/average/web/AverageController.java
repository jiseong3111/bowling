package com.bowling.teamcover.average.web;

import com.bowling.teamcover.average.service.AverageService;
import com.bowling.teamcover.average.vo.AverageVo;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AverageController {

    @Autowired
    private AverageService averageService;

    @RequestMapping(value = "/test/test.do")
    public String test(@ModelAttribute AverageVo averageVo, Model model) throws Exception {
        return "/test/test";
    }

    @RequestMapping(value = "/average/averageList.do")
    public String averageList(@ModelAttribute AverageVo averageVo, Model model) throws Exception {

        List<AverageVo> resultList = averageService.selectAvgList(averageVo);

        model.addAttribute("resultList", resultList);

        return "/average/averageList";
    }

    /**
     * 에버리지 업로드
     */
    @ResponseBody
    @RequestMapping(value = "/average/averageUploadList.do", method = RequestMethod.POST)
    public ModelAndView selectFileUploadList(@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpServletRequest request) throws Exception {

        ModelAndView resultMap = new ModelAndView("jsonView");

        ArrayList<AverageVo> excelList = new ArrayList<>();
        try {
            FileInputStream file = new FileInputStream(new File("C:\\Users\\jiseong\\Desktop\\박지성\\TeamCover", uploadFile.getOriginalFilename()));

            XSSFWorkbook workbook = new XSSFWorkbook(file);

            FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();

            int rowNo = 0;
            int cellIndex = 0;

            XSSFSheet sheet = workbook.getSheetAt(0); // 0 번째 시트를 가져온다
            // 만약 시트가 여러개 인 경우 for 문을 이용하여 각각의 시트를 가져온다
            int rows = sheet.getPhysicalNumberOfRows(); // 사용자가 입력한 엑셀 Row수를 가져온다

            for (rowNo = 1; rowNo < rows; rowNo++) {
                AverageVo vo = new AverageVo();
                XSSFRow row = sheet.getRow(rowNo);
            /*DataFormatter formatter = new DataFormatter();
            String s = formatter.formatCellValue(row.getCell(1));*/
                if (row != null) {
                    int cells = row.getPhysicalNumberOfCells(); // 해당 Row에 사용자가 입력한 셀의 수를 가져온다
                    for (cellIndex = 0; cellIndex <= cells; cellIndex++) {
                        XSSFCell cell = row.getCell(cellIndex); // 셀의 값을 가져온다

//                        System.out.println("변환후: " + evaluator.evaluateInCell(cell));
                        String value = "";

                        if (cell == null) { // 빈 셀 체크
                            continue;
                        } else {
                            switch (cell.getCellType()) {
                                case XSSFCell.CELL_TYPE_FORMULA:
                                    value = cell.getCellFormula();
                                    cell.setCellType(Cell.CELL_TYPE_STRING);
                                    value = String.valueOf(evaluator.evaluateInCell(cell));
                                    break;
                                case XSSFCell.CELL_TYPE_NUMERIC:
                                    // 숫자일 경우, String형으로 변경하여 값을 읽는다.
                                    cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                                    value = cell.getStringCellValue();
                                    break;
                                case XSSFCell.CELL_TYPE_STRING:
                                    value = cell.getStringCellValue();
                                    break;
                                case XSSFCell.CELL_TYPE_BLANK:
                                    value = cell.getBooleanCellValue() + "";
                                    value = " ";
                                    break;
                                case XSSFCell.CELL_TYPE_ERROR:
                                    value = cell.getErrorCellValue() + "";
                                    break;
                            }
                        }

                        if (cellIndex == 0) {
                            vo.setMbno(value);
                        } else if (cellIndex == 1) {
                            vo.setCuno(value);
                        } else if (cellIndex == 2) {
                            vo.setCunm(value);
                        } else if (cellIndex == 3) {
                            vo.setTno(value);
                        } else if (cellIndex == 4) {
                            vo.setMbrNm(value);
                        } else if (cellIndex == 6) {
                            vo.setGmCnt(value);
                        } else if (cellIndex == 7) {
                            vo.setfGame(value);
                        } else if (cellIndex == 8) {
                            vo.setsGame(value);
                        } else if (cellIndex == 9) {
                            vo.settGame(value);
                        } else if (cellIndex == 10) {
                            vo.setTtScr(value);
                        } else if (cellIndex == 11) {
                            vo.setAvrgScr(value);
                        } else if (cellIndex == 12) {
                            vo.setRank(value);
                        } else if (cellIndex == 13) {
                            // 1회차 일 경우 회차를 자름
                            value = value.substring(0, 1);
                            vo.setFxprBfTn(value);
                        } else if (cellIndex == 14) {
                            vo.setFxprBfdt(value);
                        }
                    }
                    excelList.add(vo);
                }
            }
            int memCnt = averageService.selectMember();
            if(memCnt == excelList.size()) {
                //에버리지(TB_AVG_LST) INSERT
                int cnt = averageService.insertAvgList(excelList);

                Map fxprData = new HashMap();
                fxprData.put("cuno", excelList.get(0).getCuno());
                fxprData.put("fxprBfTn", excelList.get(0).getFxprBfTn());
                fxprData.put("fxprBfdt", excelList.get(0).getFxprBfdt());
                //정기전 일자 INSERT
                averageService.insertFxprBfdt(fxprData);

                //정기전 현재 회차 -29회차까지 총 합을 구해야함.

                //MBR_STAT_CD
                List<AverageVo> ttList = averageService.selectTtAvgLst();

                Map data = new HashMap();
                data.put("cuno", excelList.get(0).getCuno());
                for (int i = 0; i < ttList.size(); i++) {
                    int gmCnt = 0;
                    int ttScr = 0;
                    int avg = 0;
                    //엑셀값과 기존의 총내역테이블에 있는 값을 합쳐서 총내역으로 다시 만들어주는 작업
                    gmCnt += Integer.valueOf(excelList.get(i).getGmCnt());
                    gmCnt += Integer.valueOf(ttList.get(i).getTtGmCnt());
                    ttScr += Integer.valueOf(excelList.get(i).getTtScr());
                    ttScr += Integer.valueOf(ttList.get(i).getTtScr());
                    if (gmCnt != 0) {
                        avg = ttScr / gmCnt;
                    }
                    //맵에 담아서 update하기 위한 가공
                    data.put("gmCnt", gmCnt);
                    data.put("ttScr", ttScr);
                    data.put("avrgScr", avg);
                    data.put("mbno", ttList.get(i).getMbno());

                    if (ttList.size() == excelList.size()) {
                        int uCnt = averageService.updateTtAvgLst(data);
                        resultMap.addObject("result", "excelUpload");
                    } else {
                        resultMap.addObject("result", "notSize");
                        break;
                    }
                }
            }else{
                resultMap.addObject("result", "notSize");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }

    /**
     * 에버리지 관리 샘플파일 다운로드
     * content-type : application/vnd.ms-excel
     */
    @ResponseBody
    @RequestMapping(value = "/average/sampleDown.do")
    public void sampleDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            // 다운로드 받을 파일명을 가져온다.
            String fileName = "test.txt";

            // 다운로드 경로 (내려받을 파일경로를 설정한다.)
            String filePath = "C:\\TeamCover\\bowling\\src\\main\\webapp\\sample\\";

            // 경로와 파일명으로 파일 객체를 생성한다.
            File dFile  = new File(filePath, fileName);

            // 파일 길이를 가져온다.
            int fSize = (int) dFile.length();

            // 파일이 존재
            if (fSize > 0) {

                // 파일명을 URLEncoder 하여 attachment, Content-Disposition Header로 설정
                String encodedFilename = "attachment; filename*=" + "UTF-8" + "''" + URLEncoder.encode(fileName, "UTF-8");

                // ContentType 설정
                response.setContentType("application/octet-stream; charset=utf-8");

                // Header 설정
                response.setHeader("Content-Disposition", encodedFilename);

                // ContentLength 설정

                BufferedInputStream in = null;
                BufferedOutputStream out = null;

				/* BufferedInputStream
				 *
					java.io의 가장 기본 파일 입출력 클래스
					입력 스트림(통로)을 생성해줌
					사용법은 간단하지만, 버퍼를 사용하지 않기 때문에 느림
					속도 문제를 해결하기 위해 버퍼를 사용하는 다른 클래스와 같이 쓰는 경우가 많음
				*/
                in = new BufferedInputStream(new FileInputStream(dFile));

				/* BufferedOutputStream
				 *
					java.io의 가장 기본이 되는 파일 입출력 클래스
					출력 스트림(통로)을 생성해줌
					사용법은 간단하지만, 버퍼를 사용하지 않기 때문에 느림
					속도 문제를 해결하기 위해 버퍼를 사용하는 다른 클래스와 같이 쓰는 경우가 많음
				*/
                out = new BufferedOutputStream(response.getOutputStream());

                try {
                    byte[] buffer = new byte[4096];
                    int bytesRead=0;

				 	/*
						모두 현재 파일 포인터 위치를 기준으로 함 (파일 포인터 앞의 내용은 없는 것처럼 작동)
						int read() : 1byte씩 내용을 읽어 정수로 반환
						int read(byte[] b) : 파일 내용을 한번에 모두 읽어서 배열에 저장
						int read(byte[] b. int off, int len) : 'len'길이만큼만 읽어서 배열의 'off'번째 위치부터 저장
				 	*/
                    while ((bytesRead = in.read(buffer))!=-1) {
                        out.write(buffer, 0, bytesRead);
                    }

                    // 버퍼에 남은 내용이 있다면, 모두 파일에 출력
                    out.flush();
                }
                finally {
					/*
						현재 열려 in,out 스트림을 닫음
						메모리 누수를 방지하고 다른 곳에서 리소스 사용이 가능하게 만듬
					*/
                    in.close();
                    out.close();
                }
            } else {
                throw new FileNotFoundException("파일이 없습니다.");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/average/averageSelectOne.do")
    public String averageSelectOne(@ModelAttribute AverageVo averageVo, Model model) throws Exception {

        //
        List<Map> fxprBfTnList = averageService.selectFxprBfTnList(averageVo);

        List<AverageVo> resultList = averageService.selectMemberOneAvgList(averageVo);

        model.addAttribute("resultList", resultList);
        model.addAttribute("fxprBfTnList", fxprBfTnList);
        model.addAttribute("averageVo", averageVo);
        model.addAttribute("search", averageVo);

        return "/average/averageListPop";
    }


    @ResponseBody
    @RequestMapping(value = "/average/updateAverage.do")
    public ModelAndView updateAverage(@ModelAttribute AverageVo averageVo, Model model,String a) throws Exception {
        ModelAndView resultMap = new ModelAndView("jsonView");

        int fxprBfTnTotalCnt = averageService.selectFxprBfTnTotalCnt();

        String[] ttScr = averageVo.getTtScr().split(",");
        String[] fGame = averageVo.getfGame().split(",");
        String[] sGame = averageVo.getsGame().split(",");
        String[] tGame = averageVo.gettGame().split(",");
        String[] avrgScr = averageVo.getAvrgScr().split(",");
        String[] fxprBfTn = averageVo.getFxprBfTn().split(",");



        List<Map> list = new ArrayList<>();

        Map ttData = new HashMap();
        ttData.put("mbno",averageVo.getMbno());
        int tt_ttGmCnt = 0;
        int tt_ttScr = 0;
        int tt_AvrgScr = 0;

        for(int i=0; i<fxprBfTnTotalCnt; i++){

            Map data = new HashMap();

            data.put("ttScr",ttScr[i]);
            data.put("fGame",fGame[i]);
            if(!fGame[i].equals("0")){
                tt_ttGmCnt++;
                tt_ttScr += Integer.valueOf(fGame[i]);
            }
            data.put("sGame",sGame[i]);
            if(!sGame[i].equals("0")){
                tt_ttGmCnt++;
                tt_ttScr += Integer.valueOf(sGame[i]);
            }
            data.put("tGame",tGame[i]);
            if(!tGame[i].equals("0")){
                tt_ttGmCnt++;
                tt_ttScr += Integer.valueOf(tGame[i]);
            }
            data.put("avrgScr",avrgScr[i]);
            data.put("fxprBfTn",fxprBfTn[i].substring(0, 1));
            data.put("mbno",averageVo.getMbno());

            list.add(data);
        }

        tt_AvrgScr = tt_ttScr/tt_ttGmCnt;
        ttData.put("avrgScr",tt_AvrgScr);
        ttData.put("ttGmCnt",tt_ttGmCnt);
        ttData.put("ttScr",tt_ttScr);

        int cnt = averageService.updateAverage(list);

        if(cnt == -1){
            int ttCnt = averageService.updateTtAvgMember(ttData);
            if(ttCnt > 0) {
                resultMap.addObject("result", "success");
            }
        }else{
            resultMap.addObject("result","fail");
        }

        return resultMap;
    }

    /**
     * 에버리지 관리 샘플파일 다운로드
     */
    /*@ResponseBody
    @RequestMapping(value = "/average/sampleDown.do")
    public ModelAndView sampleDown() throws Exception {
        ModelAndView resultMap = new ModelAndView("jsonView");

        // 빈 Workbook 생성
        XSSFWorkbook workbook = new XSSFWorkbook();

        // 빈 Sheet를 생성
        XSSFSheet sheet = workbook.createSheet("employee data");

        String fileNm = "AVERAGE_SAMPLE_EXCEL.xlsx";
        String filePath = "C:\\js_excel";
        // Sheet를 채우기 위한 데이터들을 Map에 저장
        Map<String, Object[]> data = new TreeMap<>();
        data.put("1", new Object[]{"번호", "클럽번호", "클럽명", "회원명", "게임수", "총점수", "최저점수", "최고점수", "정기전일자(YYYY-MM-DD)"});

        // data에서 keySet를 가져온다. 이 Set 값들을 조회하면서 데이터들을 sheet에 입력한다.
        Set<String> keyset = data.keySet();
        int rownum = 0;

        // 알아야할 점, TreeMap을 통해 생성된 keySet는 for를 조회시, 키값이 오름차순으로 조회된다.
        for (String key : keyset) {
            Row row = sheet.createRow(rownum++);
            Object[] objArr = data.get(key);
            int cellnum = 0;
            for (Object obj : objArr) {
                Cell cell = row.createCell(cellnum++);
                if (obj instanceof String) {
                    cell.setCellValue((String)obj);
                } else if (obj instanceof Integer) {
                    cell.setCellValue((Integer)obj);
                }
            }
        }

        try {
            FileOutputStream out = new FileOutputStream(new File(filePath, fileNm));
            workbook.write(out);
            out.close();
            resultMap.addObject("result","success");
            resultMap.addObject("address",filePath);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.addObject("result","fail");
        }

        return resultMap;

        if(i==0){
                ttScr = averageVo.getTtScr().substring(0,averageVo.getTtScr().indexOf(","));
                fGame = averageVo.getfGame().substring(0,averageVo.getfGame().indexOf(","));
                sGame = averageVo.getsGame().substring(0,averageVo.getsGame().indexOf(","));
                tGame = averageVo.gettGame().substring(0,averageVo.gettGame().indexOf(","));
                avrgScr = averageVo.getAvrgScr().substring(0,averageVo.getAvrgScr().indexOf(","));

                s1 = averageVo.getTtScr().indexOf(",");
                s2 = averageVo.getfGame().indexOf(",");
                s3 = averageVo.getsGame().indexOf(",");
                s4 = averageVo.gettGame().indexOf(",");
                s5 = averageVo.getAvrgScr().indexOf(",");
            }else if(i<fxprBfTnTotalCnt){
                //자른 글자에서 ,위치 찾기
                s1 = averageVo.getTtScr().substring(s1+1).indexOf(",");
                s2 = averageVo.getfGame().substring(s2+1).indexOf(",");
                s3 = averageVo.getsGame().substring(s3+1).indexOf(",");
                s4 = averageVo.gettGame().substring(s4+1).indexOf(",");
                s5 = averageVo.getAvrgScr().substring(s5+1).indexOf(",");
                //자른글자
                a1 = averageVo.getTtScr().substring(s1+1);
                a2 = averageVo.getfGame().substring(s2+1);
                a3 = averageVo.getsGame().substring(s3+1);
                a4 = averageVo.gettGame().substring(s4+1);
                a5 = averageVo.getAvrgScr().substring(s5+1);
                //자른글자에서 ,위치 찾은거까지 앞라인 짜르기
                a1 = a1.substring(0,s1);
                a2 = a2.substring(0,s2);
                a3 = a3.substring(0,s3);
                a4 = a4.substring(0,s4);
                a5 = a5.substring(0,s5);
            }
    }*/


}
