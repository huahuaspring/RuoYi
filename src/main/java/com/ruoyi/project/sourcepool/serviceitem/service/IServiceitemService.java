package com.ruoyi.project.sourcepool.serviceitem.service;


import com.ruoyi.project.sourcepool.serviceitem.domain.Serviceitem;
import com.ruoyi.project.system.user.domain.User;

import java.util.List;

/**
 * 公告 服务层
 * 
 * @author ruoyi
 */
public interface IServiceitemService
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
     * 删除公告信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteServiceitemByIds(String ids);
}
