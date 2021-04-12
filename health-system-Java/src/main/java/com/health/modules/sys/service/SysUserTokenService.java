

package com.health.modules.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.health.common.utils.R;
import com.health.modules.sys.entity.SysUserTokenEntity;

/**
 * 用户Token
 *
 * @author 大米
 */
public interface SysUserTokenService extends IService<SysUserTokenEntity> {

	/**
	 * 生成token
	 * @param userId  用户ID
	 */
	R createToken(long userId);

	/**
	 * 退出，修改token值
	 * @param userId  用户ID
	 */
	void logout(long userId);

}
