
/**
 * 获取微信唯一id   openid
 * @param {*} code  wxlogin之后返回的red.code
 */
export function wxOpenIdRequest(code) {   
  // console.group('==============>WXOpenId请求<==============');
  if (code == null || code == "") {
      return false
  }
  return new Promise((resolve, reject) => {
      const response = {};
      wx.request({
          url: 'https://api.weixin.qq.com/sns/jscode2session',//微信服务器获取appid的网址 不用变
          method:'POST',//必须是post方法
          data:{
            js_code:code,
            appid:'wx71cf08cf3f4217e8',//仅为实例appid
            secret:'53b8694ebc5051f5a1287379daed9076',//仅为实例secret  liu:  677c59e4bcfd1265a6f5d6eab6d0ca9a   mi: 53b8694ebc5051f5a1287379daed9076
            grant_type:'authorization_code'
          },
          header: {
            'content-type': 'application/x-www-form-urlencoded',
          },
          success: (res) => response.success = res.data,
          fail: (error) => response.fail = error,
          complete() {
              if (response.success) {
                  // console.info('微信id请求成功：', response.success,"code",response.success.code);
                  resolve(response.success);
              } else {
                  console.info('请求失败：', response.fail);
                  reject(response.fail)
              }
              console.groupEnd();
          },
      });
  });
}
