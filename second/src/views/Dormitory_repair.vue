<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="dormitory_repairName" placeholder="请输入查找的名字" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchDormitory_repairByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增报修</el-button>
    </div>
    <div>
      <el-table
              @selection-change="handleSelectionChange"
              :data="dormitory_repairs"
              border>
        <el-table-column
                type="selection"
                width="55">
        </el-table-column>
        <el-table-column
                prop="uid"
                label="编号"
                width="100">
        </el-table-column>
        <el-table-column
                prop="campus"
                label="校区"
                width="180">
        </el-table-column>
        <el-table-column
                prop="building"
                label="楼栋"
                width="180">
        </el-table-column>
        <el-table-column
                prop="level"
                label="楼层"
                width="180">
        </el-table-column>
        <el-table-column
            prop="room"
            label="房间"
            width="180">
        </el-table-column>
        <el-table-column
            prop="name"
            label="联系人"
            width="180">
        </el-table-column>
        <el-table-column
            prop="number"
            label="联系电话"
            width="180">
        </el-table-column>
        <el-table-column
            prop="type"
            label="报修类型"
            width="180">
        </el-table-column>
        <el-table-column
                label="操作">
                align="left">
          <template slot-scope="scope">
            <el-button
                    size="mini"
                    @click="handleEdit(scope.row)">编辑</el-button>
            <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteDormitory_repairs">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="dormitory_repair">
        <el-form-item label="校区" :label-width="formLabelWidth" prop="campus">
          <el-select v-model="form.campus" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in campus"
                :key="item.value"
                :value="item.campus1">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="楼栋" :label-width="formLabelWidth" prop="building">
          <el-input v-model="form.building"  placeholder="请输入报修楼栋" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="楼层" :label-width="formLabelWidth" prop="level">
          <el-select v-model="form.level" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in level"
                :key="item.value"
                :value="item.level1">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="房间" :label-width="formLabelWidth" prop="room">
          <el-input v-model.number="form.room"  placeholder="请输入报修房间号" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="联系人" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name"  placeholder="请输入报修联系人" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="联系电话" :label-width="formLabelWidth" prop="number">
          <el-input v-model.number="form.number"  placeholder="请输入报修电话" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="报修类型" :label-width="formLabelWidth" prop="type">
          <el-select v-model="form.type" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in type"
                :key="item.value"
                :value="item.type1">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitDormitory_repair">确 定</el-button>
      </div>
    </el-dialog>
    <el-upload
            style="margin-top:20px;"
            action="/upload"
            multiple
            :on-success="handleSuccess"
            :limit="3"
            :file-list="fileList">
      <el-button size="small" type="primary">点击上传</el-button>
    </el-upload>
  </div>
</template>

<script>
// @ is an alias to /src


export default {
  name: 'Home',
  components: {
  },
  data () {
    return {
      fileList: [],
      dormitory_repairName: '',
      multipleSelection:[],
      dialogTitle: {
        addDormitory_repair: "新增报修",
        editDormitory_repair: "编辑报修"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入报修名', trigger: 'blur' },
          { min:2,max:12,message: '报修名必须是2到12位的汉字',trigger:'blur'},
          { pattern: /^[\u4e00-\u9fa5_a-zA-Z0-9.·-]+$/, message: '报修名不支持特殊字符', trigger: 'blur' },
          {pattern: /^[\u4e00-\u9fa5]+$/, message: '报修名必须是2到12位的汉字', trigger: 'blur' }
        ],
        dormitory_repair_teacher: [
          { required: true, message: '请输入任课教师', trigger: 'blur' },
          { min:2,max:12,message: '任课教师必须是2到12位的汉字',trigger:'blur'},
          { pattern: /^[\u4e00-\u9fa5_a-zA-Z0-9.·-]+$/, message: '任课教师不支持特殊字符', trigger: 'blur' },
          {pattern: /^[\u4e00-\u9fa5]+$/, message: '任课教师必须是2到12位的汉字', trigger: 'blur' }
        ],
        dormitory_repair_introduction: [
          { required: true, message: '请输入报修简介'},
        ],
        dormitory_repair_credits: [
          {required:true,message:'学分不能为空'},
          {type:'number',message:'学分必须为数字值'},
        ]
      },

      campus: [{
        value: '1',
        campus1: '大学城校区'
      }, {
        value: '2',
        campus1: '北碚校区'
      },{
        value:'3',
        campus1:'沙坪坝校区',
      }],
      level: [{
        value: '1',
        level1: '1楼'
      }, {
        value: '2',
        level1: '2楼'
      },{
        value:'3',
        level1:'3楼',
      },{
        value:'4',
        level1:'4楼',
      },{
        value:'5',
        level1:'5楼',
      },{
        value:'6',
        level1:'6楼',
      }],
      type: [{
        value: '1',
        type1: '电灯'
      }, {
        value: '2',
        type1: '空调'
      },{
        value:'3',
        type1:'厕所',
      },{
        value:'4',
        type1:'下水道',
      }],
      msg: '',
      dormitory_repairs:[],
      search: '',
      dialogFormVisible: false,
      form: {
        name: '',
        campus:'',
        building:'',
        level:'',
        room:'',
        number:'',
        type:'',
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllDormitory_repairs();
  },
  watch:{
    dormitory_repairName () {
        this.findAllDormitory_repairs();
    }
  },
  methods: {
    // deleteFile (file) {
    //   console.log(file)
    // },
    handleSuccess (file) {
      const filename = file.name;
      this.$message({
        message: '文件上传成功！',
        type: 'success'
      });
    },
    searchDormitory_repairByName () {
        if (this.dormitory_repairName !== '') {
            this.$axios.get("/dormitory_repair/findDormitory_repairByName?name="+this.dormitory_repairName).then( (resp)=> {
                this.dormitory_repairs = resp.data;
            }).catch( (error)=>{
                this.$message({
                    type: 'error',
                    message: "查询失败，原因是"+error.data.message
                });
            })
        }
    },
    deleteDormitory_repairs () {
      this.$confirm('此操作将永久删除报修, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/dormitory_repair/deleteDormitory_repairsByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllDormitory_repairs();
            this.$message.success("删除成功！");
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
      console.log(val)
    },
    submitDormitory_repair () {
      if (this.dialogStatus === 'addDormitory_repair'){
        this.addDormitory_repair();
      } else if(this.dialogStatus === "editDormitory_repair") {
        this.editDormitory_repair();
      }
    },
    findAllDormitory_repairs () {
      this.$axios.get("/dormitory_repair/findAllDormitory_repairs")
              .then((res) => {
                this.dormitory_repairs = res.data
                this.dormitory_repairs.forEach((dormitory_repair)=>{
                  if(dormitory_repair.dormitory_repair_choose){
                    dormitory_repair.dormitory_repair_choose_string='是';
                  }else{
                    dormitory_repair.dormitory_repair_choose_string='否';
                  }
                })
              })
              .catch(error => {
                this.$message({
                  type: 'error',
                  message: "查询失败，原因是"+error.data.message
                });
              });
    },
    handleEdit (row) {
      this.dialogFormVisible = true;
      this.dialogStatus = "editDormitory_repair";
      this.form.uid = row.uid;
      this.form.name = row.name;
      this.form.campus = row.campus;
      this.form.building = row.building;
      this.form.level = row.level;
      this.form.room = row.room;
      this.form.number = row.number;
      this.form.type = row.type;
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除该报修, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/dormitory_repair/deleteDormitory_repair?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllDormitory_repairs();
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    showDialog () {
      this.form.uid = '';
      this.form.name = '';
      this.form.campus = '';
      this.form.building = '';
      this.form.level = '';
      this.form.room = '';
      this.form.number = '';
      this.form.type = '';
      this.dialogFormVisible = true;
      this.dialogStatus = "addDormitory_repair";
    },
    addDormitory_repair () {
      this.$refs.dormitory_repair.validate((valid) => {
        if (valid) {
          this.$axios.post("/dormitory_repair/addDormitory_repair",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllDormitory_repairs();
            }
          }).catch((error)=>{
            this.$message({
              message: '添加数据失败，原因是'+error.data.message,
              type: 'error'
            })
          })
        } else {
          this.$message({
            message: '请输入所有字段',
            type: 'error'
          })
          return false;
        }
      });
    },
    editDormitory_repair () {
      this.$axios.post("/dormitory_repair/updateDormitory_repair",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllDormitory_repairs();
      }).catch( (error)=> {
        this.$message({
          message: '数据更新失败，原因是'+error.data.message,
          type: 'error'
        })
      })
    }
  }
}
</script>
<style scoped>
  .table {
    margin: 0 auto;
    clear: both;
  }
</style>
