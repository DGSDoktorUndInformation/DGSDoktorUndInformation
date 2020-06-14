import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from "../views/Login";
import ArtikelErfassung from "../views/ArtikelErfassung";

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Login',
    component: Login,
    props: true
  },
  {
    path:'/artikel-erfassen',
    name: 'ArtikelErfassung',
    component : ArtikelErfassung

  }
]

const router = new VueRouter({
  routes
})

export default router
