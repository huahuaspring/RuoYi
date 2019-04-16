package com.ruoyi.project.sourcepool.device.controller;

import java.util.LinkedList;
import java.util.List;

import com.ruoyi.project.system.user.domain.User;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.sourcepool.device.domain.Device;
import com.ruoyi.project.sourcepool.device.service.IDeviceService;

/**
 * 设备 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/sourcepool/device")
public class DeviceController extends BaseController
{
    private String prefix = "sourcepool/device";

    @Autowired
    private IDeviceService deviceService;

    @RequiresPermissions("sourcepool:device:view")
    @GetMapping()
    public String device()
    {
        return prefix + "/device";
    }

    /**
     * 查询设备列表
     */
    @RequiresPermissions("sourcepool:device:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Device device)
    {
        List<Device> list=new LinkedList<Device>();
        startPage();
       User user=getSysUser();
       if(user.isAdmin()){
        list = deviceService.selectDeviceList(device);
       }else{
           System.out.println("a----------"+user.getComId());
           list=deviceService.selectDevicecomList(user);
       }
        return getDataTable(list);
    }

    /**
     * 新增设备
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存设备
     */
    @RequiresPermissions("sourcepool:device:add")
    @Log(title = "通知设备", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Device device)
    {
        User user=getSysUser();
        device.setCom_id(user.getComId());
        return toAjax(deviceService.insertDevice(device));
    }

    /**
     * 修改设备
     */
    @GetMapping("/edit/{deviceId}")
    public String edit(@PathVariable("deviceId") Long deviceId, ModelMap mmap)
    {
        mmap.put("device", deviceService.selectDeviceById(deviceId));
        return prefix + "/edit";
    }

    /**
     * 查设备详情
     */
   /* @RequiresPermissions("sourcepool:device:details")*/
    @GetMapping("/details/{deviceId}")
    public String details(@PathVariable("deviceId") Long deviceId, ModelMap mmap)
    {
        mmap.put("device", deviceService.selectDeviceById(deviceId));
        return prefix + "/details";
    }

    /**
     * 修改保存设备
     */
    @RequiresPermissions("sourcepool:device:edit")
    @Log(title = "通知设备", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Device device)
    {
        return toAjax(deviceService.updateDevice(device));
    }

    /**
     * 删除设备
     */
    @RequiresPermissions("sourcepool:device:remove")
    @Log(title = "通知设备", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(deviceService.deleteDeviceByIds(ids));
    }
}
