import Vue from 'vue';
import Main from './Main';
import router from './router/router.js';
import store from './store/store';
import { MdToolbar, MdButton, MdIcon, MdField, MdApp, MdContent, MdDrawer, MdList } from 'vue-material/dist/components';
import VueMaterial from 'vue-material'
import VueQuillEditor from 'vue-quill-editor';

import "vueify/lib/insert-css";
import 'quill';
import 'vue-material';

Vue.config.productionTip = false;
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
Vue.use(VueMaterial);
Vue.use(MdToolbar);
Vue.use(MdButton);
Vue.use(MdIcon);
Vue.use(MdField);
Vue.use(MdApp);
Vue.use(MdContent);
Vue.use(MdDrawer);
Vue.use(MdList);


/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    store,
    render: h => h(Main)
});