

package com.health.modules.sys.controller;

import com.health.common.annotation.SysLog;
import com.health.common.utils.Constant;
import com.health.common.utils.PageUtils;
import com.health.common.utils.R;
import com.health.common.validator.Assert;
import com.health.common.validator.ValidatorUtils;
import com.health.common.validator.group.AddGroup;
import com.health.common.validator.group.UpdateGroup;
import com.health.modules.sys.entity.SysDoctorEntity;
import com.health.modules.sys.entity.SysUserEntity;
import com.health.modules.sys.form.PasswordForm;
import com.health.modules.sys.service.SysDoctorService;
import com.health.modules.sys.service.SysUserRoleService;
import com.health.modules.sys.service.SysUserService;
import org.apache.commons.lang.ArrayUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 系统医生
 *
 * @author 大米
 */
@RestController
@RequestMapping("/sys/doctor")
public class SysDoctorController extends AbstractController {
	@Autowired
	private SysDoctorService sysUserService;



	/**
	 * 所有医生列表
	 */
	@GetMapping("/list")
	@RequiresPermissions("sys:doctor:list")
	public R list(@RequestParam Map<String, Object> params){
		//只有超级管理员，才能查看所有管理员列表
		if(getUserId() != Constant.SUPER_ADMIN){
			params.put("createUserId", getUserId());
		}
		PageUtils page = sysUserService.queryPage(params);

		return R.ok().put("page", page);
	}
	
	
	
	/**
	 * 医生信息
	 */
	@GetMapping("/info/{userId}")
	@RequiresPermissions("sys:doctor:info")
	public R info(@PathVariable("userId") Long userId){
		SysDoctorEntity user = sysUserService.getById(userId);

		
		return R.ok().put("user", user);
	}
	
	/**
	 * 保存医生
	 */
	@SysLog("保存医生")
	@PostMapping("/save")
	@RequiresPermissions("sys:doctor:save")
	public R save(@RequestBody SysDoctorEntity user){
		ValidatorUtils.validateEntity(user, AddGroup.class);

		sysUserService.saveUser(user);
		
		return R.ok();
	}
	
	/**
	 * 修改医生
	 */
	@SysLog("修改医生")
	@PostMapping("/update")
	@RequiresPermissions("sys:doctor:update")
	public R update(@RequestBody SysDoctorEntity user){
		ValidatorUtils.validateEntity(user, UpdateGroup.class);
		sysUserService.update(user);
		
		return R.ok();
	}
	
	/**
	 * 删除医生
	 */
	@SysLog("删除医生")
	@PostMapping("/delete")
	@RequiresPermissions("sys:doctor:delete")
	public R delete(@RequestBody Long[] userIds){
		if(ArrayUtils.contains(userIds, 1L)){
			return R.error("系统管理员不能删除");
		}
		
		if(ArrayUtils.contains(userIds, getUserId())){
			return R.error("当前医生不能删除");
		}
		
		sysUserService.deleteBatch(userIds);
		
		return R.ok();
	}
}
