import Vue from 'vue'
import Router from 'vue-router'
import Home from '../components/Home'
import Tags from '../components/Tags'
import Tag from '../components/Tag'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/tags/:id',
      name: 'Tag',
      component: Tag
    },
    {
      path: '/tags',
      name: 'Tags',
      component: Tags
    }
  ]
})
