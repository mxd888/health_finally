

package com.health.modules.sys.form;

import lombok.Data;

/**
 * 密码表单
 *
 * @author 大米
 */
@Data
public class PasswordForm {
    /**
     * 原密码
     */
    private String password;
    /**
     * 新密码
     */
    private String newPassword;

}
