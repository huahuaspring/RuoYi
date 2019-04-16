package com.ruoyi.project.sourcepool.techteam.service;

import java.util.List;


import com.ruoyi.project.sourcepool.techteam.domain.Techteam;
import com.ruoyi.project.sourcepool.techteam.mapper.TechteamMapper;
import com.ruoyi.project.system.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;

/**
 * 公告 服务层实现
 * 
 * @author ruoyi
 * @date 2018-06-25
 */
@Service
public class TechteamServiceImpl implements ITechteamService
{
    @Autowired
    private TechteamMapper techteamMapper;

    /**
     * 查询公告信息
     * 
     * @param techteamId 公告ID
     * @return 公告信息
     */
    @Override
    public Techteam selectTechteamById(Long techteamId)
    {
        return techteamMapper.selectTechteamById(techteamId);
    }


    /**
     * 查询公告列表
     * 
     * @param techteam 公告信息
     * @return 公告集合
     */
    @Override
    public List<Techteam> selectTechteamList(Techteam techteam)
    {
        return techteamMapper.selectTechteamList(techteam);
    }
    public List<Techteam> selectTechteamcomList(User user)
    {
        return techteamMapper.selectTechteamcomList(user);
    }

    /**
     * 新增公告
     * 
     * @param techteam 公告信息
     * @return 结果
     */
    @Override
    public int insertTechteam(Techteam techteam)
    {
        techteam.setCreateBy(ShiroUtils.getLoginName());
        return techteamMapper.insertTechteam(techteam);
    }

    /**
     * 修改公告
     * 
     * @param techteam 公告信息
     * @return 结果
     */
    @Override
    public int updateTechteam(Techteam techteam)
    {
        techteam.setUpdateBy(ShiroUtils.getLoginName());
        return techteamMapper.updateTechteam(techteam);
    }

    /**
     * 删除公告对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTechteamByIds(String ids)
    {
        return techteamMapper.deleteTechteamByIds(Convert.toStrArray(ids));
    }
}
