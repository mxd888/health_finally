package com.health.modules.user.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 用户
 * 
 * @author mxd
 * @email 1191998028@qq.com
 * @date 2021-04-10 22:10:06
 */
@Data
@TableName("tb_user")
public class UserEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long userId;
	/**
	 * 微信昵称
	 */
	private String nickName;
	/**
	 * 头像
	 */
	private String avatarUrl;
	/**
	 * 状况
	 */
	private String health;
	/**
	 * 城市
	 */
	private String city;
	/**
	 * 国家
	 */
	private String country;
	/**
	 * 性别
	 */
	private String gender;
	/**
	 * 语言
	 */
	private String language;
	/**
	 * 省会
	 */
	private String province;
	/**
	 * openId
	 */
	private String openId;
	/**
	 * key
	 */
	private String sessionKey;
	/**
	 * 创建时间
	 */
	private Date time;


	private String username = "刘广辉主管";

	@Override
	public String toString() {
		return "UserEntity{" +
				"userId=" + userId +
				", nickName='" + nickName + '\'' +
				", avatarUrl='" + avatarUrl + '\'' +
				", health='" + health + '\'' +
				", city='" + city + '\'' +
				", country='" + country + '\'' +
				", gender='" + gender + '\'' +
				", language='" + language + '\'' +
				", province='" + province + '\'' +
				", openId='" + openId + '\'' +
				", sessionKey='" + sessionKey + '\'' +
				", time=" + time +
				", username='" + username + '\'' +
				'}';
	}
}
