package com.ruoyi.project.sourcepool.tability.service;

import com.ruoyi.project.sourcepool.tability.domain.Tability;
import com.ruoyi.project.system.user.domain.User;

import java.util.List;

/**
 * 检测能力 服务层
 * 
 * @author ruoyi
 */
public interface ITabilityService
{
    /**
     * 查询检测能力信息
     * 
     * @param tabilityId 检测能力ID
     * @return 检测能力信息
     */
    public Tability selectTabilityById(Long tabilityId);

    /**
     * 查询检测能力列表
     * 
     * @param tability 检测能力信息
     * @return 检测能力集合
     */
    public List<Tability> selectTabilityList(Tability tability);
    public List<Tability> selectTabilitycomList(User user);

    /**
     * 新增检测能力
     * 
     * @param tability 检测能力信息
     * @return 结果
     */
    public int insertTability(Tability tability);

    /**
     * 修改检测能力
     * 
     * @param tability 检测能力信息
     * @return 结果
     */
    public int updateTability(Tability tability);

    /**
     * 删除检测能力信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTabilityByIds(String ids);
}
