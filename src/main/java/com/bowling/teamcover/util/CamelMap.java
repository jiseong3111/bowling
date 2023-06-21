package com.bowling.teamcover.util;

import org.apache.commons.collections.map.ListOrderedMap;

/**
 * @Class Name : CamelMap.java
 * @Description : Camel Case 표기법 변환 처리를 포함하는 Map 확장 class
 * @Modification Information
 * @
 * @   수정일             수정자          수정내용
 * @ -------------- -------------- -------------------------------------
 * @ 2022.08.4         비피그룹          최초생성
 *
 * @author 비피그룹
 * @since 2022.08.4
 * @version 1.0
 * @copyright Inc.BPGroup
 * @license The Apache Software License, Version 2.0
*/
public class CamelMap extends ListOrderedMap {

    private static final long serialVersionUID = 6723434363565852261L;

    /**
     * key 에 대하여 Camel Case 변환하여 super.put
     * (ListOrderedMap) 을 호출한다.
     * @param key
     *        - '_' 가 포함된 변수명
     * @param value
     *        - 명시된 key 에 대한 값 (변경 없음)
     * @return previous value associated with specified
     *         key, or null if there was no mapping for
     *         key
     */
    @Override
    public Object put(Object key, Object value) {
        return super.put(CamelUtil.convert2CamelCase((String) key), value);
    }



}
