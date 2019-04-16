package com.ruoyi.project.sourcepool.dtype.domain;
import com.ruoyi.framework.web.domain.BaseEntity;

import java.util.Date;

/**
 * t_dtype
 * @author 
 */
public class Dtype extends BaseEntity{
    private Long dtype_id;

    private String deviceType;

    private Long com_id;

    private Date insertTime;

    private String typeDesc;

    private static final long serialVersionUID = 1L;

    public Long getDtype_id() {
        return dtype_id;
    }

    public void setDtype_id(Long dtype_id) {
        this.dtype_id = dtype_id;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public Long getCom_id() {
        return com_id;
    }

    public void setCom_id(Long com_id) {
        this.com_id = com_id;
    }

    public Date getInsertTime() {
        return insertTime;
    }

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }

    public String getTypeDesc() {
        return typeDesc;
    }

    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc;
    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", dtype_id=").append(dtype_id);
        sb.append(", deviceType=").append(deviceType);
        sb.append(", com_id=").append(com_id);
        sb.append(", insertTime=").append(insertTime);
        sb.append(", typeDesc=").append(typeDesc);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}