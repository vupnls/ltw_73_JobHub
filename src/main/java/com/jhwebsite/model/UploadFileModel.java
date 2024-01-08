package com.jhwebsite.model;

public class UploadFileModel {
    private String base64;
    private String name;

    public String getBase64() {
        if(base64 != null)
            return base64.substring(base64.indexOf(",") + 1);
        return null;
    }

    public void setBase64(String base64) {
        this.base64 = base64;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
