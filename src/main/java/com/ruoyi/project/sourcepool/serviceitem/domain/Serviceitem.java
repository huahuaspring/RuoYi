package com.ruoyi.project.sourcepool.serviceitem.domain;

import com.ruoyi.framework.web.domain.BaseEntity;
import com.ruoyi.project.sourcepool.techteam.domain.Techteam;

import java.io.Serializable;
import java.util.Date;

/**
 * t_serviceitem
 * @author 
 */
public class Serviceitem extends BaseEntity{
    private Long serviceItem_id;

    private String serviceName;

    private String publisher;

    private String telphone;

    private Long com_id;

    private Long device_id;

    private Long tech_id;

    private Long tAbli_id;

    private String publishTime;

    private Techteam techteam;

    private static final long serialVersionUID = 1L;

    public Long getServiceItem_id() {
        return serviceItem_id;
    }

    public void setServiceItem_id(Long serviceItem_id) {
        this.serviceItem_id = serviceItem_id;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public Long getCom_id() {
        return com_id;
    }

    public void setCom_id(Long com_id) {
        this.com_id = com_id;
    }

    public Long getDevice_id() {
        return device_id;
    }

    public void setDevice_id(Long device_id) {
        this.device_id = device_id;
    }

    public Long getTech_id() {
        return tech_id;
    }

    public void setTech_id(Long tech_id) {
        this.tech_id = tech_id;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public Long gettAbli_id() { return tAbli_id; }

    public void settAbli_id(Long tAbli_id) { this.tAbli_id = tAbli_id; }

    public Techteam getTechteam() {
        return techteam;
    }

    public void setTechteam(Techteam techteam) {
        this.techteam = techteam;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", serviceItem_id=").append(serviceItem_id);
        sb.append(", serviceName=").append(serviceName);
        sb.append(", publisher=").append(publisher);
        sb.append(", telphone=").append(telphone);
        sb.append(", com_id=").append(com_id);
        sb.append(", device_id=").append(device_id);
        sb.append(", tech_id=").append(tech_id);
        sb.append(", tAbli_id=").append(tAbli_id);
        sb.append(", publishTime=").append(publishTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}