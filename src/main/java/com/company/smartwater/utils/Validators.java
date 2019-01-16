package com.company.smartwater.utils;

import org.apache.commons.lang3.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by xiaodong on 2018/12/27.
 */
public class Validators {

    public static boolean fieldMaxLength(Object obj, int maxLength) {
        if (fieldNotBlank(obj)) {
            int length = String.valueOf(obj).length();
            return length <= maxLength;
        }
        return false;
    }

    public static boolean fieldMinLength(Object obj, int minLength) {
        if (fieldNotBlank(obj)) {
            int length = String.valueOf(obj).length();
            return length >= minLength;
        }
        return false;
    }

    public static boolean fieldFormatWithPattern(String fieldValue, String regex) {
        if (StringUtils.isNotEmpty(fieldValue)) {
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(fieldValue);
            return matcher.matches();
        }
        return false;
    }

    public static boolean fieldNotBlank(Object obj) {
        return obj != null && StringUtils.isNotBlank(String.valueOf(obj));
    }

    public static boolean fieldBlank(Object obj) {
        return obj == null || StringUtils.isBlank(String.valueOf(obj));
    }


    public static boolean fieldNotEmpty(Object obj) {
        return obj != null && StringUtils.isNotEmpty(String.valueOf(obj));
    }

    public static boolean fieldEmpty(Object obj) {
        return obj == null || StringUtils.isEmpty(String.valueOf(obj));
    }

    /**
     * 字段值在有效范围内，返回true,支持fieldValue为null，但不支持fieldRangeValues为null
     * @param fieldValue      字段值
     * @param fieldRangeValues 有效范围
     * @return
     */
    public static <T> boolean fieldRangeValue(T fieldValue, T... fieldRangeValues) {
        if(fieldRangeValues == null){
            return false;
        }

        if(fieldValue != null){
            for(T fieldRangeValue:fieldRangeValues){
                if(fieldValue.equals(fieldRangeValue)){
                    return true;
                }
            }
        }else{
            for(T fieldRangeValue:fieldRangeValues){
                if(fieldRangeValue == null){
                    return true;
                }
            }
        }
        return false;
    }

}
