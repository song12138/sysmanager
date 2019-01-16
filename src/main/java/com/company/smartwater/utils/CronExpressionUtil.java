package com.company.smartwater.utils;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CronExpressionUtil {
    /***
     *
     * @param date
     * @param dateFormat : e.g:yyyy-MM-dd HH:mm:ss
     * @return
     */
    public static String formatDateByPattern(Date date,String dateFormat){
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        String formatTimeStr = null;
        if (date != null) {
            formatTimeStr = sdf.format(date);
        }
        return formatTimeStr;
    }
    /***
     * convert Date to cron ,eg.  "0 06 10 15 1 ? 2014"
     * @param date  : 时间点
     * @return
     */
    public static String getCron(Date  date){
        String dateFormat="ss mm HH dd MM ? yyyy";
        return formatDateByPattern(date, dateFormat);
    }

    public static String convertCronExpression(Double cycle, String unit, Date beginDate){
        if(cycle == null || StringUtils.isEmpty(unit) || beginDate == null){
            return "";
        }

        int c = cycle.intValue();
        Calendar cl = Calendar.getInstance();
        cl.setTime(beginDate);
        switch (unit){
            case "Y"://Y	年
                cl.add(Calendar.YEAR, c);
                break;
            case "M"://M	月
                cl.add(Calendar.MONTH, c);
                break;
            case "D"://D	日
                cl.add(Calendar.DAY_OF_YEAR, c);
                break;
            case "W"://W	周
                cl.add(Calendar.WEEK_OF_YEAR, c);
                break;
            case "H"://H	小时
                cl.add(Calendar.HOUR, c);
                break;
        }
        Date targetDate = cl.getTime();
        Calendar c2 = Calendar.getInstance();
        if(c2.getTime().after(targetDate)){
            c2.add(Calendar.MINUTE, 1);
            targetDate = c2.getTime();
        }

        String cronExpression = getCron(targetDate);
        return cronExpression;
    }
}
