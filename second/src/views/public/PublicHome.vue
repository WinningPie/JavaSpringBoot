<template xmlns="http://www.w3.org/1999/html">
    <el-container>
      <el-header>
        <el-row>
          <el-col :span="2"><div class="grid-content bg-purple-light"></div></el-col>

          <el-col :span="4">
            <a href="//www.icourse163.org" target="_top">
            <img width="217" height="32" src="//edu-image.nosdn.127.net/3310f128e53b406f94400f7ae6046db2.png?imageView&quality=100"></a>
          </el-col>
          <el-col :span="2">
            <a href="/#/public/" target="_top">
            <span class="nav">课程</span></a></el-col>
          <el-col :span="2">
            <a href="//www.icourse163.org/university/view/all.htm" target="_top">
            <span class="nav">学校</span></a></el-col>
          <el-col :span="2">
            <a href="//www.icourse163.org/spoc/schoolcloud/index.htm" target="_blank">
            <span class="nav">学校云</span></a></el-col>
          <el-col :span="2">
            <a  href="//www.icourse163.org/mooc/main/classroom" target="_blank">
            <span class="nav">慕课堂</span></a></el-col>
          <el-col :span="2">
            <a href="//www.icourse163.org/mobile.htm?from=navibar&mobiletopbar=hidden" target="_blank">
            <span class="nav">下载APP</span></a></el-col>
          <el-col :span="4"><div class="grid-content bg-purple-light"></div></el-col>
          <el-col :span="2">
            <a href="/#/login">登录</a></el-col>
        </el-row>

      </el-header>
      <el-container>
        <el-aside width="200px" >
          <h3>国家精品</h3>
          <h3>计算机</h3>
          <h3>外语</h3>
          <h3>理学</h3>
          <h3>工学</h3>
          <h3>22/23考研</h3>
          <h3>期末不挂科</h3>
          <h3>应试英语</h3>
          <h3>实用英语</h3>
        </el-aside>
        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
      <el-main>
        <el-row>
          <el-col :span="2"><div class="grid-content bg-purple-light"></div></el-col>
          <el-col :span="3" >
            <a href="/#/public/" target="_top" >
              <span class="nav">全部762所高校</span></a></el-col>
          <el-col :span="2">
            <img width="130px" height="41px" class="_2zu89" src="//edu-image.nosdn.127.net/0E1CA0462AD847E2F1ECE099FB9F658D.png?imageView&amp;thumbnail=220y62&amp;quality=100" alt="北京大学"></el-col>
          <el-col :span="2">
            <img width="130px" height="41px" class="_2zu89" src="//edu-image.nosdn.127.net/AEE98EB739A46AB06C02307E236069C7.png?imageView&amp;thumbnail=220y62&amp;quality=100" alt="浙江大学"></el-col>
          <el-col :span="2">
            <img width="130px" height="41px" class="_2zu89" src="//edu-image.nosdn.127.net/E0B01352DE274FFEB5D1D8AC87865E8D.png?imageView&amp;thumbnail=220y62&amp;quality=100" alt="南京大学"></el-col>
          <el-col :span="2">
            <img width="130px" height="41px" class="_2zu89" src="//edu-image.nosdn.127.net/5CC1B174CC3720F04AD96049ABCAC33D.png?imageView&amp;thumbnail=220y62&amp;quality=100" alt="武汉大学"></el-col>
          <el-col :span="2">
            <img width="130px" height="41px" class="_2zu89" src="//edu-image.nosdn.127.net/4660A53B645D7E5D09860BE200E2BC02.png?imageView&amp;thumbnail=220y62&amp;quality=100" alt="哈尔滨工业大学"></el-col>
        </el-row>
      </el-main>
      <!-- 直播  -->
      <el-container>
        <el-main>
        <el-row class="zhibo">
            <el-col :span="2"><div class="grid-content bg-purple-light"></div></el-col>
            <el-col :span="2" ><el-link :underline="false"style="font-size: x-large;height: auto;width:auto"
                                        href="http://localhost:8080/#/mainSecond">
              直播</el-link>
            </el-col>
          </el-row>
        </el-main>
      </el-container>
      <!-- 编辑推荐模块 -->
      <el-container>
        <el-main>
          <el-row>
            <el-col :span="2"><div class="grid-content bg-purple-light"></div></el-col>
            <el-col :span="2">编辑推荐</el-col>
          </el-row>
          <el-row>
            <el-col :span="2"><div class="grid-content bg-purple-light"></div></el-col>

            <el-col :span="3.2" >
              <el-card :body-style="{ padding: '0px' }">
                <img src="../../assets/编辑推荐/有机化学.webp" class="image">
                <div style="padding: 14px;" >
                  <span>有机化学</span>
                  <div class="bottom clearfix">
                    中国科学技术大学<br/>
                    <br/><br/><br/>
                    2150人参加<br/>
                    --------------------------------<br/>
                    萤火虫为什么会发光？<br/>
                  </div>
                </div>
              </el-card>
            </el-col>

            <el-col :span="3.2">
              <el-card :body-style="{ padding: '0px' }">
                <img src="../../assets/编辑推荐/救护与救援.webp" class="image">
                <div style="padding: 14px;">
                  <span>救护与救援</span>
                  <div class="bottom clearfix">
                    福建农林大学<br/>
                    <br/><br/><br/>
                    921人参加<br/>
                    --------------------------------<br/>
                    关键时刻能救命！<br/>
                  </div>
                </div>
              </el-card>
            </el-col>

            <el-col :span="3.2">
              <el-card :body-style="{ padding: '0px' }">
                <img src="../../assets/编辑推荐/固体废物处理与污染控制.webp" class="image">
                <div style="padding: 14px;">
                  <span>固体废物处理与污染控制</span>
                  <div class="bottom clearfix">
                    天津大学<br/>
                    <br/><br/><br/>
                    97人参加<br/>
                    --------------------------------<br/>
                    废弃物这样处理还能用！<br/>
                  </div>
                </div>
              </el-card>
            </el-col>

            <el-col :span="3.2">
              <el-card :body-style="{ padding: '0px' }">
                <img src="../../assets/编辑推荐/临床神经病学.webp" class="image">
                <div style="padding: 14px;">
                  <span>临床神经病学</span>
                  <div class="bottom clearfix">
                    武汉大学<br/>
                    <br/><br/><br/>
                    222人参加<br/>
                    --------------------------------<br/>
                    再也不怕头疼了<br/>
                  </div>
                </div>
              </el-card>
            </el-col>

            <el-col :span="3.2">
              <el-card :body-style="{ padding: '0px' }">
                <img src="../../assets/编辑推荐/自动控制原理.webp" class="image">
                <div style="padding: 14px;">
                  <span>自动控制原理</span>
                  <div class="bottom clearfix">
                    湖南工业大学<br/>
                    <br/><br/><br/>
                    112人参加<br/>
                    --------------------------------<br/>
                    磁悬浮原来是这样浮起来的<br/>
                  </div>
                </div>
              </el-card>
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="2"><div class="grid-content bg-purple-light"></div></el-col>
            <el-col :span="6">
              <el-card :body-style="{ padding: '0px' }">
                <img src="../../assets/编辑推荐/MOOC推荐1.png" class="image">
              </el-card>
            </el-col>
            <el-col :span="6">
              <el-card :body-style="{ padding: '0px' }">
                <img src="../../assets/编辑推荐/MOOC推荐2.png" class="image">
              </el-card>
            </el-col>
            <el-col :span="6">
              <el-card :body-style="{ padding: '0px' }">
                <img src="../../assets/编辑推荐/MOOC推荐3.png" class="image">
              </el-card>
            </el-col>
          </el-row>
        </el-main>
      </el-container>
      <!-- 排行模块 -->
      <el-row>
        <el-col :span="2"><div class="grid-content bg-purple-light"></div></el-col>

        <el-col :span="3.2">
        <el-card :body-style="{ padding: '0px' }">
          <div style="padding: 14px;">
            <span>热门排行TOP5</span>
            <div class="art-word" style="float: right"><i>HOT</i></div>
            <br/><br/>
            <div class="text item">

            </div>

          </div>
        </el-card>
      </el-col>
      </el-row>

      <div id="div-footer">
        <img width="460px" height="83px" src="../../assets/MOOC.png">
        <div style="width: 800px">由高教社联手网易推出，让每一个有提升愿望的用户能够学到中国知名高校的课程，并获得认证。</div>
        <div style="float: right">关于我们
          关于我们 学校云 联系我们 常见问题 意见反馈 法律条款</div>
      </div>
      <el-footer>
        <div style="position: center ;margin-left: 400px">
          粤B2-20090191-26 | 京ICP备12020869号-2 | 京公网安备44010602000207<br/>
          <a style="margin-left: 190px"></a>©2014-2021 icourse163.org<br/>
        </div>
      </el-footer>
    </el-container>

</template>

<script>
    export default {
      name: "Home",
      data() {
        return {
          currentDate: new Date(),

        };
      }
    }

</script>

<style scoped>
  .el-row {
    background-color: white;
    margin-top: 25px;
    margin-bottom: 20px;
   /* &:last-child {*/
   /*   margin-bottom: 0;*/
   /*}*/
  }
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-dark {
    background: #99a9bf;
  }
  .bg-purple {
    background: #d3dce6;
  }
  .grid-content {
    border-radius: 4px;
    min-height: 36px;
  }
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }
  a{
    text-decoration:none;
    color: #000;
  }
  .el-aside{
    text-align: center;
    margin-top: 30px;
    margin-left: 200px;
    margin-right: 10px;
    margin-bottom: 30px;
    height: 450px;
  }
  .el-main{
    font-size: x-large;
  }

  .bottom {
    margin-top: 13px;
    line-height: 12px;
    font-size: 13px;
    color: #999;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width:100%;
    height:130px;
    display: block;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }

  .clearfix:after {
    clear: both
  }

  span{
    font-size:18px;
  }

  .zhibo{
    font-size: x-large;
  }
  .art-word{
    opacity:0.5;
  }

  #div-footer{
    width:100%;
    background: #272727;
    color : #f9fafc;

  }
  .el-footer{
    width:100%;
    background: #272727;
    color: #666;
  }

</style>
