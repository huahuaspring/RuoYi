package com.ruoyi.project.sourcepool.techteam.domain;

import com.ruoyi.framework.web.domain.BaseEntity;

import java.io.Serializable;

/**
 * t_techteam
 * @author 
 */
public class Techteam extends BaseEntity {
    private Long tech_id;

    private Long com_id;

    private String teamStructure;

    private String expertiseTechnology;

    private String supportPlatform;

    private String notes;

    private String teamName;

    private static final long serialVersionUID = 1L;

    public Long getTech_id() {
        return tech_id;
    }

    public void setTech_id(Long tech_id) {
        this.tech_id = tech_id;
    }

    public Long getCom_id() {
        return com_id;
    }

    public void setCom_id(Long com_id) {
        this.com_id = com_id;
    }

    public String getTeamStructure() {
        return teamStructure;
    }

    public void setTeamStructure(String teamStructure) {
        this.teamStructure = teamStructure;
    }

    public String getExpertiseTechnology() {
        return expertiseTechnology;
    }

    public void setExpertiseTechnology(String expertiseTechnology) {
        this.expertiseTechnology = expertiseTechnology;
    }

    public String getSupportPlatform() {
        return supportPlatform;
    }

    public void setSupportPlatform(String supportPlatform) {
        this.supportPlatform = supportPlatform;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", tech_id=").append(tech_id);
        sb.append(", com_id=").append(com_id);
        sb.append(", teamStructure=").append(teamStructure);
        sb.append(", expertiseTechnology=").append(expertiseTechnology);
        sb.append(", supportPlatform=").append(supportPlatform);
        sb.append(", notes=").append(notes);
        sb.append(", teamName=").append(teamName);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}