package Controller;

import java.text.SimpleDateFormat;
import java.util.Date;


public class UtilityController {

    //This is to convert Java DateTime String into SQL readable String Format (YYYY-MM-DD h:m:s) e.g:2016-01-04 23:34:09
    public static String convertSQLDateTimeString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return "'"+sdf.format(date)+"'";
    }
    public static int convertStringtoInt(String numberStr){
        int number =0;
        try{
            number = Integer.parseInt(numberStr);
        } catch(Exception e){
        
        }
        return number;
    }
    public static String convertIntToString(int number){
        String numberStr="";
        try{
            numberStr = Integer.toString(number);
        } catch(Exception e){
            numberStr = "error";
        }
        return numberStr;
    }

    public static boolean checkNullStringArray(String[] stringArray) {
        for(String str : stringArray){
            if (str == null){
                return true;
            } 
        }
        return false;
    }
}
