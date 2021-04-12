
package com.health.modules.oss.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.health.modules.oss.entity.SysOssEntity;
import com.health.common.utils.PageUtils;

import java.util.Map;

/**
 * 文件上传
 *
 * @author 大米
 */
public interface SysOssService extends IService<SysOssEntity> {

	PageUtils queryPage(Map<String, Object> params);
}
