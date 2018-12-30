import Vue from 'vue'
import Router from 'vue-router'
import StaticPages from '../components/StaticPages'
import App from '../components/App'
import Tag from '../components/Tag'
import TagCreator from '../components/TagCreator';
import TagEditor from '../components/TagEditor';
import Tags from '../components/Tags';
import TagsIndex from '../components/TagsIndex';
import PostCreator from '../components/PostCreator';
import PostEditor from '../components/PostEditor';
import Posts from '../components/Posts';
import Post from '../components/Post';
import LoginRedirect from '../components/LoginRedirect';

Vue.use(Router)

export default new Router({
    mode: "history",
    routes: [
        {
            path: '/',
            name: 'StaticPages',
            component: StaticPages
        },
        {
            path: '/app',
            name: 'App',
            component: App,
            children: [
                {
                    path: 'tags',
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
                        },
                        {
                            path: 'edit/:id',
                            name: 'Edit Tag',
                            component: TagEditor,
                            props: true
                        }
                    ]
                },
                {
                    path: 'posts',
                    component: Posts,
                    children: [
                        {
                            path: 'new',
                            name: 'New Post',
                            component: PostCreator
                        },
                        {
                            path: 'edit/:id',
                            name: 'Edit Post',
                            component: PostEditor
                        },
                        {
                            path: ':id',
                            name: 'Post',
                            component: Post
                        }
                    ]
                }]
        },
        {
            path: '/login_redirect',
            name: 'LoginRedirect',
            component: LoginRedirect
        },
    ]
})
