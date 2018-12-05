import Vue from 'vue';
import App from './App';
import router from './router/router.js';
import store from './store/store';
import VueMaterial from 'vue-material'
import { MdToolbar, MdButton, MdIcon } from 'vue-material/dist/components';
import VueQuillEditor from 'vue-quill-editor';
import VueCookies from 'vue-cookies';


// Import Brunch CSS files from external librairies.
import "vueify/lib/insert-css";
import 'quill';
import 'vue-material';

Vue.config.productionTip = false;
Vue.use(VueCookies);
Vue.use(VueQuillEditor, {
    modules: {
        toolbar: [
            ['bold', 'italic', 'underline', 'strike'],
            ['blockquote', 'code-block'],
            [{ 'header': 1 }, { 'header': 2 }],
            [{ 'list': 'ordered' }, { 'list': 'bullet' }],
            [{ 'script': 'sub' }, { 'script': 'super' }],
            [{ 'indent': '-1' }, { 'indent': '+1' }],
            [{ 'direction': 'rtl' }],
            [{ 'size': ['small', false, 'large', 'huge'] }],
            [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
            [{ 'font': [] }],
            [{ 'color': [] }, { 'background': [] }],
            [{ 'align': [] }],
            ['clean']
        ]
    }
});
Vue.use(MdToolbar);
Vue.use(MdButton);
Vue.use(MdIcon);


/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    store,
    render: h => h(App)
});