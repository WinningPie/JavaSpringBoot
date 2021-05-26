<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="name" placeholder="请输入教材名" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchTeachingBookByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增教材</el-button>
    </div>
    <div>
      <el-table
              @selection-change="handleSelectionChange"
              :data="teachingBooks"
              border>
        <el-table-column
                type="selection"
                width="55">
        </el-table-column>
        <el-table-column
            prop="uid"
            label="标识号"
            width="180">
        </el-table-column>
        <el-table-column
            prop="name"
            label="教材名"
            width="180">
        </el-table-column>
        <el-table-column
            prop="isbn"
            label="ISBN号"
            width="180">
        </el-table-column>
        <el-table-column
            prop="writer"
            label="作者"
            width="180">
        </el-table-column>
        <el-table-column
            prop="version"
            label="教材版本"
            width="180">
        </el-table-column>
        <el-table-column
            prop="price"
            label="价格"
            width="180">
        </el-table-column>
        <el-table-column
            prop="reason"
            label="采用这个教材的原因"
            width="180">
        </el-table-column>


<!--        <el-table-column-->
<!--            prop="whetherTextbook"-->
<!--            label="是否预定教材"-->
<!--            width="180">-->
<!--        </el-table-column>-->
<!--        <el-table-column-->
<!--            prop="textbookName"-->
<!--            label="教材名称"-->
<!--            width="180">-->
<!--        </el-table-column>-->
<!--        <el-table-column-->
<!--            prop="teachingBookDifficulty"-->
<!--            label="教材难度"-->
<!--            width="180">-->
<!--        </el-table-column>-->

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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteTeachingBooks">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="teachingBook">
        <el-form-item label="教材名" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="isbn号" :label-width="formLabelWidth" prop="isbn">
<!--          <el-select v-model="form.isbn" placeholder="请选择" style="width: 100%">-->
<!--            <el-input v-model="form.name" autocomplete="off"></el-input>-->
<!--          </el-select>-->
          <el-input v-model="form.isbn" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="教材作者" :label-width="formLabelWidth" prop="writer">
          <el-input v-model="form.writer" autocomplete="off"></el-input>
        </el-form-item>
<!--        <el-form-item label="教材描述" :label-width="formLabelWidth" prop="teachingBookDiscription">-->
<!--          <el-input v-model.number="form.teachingBookDiscription" autocomplete="off"></el-input>-->
          <el-form-item label="教材版本" :label-width="formLabelWidth" prop="version">
            <el-input v-model="form.version" type = 'textarea' autocomplete="off" placeholder="教材版本"></el-input>
          </el-form-item>
<!--        </el-form-item>-->
        <el-form-item label="价格" :label-width="formLabelWidth" prop="price">
          <el-input v-model="form.price" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="采用这本教材的原因" :label-width="formLabelWidth" prop="reason">
          <el-input v-model="form.reason" autocomplete="off"></el-input>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitTeachingBook">确 定</el-button>
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
      teachingBookName: '',
      multipleSelection:[],
      dialogTitle: {
        addTeachingBook: "新增教材",
        editTeachingBook: "编辑教材"
      },
      dialogStatus: "",
      // rules: {
      //   teachingBookName: [
      //     { required: true, message: '请输入教材名', trigger: 'blur' }
      //   ],
      //   teachingBookTeacher: [
      //     { required: true, message: '请选择任课老师', trigger: 'change' }
      //   ],
      //   teachingBookId: [
      //     { required: true, message: '教材号不能为空'},
      //     // { type: 'number', message: '年龄必须为数字值'}
      //   ]
      // },
      // options: [{
      //   value: '1',
      //   label: '老师1'
      // }, {
      //   value: '2',
      //   label: '老师2'
      // }],
      msg: '',
      teachingBooks:[],
      search: '',
      dialogFormVisible: false,
      form: {
        name:'',
        isbn:'',
        writer:'',
        version:'',
        price:'',
        reason:'',
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllTeachingBooks();
  },
  watch:{
    teachingBookName () {
        this.findAllTeachingBooks();
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
    searchTeachingBookByName () {
        if (this.teachingBookName !== '') {
            this.$axios.get("/teachingBook/findTeachingBookByName?name="+this.teachingBookName).then( (resp)=> {
                this.teachingBooks = resp.data;
            }).catch( (error)=>{
                this.$message({
                    type: 'error',
                    message: "查询失败，原因是"+error.data.message
                });
            })
        }
    },
    deleteTeachingBooks () {
      this.$confirm('此操作将永久删除教材, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/teachingBook/deleteTeachingBooksByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllTeachingBooks();
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
    submitTeachingBook () {
      if (this.dialogStatus === 'addTeachingBook'){
        this.addTeachingBook();
      } else if(this.dialogStatus === "editTeachingBook") {
        this.editTeachingBook();
      }
    },
    findAllTeachingBooks () {
      this.$axios.get("/teachingBook/findAllTeachingBooks")
              .then((res) => {
                this.teachingBooks = res.data
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
      this.dialogStatus = "editTeachingBook";
      this.form.uid = row.uid;
      // this.form.teachingBookId = row.teachingBookId;
      // this.form.teachingBookTeacher = row.teachingBookTeacher;
      // this.form.teachingBookName = row.teachingBookName;
      // this.form.teachingBookDiscription = row.teachingBookDiscription;
      // this.form.teachingBookSemester = row.teachingBookSemester;
      // this.form.teachingBookAddress = row.teachingBookAddress;
      //
      //
      // this.form.whetherTextbook = row.whetherTextbook;
      // this.form.textbookName = row.textbookName;
      // this.form.teachingBookDifficulty = row.teachingBookDifficulty;

      this.form.name = row.name;
      this.form.isbn = row.isbn;
      this.form.writer = row.writer;
      this.form.version = row.version;
      this.form.price = row.price;
      this.form.reason = row.reason;
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除该教材, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/teachingBook/deleteTeachingBook?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllTeachingBooks();
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
      // this.form.teachingBookId = '';
      // this.form.teachingBookTeacher = '';
      // this.form.teachingBookName = '';
      // this.form.teachingBookDiscription = '';
      // this.form.teachingBookSemester = '';
      // this.form.teachingBookAddress = '';
      //
      // this.form.whetherTextbook = '';
      // this.form.textbookName = '';
      // this.form.teachingBookDifficulty = '';
      this.form.name = '';
      this.form.isbn = '';
      this.form.writer = '';
      this.form.version = '';
      this.form.price = '';
      this.form.reason = '';


      this.dialogFormVisible = true;
      this.dialogStatus = "addTeachingBook";
    },
    addTeachingBook () {
      this.$refs.teachingBook.validate((valid) => {
        if (valid) {
          this.$axios.post("/teachingBook/addTeachingBook",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllTeachingBooks();
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
    editTeachingBook () {
      this.$axios.post("/teachingBook/updateTeachingBook",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllTeachingBooks();
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
