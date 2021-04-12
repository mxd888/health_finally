package com.health.modules.user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.health.common.utils.PageUtils;
import com.health.modules.user.entity.UserEntity;

import java.util.Map;

/**
 * 用户
 *
 * @author mxd
 * @email 1191998028@qq.com
 * @date 2021-04-10 22:10:06
 */
public interface UserService extends IService<UserEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

