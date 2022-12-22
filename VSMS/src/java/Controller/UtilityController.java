package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UtilityController {

    //This is to convert Java DateTime String into SQL readable String Format (YYYY-MM-DD h:m:s) e.g:2016-01-04 23:34:09
    public static String convertSQLDateTimeString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return "'" + sdf.format(date) + "'";
    }

    public static int convertStringtoInt(String numberStr) {
        int number = 0;
        try {
            number = Integer.parseInt(numberStr);
        } catch (Exception e) {

        }
        return number;
    }

    public static double convertStringtoDouble(String numberStr) {
        double number = 0.0;
        try {
            number = Double.parseDouble(numberStr);
        } catch (Exception e) {

        }
        return number;
    }

    public static String convertIntToString(int number) {
        String numberStr = "";
        try {
            numberStr = Integer.toString(number);
        } catch (Exception e) {
            numberStr = "error";
        }
        return numberStr;
    }

    public static boolean checkNullStringArray(String[] stringArray) {
        for (String str : stringArray) {
            if (str == null) {
                return true;
            }
        }
        return false;
    }

    public static String convertDoubleToCurrString(double money) {
        //NumberFormat formatter = NumberFormat.getCurrencyInstance();
        DecimalFormat df = new DecimalFormat("0.00");
        String moneyString = "" + df.format(money);
        return moneyString;
    }

    public static String convertIntToCurrString(int money) {
        NumberFormat formatter = NumberFormat.getCurrencyInstance();
        String moneyString = formatter.format(money);
        return moneyString;
    }

    public static Date convertStringToDate(String date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date returnDate = null;
        try {
            returnDate = format.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(UtilityController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return returnDate;
    }

    // convert InputStream to String
    public static String convertInputStreamToString(InputStream is) {

        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();

        String line;
        try {

            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return sb.toString();

    }

    public static InputStream convertBlobToInputStream(Blob blob) throws Exception {
        InputStream stream = null;
        if (blob != null) {
            stream = blob.getBinaryStream();
        }
        return stream;
    }

    public static Date addDays(Date date, int days) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, days); //minus number would decrement the days
        return cal.getTime();
    }

    public static boolean validateEmail(String email) {

        String regex = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";

        Pattern pattern = Pattern.compile(regex);

        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
    }

    public static String generateRandomPassword() {
        char[] chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 20; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();
        
        return output;
    }
}
