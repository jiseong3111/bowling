package com.bowling.teamcover.average.web;

import com.bowling.teamcover.average.service.AverageService;
import com.bowling.teamcover.average.vo.AverageVo;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

@Controller
public class AverageController {

    protected Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private AverageService averageService;

    @RequestMapping(value = "/average/averageList.do")
    public String averageList(@ModelAttribute("loginCheck") String loginCheck, Model model) throws Exception {

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
            FileInputStream file = new FileInputStream(new File("C:\\js_excel", uploadFile.getOriginalFilename()));

            XSSFWorkbook workbook = new XSSFWorkbook(file);

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
                        String value = "";
                        if (cell == null) { // 빈 셀 체크
                            continue;
                        } else {
                            switch (cell.getCellType()) {
                                case XSSFCell.CELL_TYPE_FORMULA:
                                    value = cell.getCellFormula();
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
                                    //value = cell.getBooleanCellValue()+"";
                                    value = " ";
                                    break;
                                case XSSFCell.CELL_TYPE_ERROR:
                                    value = cell.getErrorCellValue() + "";
                                    break;
                            }
                        }

                        if (cellIndex == 0) {
                            vo.setRnum(value);
                        } else if (cellIndex == 1) {
                            vo.setCuno(value);
                        } else if (cellIndex == 2) {
                            vo.setCunm(value);
                        } else if (cellIndex == 3) {
                            vo.setTno(value);
                        } else if (cellIndex == 4) {
                            vo.setMbno(value);
                        } else if (cellIndex == 5) {
                            vo.setGmCnt(value);
                        } else if (cellIndex == 6) {
                            vo.setTtScr(value);
                        } else if (cellIndex == 7) {
                            vo.setLestScr(value);
                        } else if (cellIndex == 8) {
                            vo.setSprmScr(value);
                        } else if (cellIndex == 9) {
                            vo.setFxprBfdt(value);
                        }
                    }
                    vo.setAvrgScr(String.valueOf(Integer.valueOf(vo.getTtScr()) / Integer.valueOf(vo.getGmCnt())));
                    System.out.println("vo ::" + vo.toString());
                    excelList.add(vo);
                }
            }
            //디비 삽입 필요
            Map cnt = averageService.selectTest();
            System.out.println(cnt.size());
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
    public void sampleDown(HttpServletResponse response, HttpServletRequest request) throws Exception {
        String fileName = "AVERAGE_SAMPLE_EXCEL.xlsx";
        String saveFilePath = "C:\\TeamCover\\bowling\\src\\main\\web\\sample";
        String contentType = "application/vnd.ms-excel";
        File file = new File(saveFilePath);
        long fileLength = file.length();
        //파일의 크기와 같지 않을 경우 프로그램이 멈추지 않고 계속 실행되거나, 잘못된 정보가 다운로드 될 수 있다.

        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");

        try(
                FileInputStream fis = new FileInputStream(saveFilePath);
                OutputStream out = response.getOutputStream();
        ){
            int readCount = 0;
            byte[] buffer = new byte[1024];
            while((readCount = fis.read(buffer)) != -1){
                out.write(buffer,0,readCount);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
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
    }*/
}
