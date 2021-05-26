import Vue from 'vue'
import VueRouter from 'vue-router'
import Teacher from '../views/Teacher'
import Home from '../views/Home'
import Login from '../views/Login'
import Course from '../views/Course'
import PublicHome from '../views/public/PublicHome'
import Welcome from '../views/public/Welcome'
import Books from '../views/public/Books'
import MainSecond from '../views/public/mainSecond'
Vue.use(VueRouter);

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: Login,
    hidden: true
  },
  {
    path: '/home',
    name: 'Home',
    component: Home,
    hidden: true
  },
  {
    path: '/home',
    name: '导航一',
    component: Home,
    children:[
      {
        path: '/teacher',
        name: '管理教师',
        component: Teacher
      },
      {
        path: '/course',
        name: '管理课程',
        component: Course
      }
    ]
  },
  {
    path: '/',
    name: '前端首页',
    component: PublicHome
  },
  {
    path: '/public',
    name: '前端首页',
    component: PublicHome,
    children:[
      {
        path: 'welcome',
        name: '欢迎页面',
        component: Welcome
      },
      {
        path: 'books',
        name: '图书页面',
        component: Books
      },

    ]
  },
  {
    path: '/mainSecond',
    name: '直播页面',
    component: MainSecond,
  }
]

const router = new VueRouter({
  routes
})

export default router
