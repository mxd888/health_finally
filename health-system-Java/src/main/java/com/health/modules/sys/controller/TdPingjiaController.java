package com.health.modules.sys.controller;

import java.util.Arrays;
import java.util.Map;

import com.health.common.utils.PageUtils;
import com.health.common.utils.R;
import com.health.modules.sys.entity.TdPingjiaEntity;
import com.health.modules.sys.service.TdPingjiaService;
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
@RequestMapping("code/tdpingjia")
public class TdPingjiaController {
    @Autowired
    private TdPingjiaService tdPingjiaService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("code:tdpingjia:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = tdPingjiaService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{pingjiaId}")
    @RequiresPermissions("code:tdpingjia:info")
    public R info(@PathVariable("pingjiaId") Long pingjiaId){
		TdPingjiaEntity tdPingjia = tdPingjiaService.getById(pingjiaId);

        return R.ok().put("tdPingjia", tdPingjia);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("code:tdpingjia:save")
    public R save(@RequestBody TdPingjiaEntity tdPingjia){
		tdPingjiaService.save(tdPingjia);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("code:tdpingjia:update")
    public R update(@RequestBody TdPingjiaEntity tdPingjia){
		tdPingjiaService.updateById(tdPingjia);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("code:tdpingjia:delete")
    public R delete(@RequestBody Long[] pingjiaIds){
		tdPingjiaService.removeByIds(Arrays.asList(pingjiaIds));

        return R.ok();
    }

}
