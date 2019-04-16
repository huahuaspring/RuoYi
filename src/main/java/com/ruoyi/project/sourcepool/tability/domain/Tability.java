package com.ruoyi.project.sourcepool.tability.domain;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * t_device
 * @author 
 */
public class Tability extends BaseEntity
{
    private Long tAbility_id;

    private String materialKind;

    private String sizeRange;

    private Long tItem_id;

    private Long com_id;

    private String mainStandard;

    private String otherStandard;

    private String otherinfo;

    private static final long serialVersionUID = 1L;

    public String getMaterialKind() {
        return materialKind;
    }

    public void setMaterialKind(String materialKind) {
        this.materialKind = materialKind;
    }

    public Long gettItem_id() {
        return tItem_id;
    }

    public void settItem_id(Long tItem_id) {
        this.tItem_id = tItem_id;
    }

    public Long getCom_id() {
        return com_id;
    }

    public void setCom_id(Long com_id) {
        this.com_id = com_id;
    }

    public String getMainStandard() {
        return mainStandard;
    }

    public void setMainStandard(String mainStandard) {
        this.mainStandard = mainStandard;
    }

    public String getOtherStandard() {
        return otherStandard;
    }

    public void setOtherStandard(String otherStandard) {
        this.otherStandard = otherStandard;
    }

    public String getOtherinfo() {
        return otherinfo;
    }

    public void setOtherinfo(String otherinfo) {
        this.otherinfo = otherinfo;
    }

    public Long gettAbility_id() {
        return tAbility_id;
    }

    public void settAbility_id(Long tAbility_id) {
        this.tAbility_id = tAbility_id;
    }

    public String getSizeRange() {
        return sizeRange;
    }

    public void setSizeRange(String sizeRange) {
        this.sizeRange = sizeRange;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", tAblity_id=").append(tAbility_id);
        sb.append(", materialKind=").append(materialKind);
        sb.append(", sizeRange=").append(sizeRange);
        sb.append(", tItem_id=").append(tItem_id);
        sb.append(", com_id=").append(com_id);
        sb.append(", mainStandard=").append(mainStandard);
        sb.append(", otherStandard=").append(otherStandard);
        sb.append(", otherinfo=").append(otherinfo);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}