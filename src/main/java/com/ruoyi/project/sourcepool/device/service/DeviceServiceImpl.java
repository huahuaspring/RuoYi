package com.ruoyi.project.sourcepool.device.service;

import java.util.List;

import com.ruoyi.project.system.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.sourcepool.device.mapper.DeviceMapper;
import com.ruoyi.project.sourcepool.device.domain.Device;

/**
 * 公告 服务层实现
 * 
 * @author ruoyi
 * @date 2018-06-25
 */
@Service
public class DeviceServiceImpl implements IDeviceService
{
    @Autowired
    private DeviceMapper deviceMapper;

    /**
     * 查询公告信息
     * 
     * @param deviceId 公告ID
     * @return 公告信息
     */
    @Override
    public Device selectDeviceById(Long deviceId)
    {
        return deviceMapper.selectDeviceById(deviceId);
    }

    /**
     * 查询公告列表
     * 
     * @param device 公告信息
     * @return 公告集合
     */
    @Override
    public List<Device> selectDeviceList(Device device)
    {
        return deviceMapper.selectDeviceList(device);
    }

    public List<Device> selectDevicecomList(User user)
    {
        return deviceMapper.selectDevicecomList(user);
    }

    /**
     * 新增公告
     * 
     * @param device 公告信息
     * @return 结果
     */
    @Override
    public int insertDevice(Device device)
    {
        device.setCreateBy(ShiroUtils.getLoginName());
        return deviceMapper.insertDevice(device);
    }

    /**
     * 修改公告
     * 
     * @param device 公告信息
     * @return 结果
     */
    @Override
    public int updateDevice(Device device)
    {
        device.setUpdateBy(ShiroUtils.getLoginName());
        return deviceMapper.updateDevice(device);
    }

    /**
     * 删除公告对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteDeviceByIds(String ids)
    {
        return deviceMapper.deleteDeviceByIds(Convert.toStrArray(ids));
    }
}
