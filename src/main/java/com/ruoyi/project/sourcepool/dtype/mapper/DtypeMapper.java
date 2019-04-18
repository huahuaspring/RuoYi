package com.ruoyi.project.sourcepool.dtype.mapper;

import com.ruoyi.project.sourcepool.dtype.domain.Dtype;
import com.ruoyi.project.system.user.domain.User;

import java.util.List;

/**
 * 设备类型 数据层
 * 
 * @author ruoyi
 */
public interface DtypeMapper
{
    /**
     * 查询设备类型信息
     * 
     * @param dtypeId 设备类型ID
     * @return 设备类型信息
     */
    public Dtype selectDtypeById(Long dtypeId);

    /**
     * 查询设备类型列表
     * 
     * @param dtype 设备类型信息
     * @return 设备类型集合
     */
    public List<Dtype> selectDtypeList(Dtype dtype);
    public List<Dtype> selectDtypecomList(User user);
    /**
     * 新增设备类型
     * 
     * @param dtype 设备类型信息
     * @return 结果
     */
    public int insertDtype(Dtype dtype);

    /**
     * 修改设备类型
     * 
     * @param dtype 设备类型信息
     * @return 结果
     */
    public int updateDtype(Dtype dtype);

    /**
     * 批量删除设备类型
     * 
     * @param dtypeIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteDtypeByIds(String[] dtypeIds);
}