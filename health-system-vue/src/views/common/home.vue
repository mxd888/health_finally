<template>
  <div class="about">
    <el-carousel :interval="4000" type="card" height="300px">
      <el-carousel-item v-for="item in items" :key="item">
        <img :src="item" />
      </el-carousel-item>
    </el-carousel>

<hr />
    <el-button
    plain
    @click="open1">
    成功
  </el-button>
  <el-button
    plain
    @click="open2">
    警告
  </el-button>
  <el-button
    plain
    @click="open3">
    消息
  </el-button>
  <el-button
    plain
    @click="open4">
    错误
  </el-button>


<br /><br /><br />

  <el-steps :active="2" align-center>
  <el-step title="步骤1" description="刘广辉需要学会Vue"></el-step>
  <el-step title="步骤2" description="广辉需要会使用Vue-cli构建工程"></el-step>
  <el-step title="步骤3" description="这个阶段需要学会Vue和其他第三方进行整合"></el-step>
  <el-step title="步骤4" description="综合开发Vue项目，运用任意第三方熟练自如"></el-step>
</el-steps>

  </div>
</template>

<script>
export default {
  // eslint-disable-next-line
  data(){
    return {
      items: [
        require('@/assets/img/1.png'),
        require('@/assets/img/2.png'),
        require('@/assets/img/3.png'),
        require('@/assets/img/4.png'),
        require('@/assets/img/5.png')
      ]
    }
  },
  methods: {
     /* eslint-disable */
      open1() {
        this.$notify({
          title: '成功',
          message: '这是一条成功的提示消息',
          type: 'success'
        });
      },
 /* eslint-disable */
      open2() {
        this.$notify({
          title: '警告',
          message: '这是一条警告的提示消息',
          type: 'warning'
        });
      },
 /* eslint-disable */
      open3() {
        this.$notify.info({
          title: '消息',
          message: '这是一条消息的提示消息'
        });
      },
 /* eslint-disable */
      open4() {
        this.$notify.error({
          title: '错误',
          message: '这是一条错误的提示消息'
        })
      }
    }
}
</script>