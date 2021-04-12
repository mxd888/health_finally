// pages/self/self.js
let datas = require('../../datas.js')

import {
  wxOpenIdRequest
} from "../util/network"

Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo: {},
    hasUserInfo: false,
    canIUseGetUserProfile: false,
    data:null,
    health: '',
    erweima: ['http://112.124.96.85:10080/images/my_wx.png',
      'http://112.124.96.85:10080/images/my_qq.jpg',
    ],
    show:false,
    touchS: [0, 0],
    touchE: [0, 0]
  },

  touchStart: function (e) {
    // console.log(e.touches[0].pageX)
    let sx = e.touches[0].pageX
    let sy = e.touches[0].pageY
    this.data.touchS = [sx, sy]
  },

  touchMove: function (e) {
    let sx = e.touches[0].pageX;
    let sy = e.touches[0].pageY;
    this.data.touchE = [sx, sy]
  },

  touchEnd: function (e) {
    let start = this.data.touchS
    let end = this.data.touchE
    console.log(start)
    console.log(end)
    if (start[0] < end[0] - 50 &&Math.abs(start[1] - end[1]) < 30) {
      wx.switchTab({
        url: '/pages/demos/demos',
      })
    } else if (start[0] > end[0] + 50) {
      
    } else {
      console.log('静止')
    }
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  if (wx.getUserProfile) {
      this.setData({
        canIUseGetUserProfile: true
      })
    }
    var data = datas.data_info[3]
    this.setData({
      data
    })

  },
  wx_click:function(even){
    var index = even.target.dataset.index;
    wx.previewImage({
      current: this.data.erweima[index], // 当前显示图片的http链接
      urls: this.data.erweima // 需要预览的图片http链接列表
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  this.setData({
    show:true,
  })
  }, 

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
    this.setData({
      show: false,
    })
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  getUserProfile(e) {
    // 推荐使用wx.getUserProfile获取用户信息，开发者每次通过该接口获取用户个人信息均需用户确认
    // 开发者妥善保管用户快速填写的头像昵称，避免重复弹窗
    wx.getUserProfile({
      desc: '用于完善会员资料', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
      success: (res) => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
        // console.log(res)    
        this.loginAction(res.userInfo)
      }
    })
  },
  //登录方法
loginAction: function (params) {
  //该button的open-type为"getUserInfo" 获取访问授权的,能获取到用户信息,打开开发者模式可以测试
    if (params == null) {
      console.log("空") 
      return
    }
    
    // 微信登录
    wx.login({
      success: res => {
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
        // console.log('正在登录.....' + res.code);
        if (res.code) {
          // 获取唯一id
          wxOpenIdRequest(res.code).then(success => {
            console.info("获取微信openid成功");
            console.log("id====", success.openid);
            console.log("session_key====", success.session_key);
            /*
             * 储存方法
             * 将openid存入本地缓存
             */
            wx.setStorageSync('app_openid', success.openid); 
            //执行自己服务器的登录
            params.openId = success.openid;
            params.sessionKey = success.session_key;
            params.health = 0;
            this.getLogin(params).then(data => {
              this.setData({
                health: '健康系统评级：' + (data === '0' ? '健康' : '亚健康')
              })
            })
          })
          
        } else {
          console.log("登陆失败");
        }
      }
    })
  },
  getLogin(r) {
    console.log("具体登录操作....")
    return new Promise((resolve, reject) => {
      if(r != null){
        console.log(r);

        // 发送注册请求  1.查询有没有、  2. 进行插入
        wx.request({
          url: 'http://47.94.200.90:8080/renren-fast/user/user/wx_info/' + r.openId, 
          method: "POST",
          header: {
            'content-type': 'application/json', // 默认值
            'token': '7d0bd5f812607201722c77828014be48'
          },
          success (res) {
            console.log(res.data)
            if(res.data.user === null){
              wx.request({
                url: 'http://47.94.200.90:8080/renren-fast/user/user/save', 
                data: JSON.stringify(r),
                method: "POST",
                header: {
                  'content-type': 'application/json', // 默认值
                  'token': '7d0bd5f812607201722c77828014be48'
                },
                success (res) {
                  console.log(res.data)
                  resolve(0);
                },
                fail (res) {
                  reject(1)
                }
              })
            }else {
              resolve(res.data.user.health);
            }
          },
          fail (res) {
            reject(1)
          }
        })
        
      }else{
        reject(1)
      }
    });
  }
})