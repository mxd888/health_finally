
package com.health.common.utils;

/**
 * Redis所有Keys
 *
 * @author 大米
 */
public class RedisKeys {

    public static String getSysConfigKey(String key){
        return "sys:config:" + key;
    }
}
