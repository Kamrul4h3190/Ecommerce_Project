package com.ecommerce.project.security.request;

import org.aspectj.bridge.IMessage;

public class MessageResponse {
    private String message;
    public MessageResponse(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
