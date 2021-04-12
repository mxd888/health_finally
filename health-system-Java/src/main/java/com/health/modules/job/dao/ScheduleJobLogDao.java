

package com.health.modules.job.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.health.modules.job.entity.ScheduleJobLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 定时任务日志
 *
 * @author 大米
 */
@Mapper
public interface ScheduleJobLogDao extends BaseMapper<ScheduleJobLogEntity> {
	
}
