package com.ruoyi.project.sourcepool.serviceitem.service;

import java.util.List;

import com.ruoyi.project.sourcepool.serviceitem.domain.Serviceitem;
import com.ruoyi.project.sourcepool.serviceitem.mapper.ServiceitemMapper;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;

/**
 * 服务项服务层实现
 * 
 * @author ruoyi
 * @date 2018-06-25
 */
@Service
public class ServiceitemServiceImpl implements IServiceitemService
{
    @Autowired
    private ServiceitemMapper serviceitemMapper;

    /**
     * 查询公告信息
     * 
     * @param serviceitemId 公告ID
     * @return 公告信息
     */
    @Override
    public Serviceitem selectServiceitemById(Long serviceitemId)
    {
        return serviceitemMapper.selectServiceitemById(serviceitemId);
    }

    /**
     * 查询公告列表
     * 
     * @param serviceitem 公告信息
     * @return 公告集合
     */
    @Override
    public List<Serviceitem> selectServiceitemList(Serviceitem serviceitem)
    {
        return serviceitemMapper.selectServiceitemList(serviceitem);
    }

    public List<Serviceitem> selectServiceitemcomList(User user)
    {
        return serviceitemMapper.selectServiceitemcomList(user);
    }

    /**
     * 新增公告
     * 
     * @param serviceitem 公告信息
     * @return 结果
     */
    @Override
    public int insertServiceitem(Serviceitem serviceitem)
    {
        serviceitem.setCreateBy(ShiroUtils.getLoginName());
        return serviceitemMapper.insertServiceitem(serviceitem);
    }

    /**
     * 修改公告
     * 
     * @param serviceitem 公告信息
     * @return 结果
     */
    @Override
    public int updateServiceitem(Serviceitem serviceitem)
    {
        serviceitem.setUpdateBy(ShiroUtils.getLoginName());
        return serviceitemMapper.updateServiceitem(serviceitem);
    }

    /**
     * 删除公告对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteServiceitemByIds(String ids)
    {
        return serviceitemMapper.deleteServiceitemByIds(Convert.toStrArray(ids));
    }
}
