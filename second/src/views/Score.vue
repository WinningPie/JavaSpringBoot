<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="scoreName" placeholder="请输入学生姓名" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchScoreByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增学生</el-button>
    </div>
    <div>
      <el-table
          @selection-change="handleSelectionChange"
          :data="scores"
          border>
        <el-table-column
            type="selection"
            width="55">
        </el-table-column>
        <el-table-column
            prop="uid"
            label="学号"
            width="180">
        </el-table-column>
        <el-table-column
            prop="name"
            label="姓名"
            width="180">
        </el-table-column>
        <el-table-column
            prop="number"
            label="学号"
            width="180">
        </el-table-column>
        <el-table-column
            prop="academy"
            label="学院"
            width="180">
        </el-table-column>
        <el-table-column
            prop="major"
            label="专业"
            width="180">
        </el-table-column>
        <el-table-column
            prop="year"
            label="学年"
            width="180">
        </el-table-column>
        <el-table-column
            prop="semester"
            label="学期"
            width="180">
        </el-table-column>
        <el-table-column
            prop="course"
            label="课程"
            width="180">
        </el-table-column>
        <el-table-column
            prop="score"
            label="成绩"
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteScores">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="score">
        <el-form-item label="姓名" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name"  placeholder="请输入名字" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="学号" :label-width="formLabelWidth" prop="number">
          <el-input v-model.number="form.number"  placeholder="请输入学号" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="学院" :label-width="formLabelWidth" prop="academy">
          <el-select v-model="form.academy" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in academy"
                :key="item.value"
                :value="item.academy1">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="专业" :label-width="formLabelWidth" prop="major">
          <el-input v-model="form.major"  placeholder="请输入专业" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="学年" :label-width="formLabelWidth" prop="year">
          <el-select v-model="form.year" placeholder="请选择学年" style="width: 100%">
            <el-option
                v-for="item in year"
                :key="item.value"
                :value="item.years">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="学期" :label-width="formLabelWidth" prop="semester">
          <el-select v-model="form.semester" placeholder="请选择学期" style="width: 100%">
            <el-option
                v-for="item in semester"
                :key="item.value"
                :value="item.semesters">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="课程" :label-width="formLabelWidth" prop="course">
          <el-input v-model="form.course"  placeholder="请输入课程" autocomplete="off" ></el-input>
        </el-form-item>
        <el-form-item label="成绩" :label-width="formLabelWidth" prop="score">
          <el-input v-model.number="form.score"  placeholder="请输入成绩" autocomplete="off" ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitScore">确 定</el-button>
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
      scoreName: '',
      multipleSelection:[],
      dialogTitle: {
        addScore: "新增学生",
        editScore: "编辑学生"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' }
        ],
        sex: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        age: [
          { required: true, message: '年龄不能为空'},
          { type: 'number', message: '年龄必须为数字值'}
        ]
      },
      academy: [{
        value: '1',
        academy1: '计算机与信息科学学院'
      }, {
        value: '2',
        academy1: '数学科学学院'
      }, {
        value: '3',
        academy1: '教育科学学院'
      }, {
        value: '4',
        academy1: '马克思学院'
      }],
      year: [{
        value: '1',
        years: '2018'
      }, {
        value: '2',
        years: '2019'
      }, {
        value: '3',
        years: '2020'
      }, {
        value: '4',
        years: '2021'
      }],
      semester: [{
        value: '1',
        semesters: '第一学期'
      }, {
        value: '2',
        semesters: '第二学期'
      }],
      msg: '',
      scores:[],
      search: '',
      dialogFormVisible: false,
      form: {
        name: '',
        number: '',
        academy: '',
        major: '',
        year: '',
        semester: '',
        course: '',
        score: '',
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllScores();
  },
  watch:{
    scoreName () {
      this.findAllScores();
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
    searchScoreByName () {
      if (this.scoreName !== '') {
        this.$axios.get("/score/findScoreByName?name="+this.scoreName).then( (resp)=> {
          this.scores = resp.data;
        }).catch( (error)=>{
          this.$message({
            type: 'error',
            message: "查询失败，原因是"+error.data.message
          });
        })
      }
    },
    deleteScores () {
      this.$confirm('此操作将永久删除学生, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/score/deleteScoresByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllScores();
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
    submitScore () {
      if (this.dialogStatus === 'addScore'){
        this.addScore();
      } else if(this.dialogStatus === "editScore") {
        this.editScore();
      }
    },
    findAllScores () {
      this.$axios.get("/score/findAllScores")
          .then((res) => {
            this.scores = res.data
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
      this.dialogStatus = "editScore";
      this.form.uid = row.uid;
      this.form.name = row.name;
      this.form.number = row.number;
      this.form.academy = row.academy;
      this.form.major = row.major;
      this.form.year = row.year;
      this.form.semester = row.semester;
      this.form.course = row.course;
      this.form.score = row.score;
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除该学生, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/score/deleteScore?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllScores();
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
      this.form.number = '';
      this.form.academy = '';
      this.form.major = '';
      this.form.year = '';
      this.form.semester = '';
      this.form.course = '';
      this.form.score = '';
      this.form.subject_score = '';
      this.dialogFormVisible = true;
      this.dialogStatus = "addScore";
    },
    addScore () {
      this.$refs.score.validate((valid) => {
        if (valid) {
          this.$axios.post("/score/addScore",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllScores();
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
    editScore () {
      this.$axios.post("/score/updateScore",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllScores();
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
