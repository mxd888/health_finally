<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="运动项" prop="username">
      <el-input v-model="dataForm.username" placeholder=""></el-input>
    </el-form-item>
    <el-form-item label="运动内容" prop="password">
      <el-input v-model="dataForm.password" placeholder=""></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          yundongId: 0,
          username: '',
          password: '',
          createTime: ''
        },
        dataRule: {
          username: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          createTime: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.yundongId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.yundongId) {
            this.$http({
              url: this.$http.adornUrl(`/code/yundong/info/${this.dataForm.yundongId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.username = data.yundong.username
                this.dataForm.password = data.yundong.password
                this.dataForm.createTime = data.yundong.createTime
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/code/yundong/${!this.dataForm.yundongId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'yundongId': this.dataForm.yundongId || undefined,
                'username': this.dataForm.username,
                'password': this.dataForm.password,
                'createTime': this.dataForm.createTime
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
