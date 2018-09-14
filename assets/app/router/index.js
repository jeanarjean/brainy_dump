import Vue from 'vue'
import Router from 'vue-router'
import Home from '../components/Home'
import Tag from '../components/Tag'
import TagCreator from '../components/TagCreator';
import Tags from '../components/Tags'
import TagsIndex from '../components/TagsIndex'
import PostCreator from '../components/PostCreator'

Vue.use(Router)

export default new Router({
  mode: "history",
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/tags',
      component: Tags,
      children: [
        {
          path: 'new',
          name: 'New Tag',
          component: TagCreator
        },
        {
          path: '',
          name: 'TagsIndex',
          component: TagsIndex
        },
        {
          path: ':id',
          name: 'Tag',
          component: Tag
        }
      ]
    },
    {
      path: '/posts',
      name: 'New Post',
      component: PostCreator,
      props: true
    }
  ]
})
