package com.company.smartwater.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
    public static Date parseDate(String d, String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try {
            return sdf.parse(d);
        } catch (ParseException e) {
        }

        return null;
    }

    public static String formatDate(Date d, String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try {
            return sdf.format(d);
        } catch (Exception e) {
        }

        return null;
    }

    public static Date getDateByDay(Date date, int day){
        return getDateByDay(date, day, 0, 0, 0);
    }

    public static Date getDateByDay(Date date, int day, int hour, int minute, int second){
        Calendar cl = Calendar.getInstance();
        cl.setTime(date);
        cl.add(Calendar.DAY_OF_YEAR, day);
        cl.set(Calendar.HOUR_OF_DAY, hour);
        cl.set(Calendar.MINUTE, minute);
        cl.set(Calendar.SECOND, second);

        return cl.getTime();
    }
}
