package com.health.modules.sys.controller;

import java.util.Arrays;
import java.util.Map;

import com.health.common.utils.PageUtils;
import com.health.common.utils.R;
import com.health.modules.sys.entity.XinliEntity;
import com.health.modules.sys.service.XinliService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;




/**
 * 
 *
 * @author mxd
 * @email 1191998028@qq.com
 * @date 2021-03-27 11:30:30
 */
@RestController
@RequestMapping("code/xinli")
public class XinliController {
    @Autowired
    private XinliService xinliService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("code:xinli:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = xinliService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{xinliId}")
    @RequiresPermissions("code:xinli:info")
    public R info(@PathVariable("xinliId") Long xinliId){
		XinliEntity xinli = xinliService.getById(xinliId);

        return R.ok().put("xinli", xinli);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("code:xinli:save")
    public R save(@RequestBody XinliEntity xinli){
		xinliService.save(xinli);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("code:xinli:update")
    public R update(@RequestBody XinliEntity xinli){
		xinliService.updateById(xinli);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("code:xinli:delete")
    public R delete(@RequestBody Long[] xinliIds){
		xinliService.removeByIds(Arrays.asList(xinliIds));

        return R.ok();
    }

}
