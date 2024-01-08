package com.jhwebsite.utils;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class UploadFileUtil {

    public void writeOrUpdate(byte[] bytes, String path) {
        // kiem tra folder chua file ton tai hay chua, neu chua thi tao folder
        File dir = new File(StringUtils.substringBeforeLast(path, File.separator));
        if (!dir.exists()) dir.mkdir();

        // ghi file
        File file = new File(path);
        String fileName = file.getName();
        String fileNameWithOutExt = FilenameUtils.removeExtension(fileName);
        String ext = FilenameUtils.getExtension(fileName);
        int num = 1;
        while (file.exists()) {
            file = new File(dir + File.separator + fileNameWithOutExt + " (" + (num++) + ")." + ext);
        }

        try (OutputStream fileOutputStream = new FileOutputStream(file)) {
            fileOutputStream.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void delete(String path) {
        File file = new File(path);
        if(file.exists() && file.isFile()) file.delete();
    }
}
