package com.ruoyi.project.sourcepool.serviceitem.mapper;


import com.ruoyi.project.sourcepool.serviceitem.domain.Serviceitem;
import com.ruoyi.project.system.user.domain.User;

import java.util.List;

/**
 * 公告 数据层
 * 
 * @author ruoyi
 */
public interface ServiceitemMapper
{
    /**
     * 查询公告信息
     * 
     * @param serviceitemId 公告ID
     * @return 公告信息
     */
    public Serviceitem selectServiceitemById(Long serviceitemId);

    /**
     * 查询公告列表
     * 
     * @param serviceitem 公告信息
     * @return 公告集合
     */
    public List<Serviceitem> selectServiceitemList(Serviceitem serviceitem);
    public List<Serviceitem> selectServiceitemcomList(User user);
    /**
     * 新增公告
     * 
     * @param serviceitem 公告信息
     * @return 结果
     */
    public int insertServiceitem(Serviceitem serviceitem);

    /**
     * 修改公告
     * 
     * @param serviceitem 公告信息
     * @return 结果
     */
    public int updateServiceitem(Serviceitem serviceitem);

    /**
     * 批量删除公告
     * 
     * @param serviceitemIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteServiceitemByIds(String[] serviceitemIds);
}