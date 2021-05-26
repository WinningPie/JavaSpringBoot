<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="courseName" placeholder="请输入查找的课程名" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchCourseByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增课程</el-button>
    </div>
    <div>
      <el-table
              @selection-change="handleSelectionChange"
              :data="courses"
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
                prop="name"
                label="课程名"
                width="180">
        </el-table-column>
        <el-table-column
                prop="course_teacher"
                label="任课教师"
                width="180">
        </el-table-column>
        <el-table-column
                prop="course_introduction"
                label="课程简介"
                width="180">
        </el-table-column>
        <el-table-column
            prop="course_credits"
            label="学分"
            width="180">
        </el-table-column>
        <el-table-column
            prop="course_nature"
            label="课程性质"
            width="180">
        </el-table-column>
        <el-table-column
            prop="course_choose_string"
            label="课程是否选择"
            width="180">
        </el-table-column>
        <el-table-column
            prop="course_test_time"
            label="考试时间"
            width="180">
        </el-table-column>
        <el-table-column
            prop="academy"
            label="开设学院"
            width="180">
        </el-table-column>
        <el-table-column
            prop="place"
            label="上课地点"
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteCourses">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="course">
        <el-form-item label="课程名" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name"  placeholder="请输入课程名" autocomplete="off" ></el-input>
<!--          <el-input v-model="courseName" placeholder="请输入查找的课程名" style="width:80%" clearable></el-input>-->
        </el-form-item>
        <el-form-item label="任课教师" :label-width="formLabelWidth" prop="course_teacher">
          <el-input v-model="form.course_teacher" placeholder="请输入任课教师"autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="课程简介" :label-width="formLabelWidth" prop="course_introduction">
          <el-input v-model="form.course_introduction"placeholder="请输入课程简介" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="学分" :label-width="formLabelWidth" prop="course_credits">
          <el-input v-model.number="form.course_credits"placeholder="请输入学分" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="课程性质" :label-width="formLabelWidth" prop="course_nature">
          <el-radio v-model="form.course_nature" label="必修">必修</el-radio>
          <el-radio v-model="form.course_nature" label="选修">选修</el-radio>
        </el-form-item>
        <el-form-item label="课程是否选择" :label-width="formLabelWidth" prop="course_choose">
          <el-switch
              v-model="form.course_choose"
              active-text="是"
              inactive-text="否">
          </el-switch>
        </el-form-item>
        <el-form-item label="考试时间" :label-width="formLabelWidth" prop="course_tese_time">
          <el-date-picker v-model="form.course_test_time" placeholder="选择日期"></el-date-picker>
        </el-form-item>
        <el-form-item label="开设学院" :label-width="formLabelWidth" prop="academy">
          <el-select v-model="form.academy" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in academys"
                :key="item.value"
                :value="item.academy1">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="上课地点" :label-width="formLabelWidth" prop="place">
          <el-select v-model="form.place" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in places"
                :key="item.value"
                :value="item.place1">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitCourse">确 定</el-button>
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
      // option:[{
      //   value: '特教楼',
      //   label: '特教楼',
      //   children: [{
      //     value: 'T2011',
      //     label: 'T2011',
      //     }, {
      //       value: 'T2012',
      //       label: 'T2012'
      //     }, {
      //       value: 'T2013',
      //       label: 'T2013'
      //     }, {
      //       value: 'T3011',
      //       label: 'T3011'
      //     }, {
      //       value: 'T3012',
      //       label: 'T3012'
      //     }, {
      //       value: 'T3013',
      //       label: 'T3013'
      //     }]
      // }, {
      //   value: '弘德楼',
      //   label: '弘德楼',
      //   children: [{
      //     value: '15101',
      //     label: '15101',
      //     }, {
      //       value: '15102',
      //       label: '15102'
      //     }, {
      //       value: '13404',
      //       label: '13404'
      //     }, {
      //       value: '12205',
      //       label: '12205'
      //     }, {
      //       value: '13305',
      //       label: '13305'
      //     }]
      // }],
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now();
        },
      },
      fileList: [],
      courseName: '',
      multipleSelection:[],
      dialogTitle: {
        addCourse: "新增课程",
        editCourse: "编辑课程"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入课程名', trigger: 'blur' },
          { min:2,max:12,message: '课程名必须是2到12位的汉字',trigger:'blur'},
          { pattern: /^[\u4e00-\u9fa5_a-zA-Z0-9.·-]+$/, message: '课程名不支持特殊字符', trigger: 'blur' },
          {pattern: /^[\u4e00-\u9fa5]+$/, message: '课程名必须是2到12位的汉字', trigger: 'blur' }
        ],
        course_teacher: [
          { required: true, message: '请输入任课教师', trigger: 'blur' },
          { min:2,max:12,message: '任课教师必须是2到12位的汉字',trigger:'blur'},
          { pattern: /^[\u4e00-\u9fa5_a-zA-Z0-9.·-]+$/, message: '任课教师不支持特殊字符', trigger: 'blur' },
          {pattern: /^[\u4e00-\u9fa5]+$/, message: '任课教师必须是2到12位的汉字', trigger: 'blur' }
        ],
        course_introduction: [
          { required: true, message: '请输入课程简介'},
        ],
        course_credits: [
          {required:true,message:'学分不能为空'},
          {type:'number',message:'学分必须为数字值'},
        ]
      },

      academys: [{
        value: '1',
        academy1: '教务处'
      }, {
        value: '2',
        academy1: '计算机与信息科学学院'
      },{
        value:'3',
        academy1:'数学科学学院',
      },{
        value:'4',
        academy1:'生命科学学院',
      }],
      places: [{
        value: '1',
        place1: '特教楼'
      }, {
        value: '2',
        place1: '弘德楼'
      },{
        value:'3',
        place1:'知行楼',
      },{
        value:'4',
        place1:'学院楼',
      }],
      msg: '',
      courses:[],
      search: '',
      dialogFormVisible: false,
      form: {
        name: '',
        course_teacher: '',
        course_introduction: '',
        course_credits:'',
        course_nature:'',
        course_choose:'',
        course_choose_string:'',
        course_test_time:'',
        academy:'',
        place:'',
        //places:[],
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllCourses();
  },
  watch:{
    courseName () {
        this.findAllCourses();
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
    searchCourseByName () {
        if (this.courseName !== '') {
            this.$axios.get("/course/findCourseByName?name="+this.courseName).then( (resp)=> {
                this.courses = resp.data;
            }).catch( (error)=>{
                this.$message({
                    type: 'error',
                    message: "查询失败，原因是"+error.data.message
                });
            })
        }
    },
    deleteCourses () {
      this.$confirm('此操作将永久删除课程, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/course/deleteCoursesByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllCourses();
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
    submitCourse () {
      if (this.dialogStatus === 'addCourse'){
        this.addCourse();
      } else if(this.dialogStatus === "editCourse") {
        this.editCourse();
      }
    },
    findAllCourses () {
      this.$axios.get("/course/findAllCourses")
              .then((res) => {
                this.courses = res.data
                this.courses.forEach((course)=>{
                  if(course.course_choose){
                    course.course_choose_string='是';
                  }else{
                    course.course_choose_string='否';
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
      this.dialogStatus = "editCourse";
      this.form.uid = row.uid;
      this.form.name = row.name;
      this.form.course_teacher = row.course_teacher;
      this.form.course_introduction = row.course_introduction;
      this.form.course_credits = row.course_credits;
      this.form.course_nature = row.course_nature;
      this.form.course_choose = row.course_choose;
      this.form.course_choose_string = row.course_choose_string;
      this.form.course_test_time = row.course_test_time;
      this.form.academy=row.academy;
      this.form.place=row.place;
      this.form.places=row.places.split(",");
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除该课程, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/course/deleteCourse?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllCourses();
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
      this.form.course_teacher = '';
      this.form.course_introduction = '';
      this.form.course_credits='';
      this.form.course_nature='';
      this.form.course_choose=true;
      this.form.course_choose_string='';
      this.form.course_test_time='';
      this.form.academy='';
      this.form.place='';
      this.dialogFormVisible = true;
      this.dialogStatus = "addCourse";
    },
    addCourse () {
      this.$refs.course.validate((valid) => {
        if (valid) {
          this.$axios.post("/course/addCourse",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllCourses();
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
    editCourse () {
      this.$axios.post("/course/updateCourse",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllCourses();
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
