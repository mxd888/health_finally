

package com.health.modules.sys.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.health.modules.sys.entity.SysCaptchaEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 验证码
 *
 * @author 大米
 */
@Mapper
public interface SysCaptchaDao extends BaseMapper<SysCaptchaEntity> {

}
