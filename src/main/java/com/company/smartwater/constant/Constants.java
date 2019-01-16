package com.company.smartwater.constant;

import java.util.UUID;

/**
 * Application constants.
 */
public final class Constants {

    public static final String SYSTEM_ACCOUNT = "system";

    public static final String DEFAULT_PROFILE = "local";

    public static final String HEADER_APP_ID = "appId";
    
    private Constants() {
    }
    public static final String STATUS_ACTIVE = "A";
    public static final String STATUS_INACTIVE = "I";
    public static final String STATUS_DELETE = "D";
    public static final String STATUS_CLOSE = "C";

    public static final String COMMON_YES="Y";
    public static final String COMMON_NO="N";

    public static final String MODULE_NAME = "uaa";

    public static String getUUID32(){
        return UUID.randomUUID().toString().replace("-", "").toLowerCase();
    }

    public enum EquipmentStatus {
        U("使用中"),
        B("备用中"),
        D("已报废");

        String desc;

        EquipmentStatus(String desc) {
            this.desc = desc;
        }

        public static String getDesc(String _name) {
            EquipmentStatus[] list = values();
            for (EquipmentStatus o : list) {
                if (o.name().equals(_name)) {
                    return o.getDesc();
                }
            }
            return null;
        }

        public String getDesc() {
            return desc;
        }
    }

    public enum BaseDataType {
        //用于报警类型
        //用于库存管理: 计量单位,物料类别,供应商分类
        AT("报警类型"),
        /*EM("设备用途"),
        ET("设备类型"),
        EP("安装位置"),*/
        MU("计量单位"),
        MT("物料类别"),
        MP("供应商分类");

        String desc;

        BaseDataType(String desc) {
            this.desc = desc;
        }

        public static String getDesc(String _name) {
            BaseDataType[] list = values();
            for (BaseDataType o : list) {
                if (o.name().equals(_name)) {
                    return o.getDesc();
                }
            }
            return null;
        }

        public String getDesc() {
            return desc;
        }
    }

    //工单类别
    public static final String ORDER_TYPE_PATROL = "PATROL";
    public static final String ORDER_TYPE_MAINTAIN = "MAINTAIN";
    public static final String ORDER_TYPE_REPAIR = "REPAIR";

    //工单状态
    public static final String ORDER_STATUS_PA = "PA";//待审核
    public static final String ORDER_STATUS_PD = "PD";//待分单
    public static final String ORDER_STATUS_PI = "PI";//处理中
    public static final String ORDER_STATUS_PC = "PC";//待验收
    public static final String ORDER_STATUS_PF = "PF";//待反馈
    public static final String ORDER_STATUS_CL = "CL";//已关闭
    public static final String ORDER_STATUS_CR = "CR";//验收驳回
    public static final String ORDER_STATUS_AR = "AR";//审核驳回

    //保养工单保养状态
    public static final String ORDER_MAINTAIN_ITEM_STATUS_C = "C";//完成
    public static final String ORDER_MAINTAIN_ITEM_STATUS_P = "P";//未完成

    //领料审核状态
    public static final String MA_APPLY_STATUS_PA = "PA";//待审核
    public static final String MA_APPLY_STATUS_PO = "PO";//待出库
    public static final String MA_APPLY_STATUS_CO = "CO";//已出库
    public static final String MA_APPLY_STATUS_CR = "CR";//已驳回

    //查询配置的常量
    public static final String MODULE_NAME_LOGIN = "LOGIN";


    public static final String CLIENT_ID = "pc";
    public static final String CLIENT_APP = "app_android";


    //common key
    public static final String COMMON_KEY_LOGIN = "LOGIN";
    public static final String COMMON_KEY_USERINFO = "USERINFO";

    //出库单中的来源类型
    public static final String REPERTORY_SOURCE_TYPE_1="1"; //手动添加
    public static final String REPERTORY_SOURCE_TYPE_2="2"; //领料单

    //group type定义
    public static final String GROUP_TYPE_C="C"; //单位
    public static final String GROUP_TYPE_D="D";//部门
    public static final String GROUP_TYPE_T="T";//组

    //组职责定义
    public static final String GROUP_TEAM_M1="M1"; //保养
    public static final String GROUP_TEAM_M2="M2"; //维修
    public static final String GROUP_TEAM_C1="C1"; //巡检
    public static final String GROUP_TEAM_O1="O1"; //其它
}
