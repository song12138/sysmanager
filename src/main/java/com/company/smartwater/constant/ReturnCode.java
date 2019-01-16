package com.company.smartwater.constant;

public interface ReturnCode {
    String DEFAULT_SUCCESS = "2000";
    String CREATE_SUCCESS = "2001";
    String UPDATE_SUCCESS = "2002";
    String DELETE_SUCCESS = "2003";
    String GET_SUCCESS = "2004";

    String ERROR_LOGIN = "3000";
    String ERROR_PASSWORD_NOT_CORRECT_CODE = "3006";
    String ERROR_AUTHORIZATION = "3007";

    String ERROR_TOKEN_INVALID = "3016";
    String ERROR_HEADER_NOT_FIND_APP_ID_CODE = "3018";

    String ERROR_QUERY = "4000";
    String ERROR_CREATE = "4001";

    String ERROR_UPDATE = "4002";
    String ERROR_DELETE = "4003";

    String ERROR_NO_PERMISSION = "4004";

    String ERROR_CREATE_EXISTS = "5000"; //用户已存在
    String ERROR_FIELD_EMPTY = "5001";

    String ERROR_FIELD_RANGE = "5013"; //库存不足

    String ERROR_REPERTORY_STATUS_CLOSE = "6008"; //仓库已关闭
    String ERROR_REPERTORY_STATUS_OPEN = "6009"; //仓库未关闭

}
