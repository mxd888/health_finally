<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="昵称" prop="nickName">
      <el-input v-model="dataForm.nickName" placeholder=""></el-input>
    </el-form-item>

    <el-form-item label="状态" size="mini" prop="health">
        <el-radio-group v-model="dataForm.health">
          <el-radio :label="'0'">健康</el-radio>
          <el-radio :label="'1'">亚健康</el-radio>
        </el-radio-group>
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
          userId: 0,
          nickName: '',
          avatarUrl: '',
          health: '1',
          city: '',
          country: '',
          gender: '',
          language: '',
          province: '',
          openId: '',
          sessionKey: '',
          time: ''
        },
        dataRule: {
          nickName: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          avatarUrl: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          health: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          city: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          country: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          gender: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          language: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          province: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          openId: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          sessionKey: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ],
          time: [
            { required: true, message: '不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.userId = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.userId) {
            this.$http({
              url: this.$http.adornUrl(`/user/user/info/${this.dataForm.userId}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.nickName = data.user.nickName
                this.dataForm.avatarUrl = data.user.avatarUrl
                this.dataForm.health = data.user.health
                this.dataForm.city = data.user.city
                this.dataForm.country = data.user.country
                this.dataForm.gender = data.user.gender
                this.dataForm.language = data.user.language
                this.dataForm.province = data.user.province
                this.dataForm.openId = data.user.openId
                this.dataForm.sessionKey = data.user.sessionKey
                this.dataForm.time = data.user.time
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
              url: this.$http.adornUrl(`/user/user/${!this.dataForm.userId ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'userId': this.dataForm.userId || undefined,
                'nickName': this.dataForm.nickName,
                'avatarUrl': this.dataForm.avatarUrl,
                'health': this.dataForm.health,
                'city': this.dataForm.city,
                'country': this.dataForm.country,
                'gender': this.dataForm.gender,
                'language': this.dataForm.language,
                'province': this.dataForm.province,
                'openId': this.dataForm.openId,
                'sessionKey': this.dataForm.sessionKey,
                'time': this.dataForm.time
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
