// pages/demos/demos.js
let datas = require('../../datas.js')
Page({

  /**
   * 页面的初始数据
   */
  data: {
      data:null,
      show:false,
      scrollTop:null,
      isTop:false,
    touchS: [0, 0],
    touchE: [0, 0]
  },

  /**
   * 生命周期函数--监听页面加载
   */
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
    if (start[0] < end[0] - 50 && Math.abs(start[1] - end[1]) < 30) {
      wx.switchTab({
        url: '/pages/index/index',
      })
    } else if (start[0] > end[0] + 50 && Math.abs(start[1] - end[1]) < 30) {
      wx.switchTab({
        url: '/pages/self/self',
      })
    } else {
      console.log('静止')
    }
  },
  returnTop: function () {
    if (this.data.isTop == true) {
      wx.showToast({
        title: '已经是最顶部啦！',

        duration: 1000
      })

    }
    else {
      this.setData({
        scrollTop: 0,
      })
    }

  },
  scroll: function (even) {
    // console.log(even.detail.scrollTop)
    if (even.detail.scrollTop == 0) {
      this.setData({
        isTop: true
      })
    }
    else {
      this.setData({
        isTop: false
      })
    }
  },

  onLoad: function (options) {
    var windowWidth = wx.getSystemInfoSync().windowWidth;
    var windowHeight = wx.getSystemInfoSync().windowHeight;
    //rpx与px单位之间的换算 : 750/windowWidth = 屏幕的高度（rpx）/windowHeight
    var scroll_height = 750 * windowHeight / windowWidth-96 ;
    var data = datas.data_info[1]
    this.setData({
      data,
      scroll_height: scroll_height
    })
  },
  
  

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
    // this.setData({
    //   show:true,
    // })
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
     show:false,
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

  }
})