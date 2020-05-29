import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from "../views/Login";
import Inhaltserstellung from "../views/Inhaltserstellung";

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Login',
    component: Login
  },
  {
    path:'/inhaltserstellung',
    name: 'Inhaltserstellung',
    component : Inhaltserstellung

  }
]

const router = new VueRouter({
  routes
})

export default router
