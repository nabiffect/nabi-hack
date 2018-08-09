import Vue from 'vue'
import Router from 'vue-router'
import Dashboard from '@/components/Dashboard'
import Signup from '@/components/Signup'
import FriendList from '@/components/FriendList'
import Register from '@/components/Register'
import NabiDapp from '@/components/nabi-dapp'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'dashboard',
      component: Dashboard
    },
    {
      path: '/signup',
      name: 'signup',
      component: Signup
    },
    {
      path: '/list',
      name: 'friendlist',
      component: FriendList
    },
    {
      path: '/register',
      name: 'register',
      component: Register
    },
    {
      path: '/nabidapp',
      name: 'nabi-dapp',
      component: NabiDapp
    }
  ]
})
