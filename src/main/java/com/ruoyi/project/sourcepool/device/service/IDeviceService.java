package com.ruoyi.project.sourcepool.device.service;

import com.ruoyi.project.sourcepool.device.domain.Device;
import com.ruoyi.project.system.user.domain.User;

import java.util.List;

/**
 * 公告 服务层
 * 
 * @author ruoyi
 */
public interface IDeviceService
{
    /**
     * 查询公告信息
     * 
     * @param deviceId 公告ID
     * @return 公告信息
     */
    public Device selectDeviceById(Long deviceId);

    /**
     * 查询公告列表
     * 
     * @param device 公告信息
     * @return 公告集合
     */
    public List<Device> selectDeviceList(Device device);
    public List<Device> selectDevicecomList(User user);

    /**
     * 新增公告
     * 
     * @param device 公告信息
     * @return 结果
     */
    public int insertDevice(Device device);

    /**
     * 修改公告
     * 
     * @param device 公告信息
     * @return 结果
     */
    public int updateDevice(Device device);

    /**
     * 删除公告信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteDeviceByIds(String ids);
}
