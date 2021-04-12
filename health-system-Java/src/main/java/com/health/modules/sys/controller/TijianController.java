package com.health.modules.sys.controller;

import java.util.Arrays;
import java.util.Map;

import com.health.common.utils.PageUtils;
import com.health.common.utils.R;
import com.health.modules.sys.entity.TijianEntity;
import com.health.modules.sys.service.TijianService;
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
@RequestMapping("code/tijian")
public class TijianController {
    @Autowired
    private TijianService tijianService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("code:tijian:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = tijianService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{tijianId}")
    @RequiresPermissions("code:tijian:info")
    public R info(@PathVariable("tijianId") Long tijianId){
		TijianEntity tijian = tijianService.getById(tijianId);

        return R.ok().put("tijian", tijian);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("code:tijian:save")
    public R save(@RequestBody TijianEntity tijian){
		tijianService.save(tijian);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("code:tijian:update")
    public R update(@RequestBody TijianEntity tijian){
		tijianService.updateById(tijian);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("code:tijian:delete")
    public R delete(@RequestBody Long[] tijianIds){
		tijianService.removeByIds(Arrays.asList(tijianIds));

        return R.ok();
    }

}
