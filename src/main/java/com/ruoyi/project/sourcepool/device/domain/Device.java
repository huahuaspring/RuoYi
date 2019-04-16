package com.ruoyi.project.sourcepool.device.domain;
import com.ruoyi.framework.web.domain.BaseEntity;
import com.ruoyi.project.sourcepool.dtype.domain.Dtype;

/**
 * t_device
 * @author 
 */
public class Device extends BaseEntity
{
    private Long device_id;

    private String deviceName;

    private String deviceDesc;

    private Integer deviceStatus;

    private Double devicePrice;

    private String imgUrl;

    private String buyTime;

    private String registerTime;

    private String deviceSupply;

    private String dtype_id;

    private String deviceSize;

    private Long com_id;

    private Long tAbli_id;

    private String testContent;

    private Dtype dtype;

    private static final long serialVersionUID = 1L;

    public Long getDevice_id() {
        return device_id;
    }

    public void setDevice_id(Long device_id) {
        this.device_id = device_id;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDeviceDesc() {
        return deviceDesc;
    }

    public void setDeviceDesc(String deviceDesc) {
        this.deviceDesc = deviceDesc;
    }

    public Integer getDeviceStatus() {
        return deviceStatus;
    }

    public void setDeviceStatus(Integer deviceStatus) {
        this.deviceStatus = deviceStatus;
    }

    public Double getDevicePrice() {
        return devicePrice;
    }

    public void setDevicePrice(Double devicePrice) {
        this.devicePrice = devicePrice;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(String buyTime) {
        this.buyTime = buyTime;
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }

    public String getDeviceSupply() {
        return deviceSupply;
    }

    public void setDeviceSupply(String deviceSupply) {
        this.deviceSupply = deviceSupply;
    }

    public String getDtype_id() {
        return dtype_id;
    }

    public void setDtype_id(String dtype_id) {
        this.dtype_id = dtype_id;
    }

    public String getDeviceSize() {
        return deviceSize;
    }

    public void setDeviceSize(String deviceSize) {
        this.deviceSize = deviceSize;
    }

    public Long getCom_id() {
        return com_id;
    }

    public void setCom_id(Long com_id) {
        this.com_id = com_id;
    }

    public Long gettAbli_id() {
        return tAbli_id;
    }

    public void settAbli_id(Long tAbli_id) {
        this.tAbli_id = tAbli_id;
    }

    public String getTestContent() {
        return testContent;
    }

    public void setTestContent(String testContent) {
        this.testContent = testContent;
    }

    public Dtype getDtype() {
        return dtype;
    }

    public void setDtype(Dtype dtype) {
        this.dtype = dtype;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", device_id=").append(device_id);
        sb.append(", deviceName=").append(deviceName);
        sb.append(", deviceDesc=").append(deviceDesc);
        sb.append(", deviceStatus=").append(deviceStatus);
        sb.append(", devicePrice=").append(devicePrice);
        sb.append(", imgUrl=").append(imgUrl);
        sb.append(", buyTime=").append(buyTime);
        sb.append(", registerTime=").append(registerTime);
        sb.append(", deviceSupply=").append(deviceSupply);
        sb.append(", dtype_id=").append(dtype_id);
        sb.append(", deviceSize=").append(deviceSize);
        sb.append(", com_id=").append(com_id);
        sb.append(", tAbli_id=").append(tAbli_id);
        sb.append(", testContent=").append(testContent);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}