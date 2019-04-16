package com.ruoyi.project.sourcepool.techteam.controller;

import java.util.LinkedList;
import java.util.List;

import com.ruoyi.project.sourcepool.techteam.domain.Techteam;
import com.ruoyi.project.sourcepool.techteam.service.ITechteamService;
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
 * 技术团队 信息操作处理
 * 
 * @author ruoyi
 */
@Controller
@RequestMapping("/sourcepool/techteam")
public class TechteamController extends BaseController
{
    private String prefix = "sourcepool/techteam";

    @Autowired
    private ITechteamService techteamService;

    @RequiresPermissions("sourcepool:techteam:view")
    @GetMapping()
    public String techteam()
    {
        return prefix + "/techteam";
    }

    /**
     * 查询技术团队列表
     */
    @RequiresPermissions("sourcepool:techteam:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Techteam techteam)
    {
        startPage();
        List<Techteam> list=new LinkedList<Techteam>();
        User user=getSysUser();
             if(user.isAdmin()) {
                 list = techteamService.selectTechteamList(techteam);
             }else{
                 list=techteamService.selectTechteamcomList(user);
             }
        return getDataTable(list);
    }

    /**
     * 新增技术团队
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存技术团队
     */
    @RequiresPermissions("sourcepool:techteam:add")
    @Log(title = "通知技术团队", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Techteam techteam)
    {
       techteam.setCom_id(getSysUser().getComId());
        return toAjax(techteamService.insertTechteam(techteam));
    }

    /**
     * 修改技术团队
     */
    @GetMapping("/edit/{techteamId}")
    public String edit(@PathVariable("techteamId") Long techteamId, ModelMap mmap)
    {
        mmap.put("techteam", techteamService.selectTechteamById(techteamId));
        return prefix + "/edit";
    }

    /**
     * 修改保存技术团队
     */
    @RequiresPermissions("sourcepool:techteam:edit")
    @Log(title = "通知技术团队", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Techteam techteam)
    {
        return toAjax(techteamService.updateTechteam(techteam));
    }

    /**
     * 删除技术团队
     */
    @RequiresPermissions("sourcepool:techteam:remove")
    @Log(title = "通知技术团队", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(techteamService.deleteTechteamByIds(ids));
    }

    /**
     * 查技术团队详情
     */
   /* @RequiresPermissions("sourcepool:device:details")*/
    @GetMapping("/details/{tech_id}")
    public String details(@PathVariable("tech_id") Long tech_id, ModelMap mmap)
    {
        mmap.put("techteam", techteamService.selectTechteamById(tech_id));
        return prefix + "/details";
    }
}
