package com.company.smartwater.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils {
    public static String getNum(String s){
        List<String> ls = findStr("([0-9]+)", s);
        if(ls != null && ls.size() > 0){
            return ls.get(0);
        }

        return null;
    }

    public static List<String> findStr(String reg, String str){
        if(str == null){
            return null;
        }
        Matcher matcher = Pattern.compile(reg).matcher(str);
        List<String> list = new ArrayList<>();
        while (matcher.find()) {
            list.add(matcher.group());
        }
        return list;
    }

    public static Double parseDouble(String d){
        try {
            return Double.parseDouble(d);
        }catch (Exception e){
        }

        return null;
    }

    public static String filterString(String str){
        if(str == null){
            return null;
        }

        return str.replaceAll("\\p{P}", "");
    }

    public static String valueOf(Object o){
        if(o == null){
            return "";
        }

        try {
            return URLEncoder.encode(o.toString(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }

    public static boolean isEmpty(String s){
        return org.apache.commons.lang3.StringUtils.isEmpty(s);
    }

    public static boolean isNotEmpty(String s){
        return !isEmpty(s);
    }

    public static List<String> splitParam(String param){
        String[] ss = param.split(",");
        List<String> pp = new ArrayList<>();
        for(String s : ss){
            String sss = s.trim();
            if(StringUtils.isNotEmpty(sss)){
                pp.add(sss);
            }
        }

        return pp;
    }

}
