package com.ruoyi.project.sourcepool.serviceitem.controller;

import java.util.LinkedList;
import java.util.List;
import com.ruoyi.project.sourcepool.serviceitem.domain.Serviceitem;
import com.ruoyi.project.sourcepool.serviceitem.service.IServiceitemService;
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

/**
 * 服务项 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/sourcepool/serviceitem")
public class ServiceitemController extends BaseController
{
    private String prefix = "sourcepool/serviceitem";

    @Autowired
    private IServiceitemService serviceitemService;

    @RequiresPermissions("sourcepool:serviceitem:view")
    @GetMapping()
    public String serviceitem()
    {
        return prefix + "/serviceitem";
    }

    /**
     * 查询服务项列表
     */
    @RequiresPermissions("sourcepool:serviceitem:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Serviceitem serviceitem)
    {
        startPage();
        List<Serviceitem> list =new LinkedList<Serviceitem>();
        User user=getSysUser();
        if(user.isAdmin()) {
            list = serviceitemService.selectServiceitemList(serviceitem);
        }else{
            list = serviceitemService.selectServiceitemcomList(user);
        }
        return getDataTable(list);
    }

    /**
     * 新增服务项
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存服务项
     */
    @RequiresPermissions("sourcepool:serviceitem:add")
    @Log(title = "通知服务项", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Serviceitem serviceitem)
    {
        serviceitem.setCom_id(getSysUser().getComId());
        serviceitem.setPublisher(getSysUser().getLoginName());
        return toAjax(serviceitemService.insertServiceitem(serviceitem));
    }

    /**
     * 修改服务项
     */
    @GetMapping("/edit/{serviceitemId}")
    public String edit(@PathVariable("serviceitemId") Long serviceitemId, ModelMap mmap)
    {
        mmap.put("serviceitem", serviceitemService.selectServiceitemById(serviceitemId));
        return prefix + "/edit";
    }

    /**
     * 修改保存服务项
     */
    @RequiresPermissions("sourcepool:serviceitem:edit")
    @Log(title = "通知服务项", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Serviceitem serviceitem)
    {
        return toAjax(serviceitemService.updateServiceitem(serviceitem));
    }

    /**
     * 删除服务项
     */
    @RequiresPermissions("sourcepool:serviceitem:remove")
    @Log(title = "通知服务项", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(serviceitemService.deleteServiceitemByIds(ids));
    }

    /**
     * 查检测服务项详情
     */
   /* @RequiresPermissions("sourcepool:device:details")*/
    @GetMapping("/details/{Id}")
    public String details(@PathVariable("Id") Long Id, ModelMap mmap)
    {
        mmap.put("serviceitem", serviceitemService.selectServiceitemById(Id));
        return prefix + "/details";
    }
}
