package com.ruoyi.project.sourcepool.dtype.service;


import com.ruoyi.project.sourcepool.dtype.domain.Dtype;

import java.util.List;

/**
 * 公告 服务层
 * 
 * @author ruoyi
 */
public interface IDtypeService
{
    /**
     * 查询公告信息
     * 
     * @param dtypeId 公告ID
     * @return 公告信息
     */
    public Dtype selectDtypeById(Long dtypeId);

    /**
     * 查询公告列表
     * 
     * @param dtype 公告信息
     * @return 公告集合
     */
    public List<Dtype> selectDtypeList(Dtype dtype);

    /**
     * 新增公告
     * 
     * @param dtype 公告信息
     * @return 结果
     */
    public int insertDtype(Dtype dtype);

    /**
     * 修改公告
     * 
     * @param dtype 公告信息
     * @return 结果
     */
    public int updateDtype(Dtype dtype);

    /**
     * 删除公告信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteDtypeByIds(String ids);
}
