package com.company.smartwater.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.UUID;

public class FileUtils {

    public static String[] getDirAndFileName(String baseDir){
        String[] pp = new String[2];
        String uuid = UUID.randomUUID().toString();
        pp[0] = baseDir + "/" + uuid.substring(0,2) + "/";
        pp[1] = uuid;

        return pp;
    }

    public static String wholeUrl(String url, String baseUrl){
        if(url == null || url.startsWith("http")){
            return url;
        }
        return baseUrl + getContextPath() + "/" + url;
    }

    public static String wholeUrl(String url){
        if(url == null || url.startsWith("http")){
            return url;
        }
        return getBaseUrl() + getContextPath() + "/" + url;
    }

    public static String getBaseUrl(){
        return "http://localhost:8080/";
    }

    public static String getContextPath(){
        return "file";
    }

    public static String saveFile(String path, MultipartFile file, String fileName, String fileDir){
        path = path + fileDir;
        File dir = new File(path);
        if(!dir.exists()){
            dir.mkdirs();
        }

        File newFile = new File(path + fileName);

        InputStream inputStream = null;
        OutputStream outputStream = null;

        try {
            inputStream = file.getInputStream();

            if (!newFile.exists()) {
                newFile.createNewFile();
            }

            outputStream = new FileOutputStream(newFile);
            int read = 0;
            byte[] bytes = new byte[1024];

            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
        } catch (Exception e) {
            try{
                newFile.delete();
            }catch(Exception e1){
            }
            return null;
        } finally{
            if(inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                }
            }
            if(outputStream != null){
                try {
                    outputStream.close();
                } catch (IOException e) {
                }
            }
        }
        if(newFile.length() == 0){
            return null;
        }
        String imageUrl = fileDir + fileName;

        return imageUrl;
    }
}
