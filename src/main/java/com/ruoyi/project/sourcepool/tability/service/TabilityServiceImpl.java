package com.ruoyi.project.sourcepool.tability.service;

import java.util.List;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.sourcepool.tability.mapper.TabilityMapper;
import com.ruoyi.project.sourcepool.tability.domain.Tability;

/**
 * 公告 服务层实现
 * 
 * @author ruoyi
 * @date 2018-06-25
 */
@Service
public class TabilityServiceImpl implements ITabilityService
{
    @Autowired
    private TabilityMapper tabilityMapper;

    /**
     * 查询公告信息
     * 
     * @param tabilityId 公告ID
     * @return 公告信息
     */
    @Override
    public Tability selectTabilityById(Long tabilityId)
    {
        return tabilityMapper.selectTabilityById(tabilityId);
    }

    /**
     * 查询公告列表
     * 
     * @param tability 公告信息
     * @return 公告集合
     */
    @Override
    public List<Tability> selectTabilityList(Tability tability)
    {
        return tabilityMapper.selectTabilityList(tability);
    }

    public List<Tability> selectTabilitycomList(User user)
    {
        return tabilityMapper.selectTabilitycomList(user);
    }

    /**
     * 新增公告
     * 
     * @param tability 公告信息
     * @return 结果
     */
    @Override
    public int insertTability(Tability tability)
    {
        tability.setCreateBy(ShiroUtils.getLoginName());
        return tabilityMapper.insertTability(tability);
    }

    /**
     * 修改公告
     * 
     * @param tability 公告信息
     * @return 结果
     */
    @Override
    public int updateTability(Tability tability)
    {
        tability.setUpdateBy(ShiroUtils.getLoginName());
        return tabilityMapper.updateTability(tability);
    }

    /**
     * 删除公告对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTabilityByIds(String ids)
    {
        return tabilityMapper.deleteTabilityByIds(Convert.toStrArray(ids));
    }
}
