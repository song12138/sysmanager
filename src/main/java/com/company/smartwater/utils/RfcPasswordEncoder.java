package com.company.smartwater.utils;

import org.apache.commons.codec.binary.Base64;

import java.util.Arrays;

/**
 * Created by dong on 2018/12/16.
 */
public class RfcPasswordEncoder {
    public static boolean  matches(String rawPassword, String encodedPassword) {
        try {
            byte[] encodeBase64 = Base64.decodeBase64(encodedPassword);
            byte[] dst = new byte[16];
            byte[] buffer3 = new byte[32];
            System.arraycopy(encodeBase64, 1, dst, 0, 16);
            System.arraycopy(encodeBase64, 17, buffer3, 0, 32);
            Rfc2898DeriveBytes rfc = null;
            rfc = new Rfc2898DeriveBytes(rawPassword, dst, 1000);

            byte[] buffer4 = rfc.getBytes(32);
            return Arrays.equals(buffer3, buffer4);
        } catch (Exception e) {
            return false;
        }
    }
}
