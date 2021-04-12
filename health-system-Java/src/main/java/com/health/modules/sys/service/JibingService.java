package com.health.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.health.common.utils.PageUtils;
import com.health.modules.sys.entity.JibingEntity;

import java.util.Map;

/**
 * 
 *
 * @author mxd
 * @email 1191998028@qq.com
 * @date 2021-03-27 11:30:29
 */
public interface JibingService extends IService<JibingEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

