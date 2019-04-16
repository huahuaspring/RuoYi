package com.ruoyi.project.sourcepool.tability.controller;

import java.util.LinkedList;
import java.util.List;

import com.ruoyi.project.sourcepool.tability.domain.Tability;
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
import com.ruoyi.project.sourcepool.tability.service.ITabilityService;

/**
 * 检测能力 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/sourcepool/tability")
public class TabilityController extends BaseController
{
    private String prefix = "sourcepool/tability";

    @Autowired
    private ITabilityService tabilityService;

    @RequiresPermissions("sourcepool:tability:view")
    @GetMapping()
    public String tability()
    {
        return prefix + "/tability";
    }

    /**
     * 查询检测能力列表
     */
    @RequiresPermissions("sourcepool:tability:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Tability tability)
    {
        List<Tability> list=new LinkedList<Tability>();
        startPage();
       User user=getSysUser();
       if(user.isAdmin()){
        list = tabilityService.selectTabilityList(tability);
       }else{
           System.out.println("a----------"+user.getComId());
           list=tabilityService.selectTabilitycomList(user);
       }
        return getDataTable(list);
    }

    /**
     * 新增检测能力
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存检测能力
     */
    @RequiresPermissions("sourcepool:tability:add")
    @Log(title = "通知检测能力", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Tability tability)
    {
        User user=getSysUser();
        tability.setCom_id(user.getComId());
        return toAjax(tabilityService.insertTability(tability));
    }

    /**
     * 修改检测能力
     */
    @GetMapping("/edit/{tabilityId}")
    public String edit(@PathVariable("tabilityId") Long tabilityId, ModelMap mmap)
    {
        mmap.put("tability", tabilityService.selectTabilityById(tabilityId));
        return prefix + "/edit";
    }

    /**
     * 查检测能力详情
     */
   /* @RequiresPermissions("sourcepool:tability:details")*/
    @GetMapping("/details/{tabilityId}")
    public String details(@PathVariable("tabilityId") Long tabilityId, ModelMap mmap)
    {
        mmap.put("tability", tabilityService.selectTabilityById(tabilityId));
        return prefix + "/details";
    }

    /**
     * 修改保存检测能力
     */
    @RequiresPermissions("sourcepool:tability:edit")
    @Log(title = "通知检测能力", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Tability tability)
    {
        return toAjax(tabilityService.updateTability(tability));
    }

    /**
     * 删除检测能力
     */
    @RequiresPermissions("sourcepool:tability:remove")
    @Log(title = "通知检测能力", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tabilityService.deleteTabilityByIds(ids));
    }
}
