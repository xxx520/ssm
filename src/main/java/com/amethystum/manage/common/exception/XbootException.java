package com.amethystum.manage.common.exception;

import lombok.Data;

/**
 * @author Amethystum
 */
@Data
public class XbootException extends RuntimeException {

    private String msg;

    public XbootException(String msg){
        super(msg);
        this.msg = msg;
    }
}
