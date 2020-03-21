import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Faq from "../views/Faq";
import AnleitungAerzte from "../views/AnleitungAerzte";
import Session from "../views/Session";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/anleitung-aerzte',
    name: 'AnleitungAerzte',
    component: AnleitungAerzte
  },
  {
    path: '/session',
    name: 'Session',
    component: Session,
    props: true
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path:'/faq',
    name:'FAQ',
    component: Faq
  }
]

const router = new VueRouter({
  routes
})

export default router
