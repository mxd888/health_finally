package com.health.modules.user.controller;

import java.util.Arrays;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.health.modules.user.dao.UserDao;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.health.modules.user.entity.UserEntity;
import com.health.modules.user.service.UserService;
import com.health.common.utils.PageUtils;
import com.health.common.utils.R;



/**
 * 用户
 *
 * @author mxd
 * @email 1191998028@qq.com
 * @date 2021-04-10 22:10:06
 */
@RestController
@RequestMapping("user/user")
@CrossOrigin
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserDao userDao;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("user:user:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = userService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{userId}")
    @RequiresPermissions("user:user:info")
    public R info(@PathVariable("userId") Long userId){
		UserEntity user = userService.getById(userId);


        return R.ok().put("user", user);
    }

    /**
     * 根据唯一微信id查询
     */
    @RequestMapping("/wx_info/{userId}")
    public R wx_info(@PathVariable("userId") String userId){
        QueryWrapper<UserEntity> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("open_id",userId);
        UserEntity userEntity = userDao.selectOne(queryWrapper);
        return R.ok().put("user", userEntity);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody UserEntity user){
		userService.save(user);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("user:user:update")
    public R update(@RequestBody UserEntity user){
		userService.updateById(user);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("user:user:delete")
    public R delete(@RequestBody Long[] userIds){
		userService.removeByIds(Arrays.asList(userIds));

        return R.ok();
    }

}
