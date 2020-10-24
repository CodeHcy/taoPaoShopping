package com.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;

/**
 * @author hcy
 * @create 2020-10-04-14:29
 * @flag Keep on running
 */
public class MyException extends Exception {
    public MyException() {
        super();
    }

    public MyException(String message) {
        super(message);
    }
}
