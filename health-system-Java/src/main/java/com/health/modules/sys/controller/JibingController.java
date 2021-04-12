package com.health.modules.sys.controller;

import java.util.Arrays;
import java.util.Map;

import com.health.common.utils.PageUtils;
import com.health.common.utils.R;
import com.health.modules.sys.entity.JibingEntity;
import com.health.modules.sys.service.JibingService;
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
 * @date 2021-03-27 11:30:29
 */
@RestController
@RequestMapping("code/jibing")
public class JibingController {
    @Autowired
    private JibingService jibingService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("code:jibing:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = jibingService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{jibingId}")
    @RequiresPermissions("code:jibing:info")
    public R info(@PathVariable("jibingId") Long jibingId){
		JibingEntity jibing = jibingService.getById(jibingId);

        return R.ok().put("jibing", jibing);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("code:jibing:save")
    public R save(@RequestBody JibingEntity jibing){
		jibingService.save(jibing);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("code:jibing:update")
    public R update(@RequestBody JibingEntity jibing){
		jibingService.updateById(jibing);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("code:jibing:delete")
    public R delete(@RequestBody Long[] jibingIds){
		jibingService.removeByIds(Arrays.asList(jibingIds));

        return R.ok();
    }

}
