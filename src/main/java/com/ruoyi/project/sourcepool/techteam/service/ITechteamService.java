package com.ruoyi.project.sourcepool.techteam.service;


import com.ruoyi.project.sourcepool.techteam.domain.Techteam;
import com.ruoyi.project.system.user.domain.User;

import java.util.List;

/**
 * 公告 服务层
 * 
 * @author ruoyi
 */
public interface ITechteamService
{
    /**
     * 查询公告信息
     * 
     * @param techteamId 公告ID
     * @return 公告信息
     */
    public Techteam selectTechteamById(Long techteamId);

    /**
     * 查询公告列表
     * 
     * @param techteam 公告信息
     * @return 公告集合
     */
    public List<Techteam> selectTechteamList(Techteam techteam);
    public List<Techteam> selectTechteamcomList(User user);
    /**
     * 新增公告
     * 
     * @param techteam 公告信息
     * @return 结果
     */
    public int insertTechteam(Techteam techteam);

    /**
     * 修改公告
     * 
     * @param techteam 公告信息
     * @return 结果
     */
    public int updateTechteam(Techteam techteam);

    /**
     * 删除公告信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTechteamByIds(String ids);
}
