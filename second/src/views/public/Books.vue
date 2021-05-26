<template>
  <div class="block">
    <span class="demonstration"></span>
    <el-carousel height="450px">
      <el-carousel-item v-for="item in imgbox" :key="item.id">
        <img :src="item.idView" class="image">
      </el-carousel-item>
    </el-carousel>
  </div>
</template>

<script>
    export default {
        name: "Books",
      data() {
        return {
          imgbox: [{id: 0, idView: require('../../assets/imgbox/1.png')},
            {id: 1, idView: require('../../assets/imgbox/2.png')},
            {id: 2, idView: require('../../assets/imgbox/3.png')},
            {id: 3, idView: require('../../assets/imgbox/4.png')}

            //imagebox是assets下一个放图片的文件夹
          ],
          // 浏览器宽度
          screenWidth :0
        }
      },
      methods:{
        setSize:function () {
          // 通过浏览器宽度(图片宽度)计算高度
          this.bannerHeight = 400 / 1920 * this.screenWidth;
        },
      },
      mounted() {
        // 首次加载时,需要调用一次
        this.screenWidth =  window.innerWidth;
        this.setSize();
        // 窗口大小发生改变时,调用一次
        window.onresize = () =>{
          this.screenWidth =  window.innerWidth;
          this.setSize();
        }
      }
    }
</script>

<style scoped>
  .block{
    width: 900px;
  }
  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 450px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
  img{
    /*设置图片宽度和浏览器宽度一致*/
    width:100%;
    height:inherit;
  }
</style>
