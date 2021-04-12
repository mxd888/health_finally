package com.health.modules.sys.controller;

import java.util.Arrays;
import java.util.Map;

import com.health.common.utils.PageUtils;
import com.health.common.utils.R;
import com.health.modules.sys.entity.YundongEntity;
import com.health.modules.sys.service.YundongService;
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
@RequestMapping("code/yundong")
public class YundongController {
    @Autowired
    private YundongService yundongService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("code:yundong:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = yundongService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{yundongId}")
    @RequiresPermissions("code:yundong:info")
    public R info(@PathVariable("yundongId") Long yundongId){
		YundongEntity yundong = yundongService.getById(yundongId);

        return R.ok().put("yundong", yundong);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("code:yundong:save")
    public R save(@RequestBody YundongEntity yundong){
		yundongService.save(yundong);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("code:yundong:update")
    public R update(@RequestBody YundongEntity yundong){
		yundongService.updateById(yundong);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("code:yundong:delete")
    public R delete(@RequestBody Long[] yundongIds){
		yundongService.removeByIds(Arrays.asList(yundongIds));

        return R.ok();
    }

}
