package com.ruoyi.project.sourcepool.dtype.controller;

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
import com.ruoyi.project.sourcepool.dtype.domain.Dtype;
import com.ruoyi.project.sourcepool.dtype.service.IDtypeService;

/**
 * 设备类型 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/sourcepool/dtype")
public class DtypeController extends BaseController
{
    private String prefix = "sourcepool/dtype";

    @Autowired
    private IDtypeService dtypeService;

    @RequiresPermissions("sourcepool:dtype:view")
    @GetMapping()
    public String dtype()
    {
        return prefix + "/dtype";
    }

    /**
     * 查询设备类型列表
     */
    @RequiresPermissions("sourcepool:dtype:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Dtype dtype)
    {
        startPage();
        User user=getSysUser();
        List<Dtype> list = new LinkedList<Dtype>();
           if(user.isAdmin()) {
               list = dtypeService.selectDtypeList(dtype);
           }else {
               list = dtypeService.selectDtypecomList(user);
           }
        return getDataTable(list);
    }

    /**
     * 新增设备类型
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存设备类型
     */
    @RequiresPermissions("sourcepool:dtype:add")
    @Log(title = "通知设备类型", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Dtype dtype)
    {  System.out.println("-------data-----"+getSysUser().getComId());
       User user=getSysUser();
        dtype.setCom_id(user.getComId());
        return toAjax(dtypeService.insertDtype(dtype));
    }

    /**
     * 修改设备类型
     */
    @GetMapping("/edit/{dtypeId}")
    public String edit(@PathVariable("dtypeId") Long dtypeId, ModelMap mmap)
    {
        mmap.put("dtype", dtypeService.selectDtypeById(dtypeId));
        return prefix + "/edit";
    }

    /**
     * 修改保存设备类型
     */
    @RequiresPermissions("sourcepool:dtype:edit")
    @Log(title = "通知设备类型", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Dtype dtype)
    {
        return toAjax(dtypeService.updateDtype(dtype));
    }

    /**
     * 删除设备类型
     */
    @RequiresPermissions("sourcepool:dtype:remove")
    @Log(title = "通知设备类型", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(dtypeService.deleteDtypeByIds(ids));
    }
}
