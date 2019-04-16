package com.ruoyi.project.sourcepool.dtype.service;

import java.util.List;

import com.ruoyi.project.sourcepool.device.service.IDeviceService;
import com.ruoyi.project.sourcepool.dtype.domain.Dtype;
import com.ruoyi.project.sourcepool.dtype.mapper.DtypeMapper;
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
public class DtypeServiceImpl implements IDtypeService
{
    @Autowired
    private DtypeMapper dtypeMapper;

    /**
     * 查询公告信息
     * 
     * @param dtypeId 公告ID
     * @return 公告信息
     */
    public Dtype selectDtypeById(Long dtypeId)
    {
        return dtypeMapper.selectDtypeById(dtypeId);
    }

    /**
     * 查询公告列表
     * 
     * @param dtype 公告信息
     * @return 公告集合
     */
    public List<Dtype> selectDtypeList(Dtype dtype)
    {
        return dtypeMapper.selectDtypeList(dtype);
    }

    /**
     * 新增公告
     * 
     * @param dtype 公告信息
     * @return 结果
     */
    public int insertDtype(Dtype dtype)
    {
        dtype.setCreateBy(ShiroUtils.getLoginName());
        return dtypeMapper.insertDtype(dtype);
    }

    /**
     * 修改公告
     * 
     * @param dtype 公告信息
     * @return 结果
     */
    public int updateDtype(Dtype dtype)
    {
        dtype.setUpdateBy(ShiroUtils.getLoginName());
        return dtypeMapper.updateDtype(dtype);
    }

    /**
     * 删除公告对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteDtypeByIds(String ids)
    {
        return dtypeMapper.deleteDtypeByIds(Convert.toStrArray(ids));
    }
}
