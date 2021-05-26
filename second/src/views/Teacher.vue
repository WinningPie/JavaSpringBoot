<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="teacherName" placeholder="请输入教师姓名" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left:10px;" @click="searchTeacherByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增教师</el-button>
    </div>
    <div>
      <el-table
              @selection-change="handleSelectionChange"
              :data="teachers"
              border>
        <el-table-column
            type="selection"
            width="30">
        </el-table-column>
        <el-table-column
            prop="uid"
            label="工号"
            width="100">
        </el-table-column>
        <el-table-column
            prop="name"
            label="姓名"
            width="100">
        </el-table-column>
        <el-table-column
            prop="sex"
            label="性别"
            width="70">
        </el-table-column>
        <el-table-column
            prop="ethnic"
            label="民族"
            width="100">
        </el-table-column>
        <el-table-column
            prop="height"
            label="身高(cm)"
            width="100">
        </el-table-column>
        <el-table-column
            prop="weight"
            label="体重(kg)"
            width="100">
        </el-table-column>
        <el-table-column
            prop="salary"
            label="薪水(元)"
            width="100">
        </el-table-column>
        <el-table-column
            prop="email"
            label="邮件"
            width="100">
        </el-table-column>
        <el-table-column
            prop="record"
            label="学历"
            width="100">
        </el-table-column>
        <el-table-column
            prop="age"
            label="年龄"
            width="100">
        </el-table-column>
        <el-table-column
            prop="phone"
            label="电话"
            width="160">
        </el-table-column>
        <el-table-column
            prop="hobby"
            label="爱好"
            width="160">
        </el-table-column>
        <el-table-column
            prop="birthday"
            label="生日"
            width="100">
        </el-table-column>
        <el-table-column
            prop="school"
            label="学校"
            width="160">
        </el-table-column>
        <el-table-column
            prop="address"
            label="籍贯"
            width="160">
        </el-table-column>
        <el-table-column
            prop="qq"
            label="QQ"
            width="160">
        </el-table-column>
        <el-table-column
            prop="wechat"
            label="微信"
            width="100">
        </el-table-column>
        <el-table-column
            prop="teaching_age"
            label="执教年龄"
            width="100">
        </el-table-column>
        <el-table-column
            prop="marry_string"
            label="婚姻状况"
            width="160">
        </el-table-column>
        <el-table-column
            prop="specialty"
            label="特长"
            width="100">
        </el-table-column>
        <el-table-column
            prop="subject"
            label="学科"
            width="160">
        </el-table-column>
        <el-table-column
            prop="data"
            label="日期"
            width="160">
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteTeachers">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="teacher">
        <el-tooltip content="请输入姓名，姓名必须输入中文，而且范围是2到12个汉字之间" placement="bottom" effect="light">
        <el-form-item label="姓名" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请选择性别" placement="bottom" effect="light">
        <el-form-item label="性别" :label-width="formLabelWidth" prop="sex">
          <el-radio v-model="form.sex" label="男">男</el-radio>
          <el-radio v-model="form.sex" label="女">女</el-radio>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入民族，民族必须是汉字" placement="bottom" effect="light">
        <el-form-item label="民族" :label-width="formLabelWidth" prop="ethnic">
          <el-input v-model="form.ethnic" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入身高，单位cm" placement="bottom" effect="light">
        <el-form-item label="身高(cm)" :label-width="formLabelWidth" prop="height">
          <el-input v-model.number="form.height" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入体重，单位kg" placement="bottom" effect="light">
        <el-form-item label="体重(kg)" :label-width="formLabelWidth" prop="weight">
          <el-input v-model.number="form.weight" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入薪水，单位元" placement="bottom" effect="light">
        <el-form-item label="薪水(元)" :label-width="formLabelWidth" prop="salary">
          <el-input v-model.number="form.salary" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入邮件" placement="bottom" effect="light">
        <el-form-item label="邮件" :label-width="formLabelWidth" prop="email">
          <el-input v-model="form.email" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请拉动滑块选择年龄或在右边输入框输入，范围：20-65" placement="bottom" effect="light">
        <el-form-item label="年龄" :label-width="formLabelWidth" prop="age">
          <el-slider v-model.number="form.age" :min="20":max="65" show-input></el-slider>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入电话" placement="bottom" effect="light">
        <el-form-item label="电话" :label-width="formLabelWidth" prop="phone">
          <el-input v-model.number="form.phone" autocomplet e="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入生日，格式为年-月-日" placement="bottom" effect="light">
        <el-form-item label="生日" :label-width="formLabelWidth" prop="birthday">
          <el-input v-model="form.birthday" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入学校，输入必须是中文" placement="bottom" effect="light">
        <el-form-item label="学校" :label-width="formLabelWidth" prop="school">
          <el-input v-model="form.school" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入qq号" placement="bottom" effect="light">
        <el-form-item label="QQ" :label-width="formLabelWidth" prop="qq">
          <el-input v-model.number="form.qq" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入微信" placement="bottom" effect="light">
        <el-form-item label="微信" :label-width="formLabelWidth" prop="wechat">
          <el-input v-model="form.wechat" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入执教年龄" placement="bottom" effect="light">
        <el-form-item label="执教年龄" :label-width="formLabelWidth" prop="teaching_age">
          <el-input v-model="form.teaching_age" autocomplete="off"></el-input>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请选择爱好，可以多选" placement="bottom" effect="light">
        <el-form-item label="爱好" :label-width="formLabelWidth" prop="hobby">
          <el-form-item>{{form.hobbies}}</el-form-item>
          <el-checkbox-group v-model="form.hobbies">
            <el-checkbox label="篮球"></el-checkbox>
            <el-checkbox label="乒乓球"></el-checkbox>
            <el-checkbox label="羽毛球"></el-checkbox>
            <el-checkbox label="网球"></el-checkbox>
            <el-checkbox label="台球"></el-checkbox>
            <el-checkbox label="足球"></el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请选择籍贯" placement="bottom" effect="light">
        <el-form-item label="籍贯" :label-width="formLabelWidth" prop="address">
          <el-form-item>{{form.addresses}}</el-form-item>
          <el-cascader v-model="form.addresses":options="option"@change="handleChange"></el-cascader>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请选择学历" placement="bottom" effect="light">
        <el-form-item label="学历" :label-width="formLabelWidth" prop="record">
          <el-select v-model="form.record" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in records"
                :key="item.value"
                :value="item.records1">
            </el-option>
          </el-select>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请选择学科" placement="bottom" effect="light">
        <el-form-item label="学科" :label-width="formLabelWidth" prop="subject">
          <el-select v-model="form.subject" placeholder="请选择" style="width: 100%">
            <el-option
                v-for="item in subjects"
                :key="item.value"
                :value="item.subjects1">
            </el-option>
          </el-select>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请选择婚姻状况" placement="bottom" effect="light">
        <el-form-item label="婚姻状况" :label-width="formLabelWidth" prop="marry">
          <el-switch
              v-model="form.marry"
              active-text="已婚"
              inactive-text="未婚">
          </el-switch>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请输入特长，可以多行输入" placement="bottom" effect="light">
        <el-form-item label="特长" :label-width="formLabelWidth" prop="specialty">
          <textarea v-model="form.specialty"></textarea>
        </el-form-item>
        </el-tooltip>
        <el-tooltip content="请选择日期" placement="bottom" effect="light">
        <el-form-item label="日期" :label-width="formLabelWidth" prop="data">
          <el-date-picker v-model="form.data" placeholder="选择日期"></el-date-picker>
        </el-form-item>
        </el-tooltip>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitTeacher">确 定</el-button>
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
      option:[{
        value: '重庆市',
        label: '重庆市',
        children: [{
          value: '重庆',
          label: '重庆',
          children: [{
            value: '沙坪坝区',
            label: '沙坪坝区'
            }, {
            value: '渝北区',
            label: '渝北区'
            }, {
            value: '渝中区',
            label: '渝中区'
            }, {
            value: '江北区',
            label: '江北区'
            }, {
            value: '九龙坡区',
            label: '九龙坡区'
          }, {
            value: '长寿区',
            label: '长寿区'
          }, {
            value: '北碚区',
            label: '北碚区'
          }, {
            value: '合川区',
            label: '合川区'
          }, {
            value: '黔江区',
            label: '黔江区'
          }, {
            value: '巴南区',
            label: '巴南区'
          }]
    }]
  }, {
        value: '上海市',
        label: '上海市',
        children: [{
          value: '上海',
          label: '上海',
          children: [{
            value: '静安区',
            label: '静安区'
          }, {
            value: '黄浦区',
            label: '黄浦区'
          }, {
            value: '长宁区',
            label: '长宁区'
          }, {
            value: '宝山区',
            label: '宝山区'
          }, {
            value: '虹口区',
            label: '虹口区'
          }]
        }]
      },
        {
          value:'北京市',
          label:'北京市',
          children:[{
            value: '北京',
            label: '北京',
            children: [{
              value:'东城区',
              label: '东城区',
            },{
              value:'西城区',
              label: '西城区',
            },{
              value:'朝阳区',
              label: '朝阳区',
            },{
              value:'丰台区',
              label: '丰台区',
            },{
              value:'顺义区',
              label: '顺义区',
            },{
              value:'大兴区',
              label: '大兴区',
            }]
          }]
        }],
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now();
        },
      },
      fileList: [],
      teacherName: '',
      multipleSelection:[],
      dialogTitle: {
        addTeacher: "新增教师",
        editTeacher: "编辑教师"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' },
          { min:2,max:12,message: '姓名必须是2到12位的汉字',trigger:'blur'},
          { pattern: /^[\u4e00-\u9fa5_a-zA-Z0-9.·-]+$/, message: '姓名不支持特殊字符', trigger: 'blur' },
          {pattern: /^[\u4e00-\u9fa5]+$/, message: '姓名必须是2到12位的汉字', trigger: 'blur' }
          ],
        sex: [
         { required: true, message: '请选择性别', trigger: 'change' }
         ],
        value: [
          { required: true, message: '请输入民族'},
          { pattern: /^[\u4e00-\u9fa5_a-zA-Z0-9.·-]+$/, message: '民族不支持特殊字符', trigger: 'blur' },
          {pattern: /^[\u4e00-\u9fa5]+$/, message: '民族必须是汉字', trigger: 'blur' }
         ],
        height:[
          { required: true, message: '请输入身高'},
          {type:'number', message: '身高必须为数字值'},
          {pattern:/^[1-2][0-9][0-9]$/,message:'身高范围为100-299'}
        ],
        weight:[
          { required: true, message: '请输入体重'},
          {type:'number', message: '体重必须为数字值'},
          {pattern:/^\b[3-9]\d{0,2}\b$/,message:'请输入正确的体重范围（30-999）'}
        ],
        email:[
          {required:true,message:'邮箱不能为空'},
          {pattern:/^([a-zA-Z0-9]+[-_\.]?)+@[a-zA-Z0-9]+\.[a-z]+$/,message:'请输入正确的邮箱号码',trigger:'blur'}
        ],
        phone: [
          { required: true, message: '电话不能为空'},
          { pattern:/^[1][3-9][0-9]{9}$/,message: '请输入正确的电话号码',trigger:'blur'}
        ],
        age: [
          { required: true, message: '年龄不能为空'},
        ],
        birthday:[
          {required:true,message:'生日不能为空'},
          {pattern: /^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/,messsage:'请输入正确的生日'}
          ],
        qq:[
          { required: true, message: 'qq不能为空'},
          { type: 'number', message: 'qq必须为数字值'},
          { pattern:/^[1-9][0-9]{4,14}$/,message:'请输入正确的QQ号码',trigger:'blur'}
        ],
        ethnic:[
          {required:true,message:'民族不能为空'},
          {pattern:/^[\u4e00-\u9fa5]+$/,message: '民族输入必须为中文',trigger:'blur'}
        ],
        wechat:[
          {required:true,message:'微信不能为空'},
          {pattern:/^[a-zA-Z\d_]{5,}$/,message: '请输入正确的微信号',trigger:'blur'}
        ],
        salary: [
          {required:false,message:'薪水不能为空'},
          {type:'number',message:'薪水必须为数字值'},
         ],
        school:[
          { required: true, message: '请输入学校'},
          {pattern:/^[\u4e00-\u9fa5]+$/,message: '学校输入必须为中文',trigger:'blur'},
          {min:2,max:12,message: '学校必须是汉字'},
        ],
        record:[
          {required: true, message: '请选择学历'},
        ],
        subject:[
          {required: true, message: '请选择学科'},
        ],
        // specialty: [
        //   {required:false,message:'请输入特长'},
        //   {pattern: /^[\u4e00-\u9fa5]+$/, message: '特长必须是汉字', trigger: 'blur' },
        //   {min:2,message: '特长必须是汉字'},
        // ]
      },
      // options: [{
      //   value: '1',
      //   label: '未婚'
      // }, {
      //   value: '2',
      //   label: '已婚'
      // }],
      records: [{
        value: '1',
        records1: '本科'
      }, {
        value: '2',
        records1: '硕士'
      },{
        value:'3',
        records1:'博士',
      },{
        value:'4',
        records1:'专科',
      }],
      subjects:[{
        value: '1',
        subjects1: '语文'
      },{
        value:'2',
        subjects1:'数学',
      },{
        value:'3',
        subjects1:'英语',
      },{
        value:'4',
        subjects1:'物理',
      },{
        value:'5',
        subjects1:'生物',
      },{
        value:'6',
        subjects1:'化学',
      },{
        value:'7',
        subjects1:'体育',
      },{
        value:'8',
        subjects1:'其它',
      }],
      msg: '',
      teachers:[],
      search: '',
      dialogFormVisible: false,
      form: {
        name: '',
        sex: '',
        ethnic: '',
        height:'',
        weight:'',
        salary:'',
        email:'',
        record: '',
        age: '',
        phone: '',
        hobby:'',
        hobbies:[],
        birthday:'',
        school:'',
        address:'',
        addresses:[],
        qq:'',
        wechat:'',
        marry:'',
        marry_string:'',
        teaching_age:'',
        specialty:'',
        subject:'',
        data:''
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllTeachers();
  },
  watch:{
    teacherName () {
        this.findAllTeachers();
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
    searchTeacherByName () {
        if (this.teacherName !== '') {
            this.$axios.get("/teacher/findTeacherByName?name="+this.teacherName).then( (resp)=> {
                this.teachers = resp.data;
            }).catch( (error)=>{
                this.$message({
                    type: 'error',
                    message: "查询失败，原因是"+error.data.message
                });
            })
        }
    },
    deleteTeachers () {
      this.$confirm('此操作将永久删除教师, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/teacher/deleteTeachersByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllTeachers();
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
    submitTeacher () {
      if (this.dialogStatus === 'addTeacher'){
        this.addTeacher();
      } else if(this.dialogStatus === "editTeacher") {
        this.editTeacher();
      }
    },
    // findAllteachers () {
    //   this.$axios.get("/course/findAllteachers")
    //       .then((res) => {
    //         this.courses = res.data
    //       })
    //       .catch(error => {
    //         this.$message({
    //           type: 'error',
    //           message: "查询失败，原因是"+error.data.message
    //         });
    //       });
    // },
    findAllTeachers () {
      const url = "findAllTeachers";
      this.$axios.get("/teacher/" + url)
              .then((res) => {
                this.teachers = res.data
                this.teachers.forEach((teacher)=>{
                  if(teacher.marry){
                    teacher.marry_string='已婚';
                  }else{
                    teacher.marry_string='未婚';
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
    //对教师信息进行修改
    handleEdit (row) {
      this.dialogFormVisible = true;
      this.dialogStatus = "editTeacher";
      this.form.uid = row.uid;
      this.form.name = row.name;
      this.form.sex = row.sex;
      this.form.ethnic = row.ethnic;
      this.form.height=row.height;
      this.form.weight=row.weight;
      this.form.salary=row.salary;
      this.form.email=row.email;
      this.form.record = row.record;
      this.form.age = row.age;
      this.form.phone = row.phone;
      this.form.hobby=row.hobby;
      this.form.hobbies=row.hobby.split(",");
      this.form.addresses=row.address.split(",");
      this.form.birthday=row.birthday;
      this.form.school = row.school;
      this.form.address = row.address;
      this.form.qq = row.qq;
      this.form.wechat=row.wechat;
      this.form.marry=row.marry;
      this.form.marry_string=row.marry_string;
      this.form.teaching_age=row.teaching_age;
      this.form.specialty=row.specialty;
      this.form.subject=row.subject;
      this.form.data=row.data;
    },
    //删除教师
    handleDelete (row) {
      this.$confirm('此操作将永久删除该教师, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/teacher/deleteTeacher?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllTeachers();
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    //添加教师
    showDialog () {
      this.form.uid = '';
      this.form.name = '';
      this.form.sex = '';
      this.form.ethnic = '';
      this.form.height = '';
      this.form.weight = '';
      this.form.salary = '';
      this.form.email = '';
      this.form.record = '';
      this.form.age = '';
      this.form.phone = '';
      this.form.hobby = '';
      this.form.birthday='';
      this.form.school='';
      this.form.address ='';
      this.form.qq = '';
      this.form.wechat = '';
      this.form.marry = true;
      this.form.marry_string='';
      this.form.teaching_age = '';
      this.form.specialty = '';
      this.form.subject = '';
      this.form.data = '';
      this.dialogFormVisible = true;
      this.dialogStatus = "addTeacher";
    },
    // addcourse () {
    //   this.$refs.course.validate((valid) => {
    //     if (valid) {
    //       this.$axios.post("/course/addcourse",this.form).then( (resp)=>{
    //         if (resp) {
    //           this.dialogFormVisible = false;
    //           this.$message.success("添加成功！");
    //           this.findAllcourses();
    //         }
    //       }).catch((error)=>{
    //         this.$message({
    //           message: '添加数据失败，原因是'+error.data.message,
    //           type: 'error'
    //         })
    //       })
//   } else {
//     this.$message({
//       message: '请输入所有字段',
//       type: 'error'
//     })
//     return false;
//   }
// });
// },
    addTeacher () {
      this.$refs.teacher.validate((valid) => {
        if (valid) {
          this.form.address=this.form.addresses.join(",")
          this.form.hobby=this.form.hobbies.join(",")
          this.$axios.post("/teacher/addTeacher",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllTeachers();
            }
           // if (resp) {
           //    this.$message({
           //      message: resp.data.message,
           //      type: 'success'
           //    });
           //  } else {
           //    this.$message.error(resp.data.message);
           //  }
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
    editTeacher () {
      this.form.address=this.form.addresses.join(",")
      this.form.hobby=this.form.hobbies.join(",")
      this.$axios.post("/teacher/updateTeacher",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllTeachers();
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
