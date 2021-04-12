// pages/demos/detail/detail.js
let datas = require('../../../datas.js')
Page({

  /**
   * 页面的初始数据
   */
  data: {
    barId:0,
    number:0,
    data:[],
    barfix:false,
    show:true,
    
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
   var number=options.index
      this.setData({
        number,
         data:datas.data_info[2].info[number-1]
      })

  },
  activeClick:function(even){
    this.setData({
    show: false,
    })
    var barId = even.currentTarget.dataset.id ;
    if (!barId)
   {
      barId = this.data.barId;
   }
   else{
     this.setData({
       barId,
       show:true,
     })
   }
   
    
   
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    // this.app.sliderightshow(this, 'slide_up1', 0, 1)
   
  },
  onPageScroll: function (e) {
    console.log('距离顶部距离:'+e.scrollTop)
    if (e.scrollTop>250&&this.data.barfix==false)
    {
      this.setData({
        barfix:true
      })
      console.log('距离顶部距离:' + e.scrollTop)
    }
    if(e.scrollTop<250)
    {
      this.setData({
        barfix: false
      })
    }
   
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