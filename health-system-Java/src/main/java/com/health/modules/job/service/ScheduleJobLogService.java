

package com.health.modules.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.health.common.utils.PageUtils;
import com.health.modules.job.entity.ScheduleJobLogEntity;

import java.util.Map;

/**
 * 定时任务日志
 *
 * @author 大米
 */
public interface ScheduleJobLogService extends IService<ScheduleJobLogEntity> {

	PageUtils queryPage(Map<String, Object> params);
	
}
