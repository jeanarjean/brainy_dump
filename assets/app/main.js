import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store/store'
import "vueify/lib/insert-css" // required for .vue file <style> tags
import { VueEditor } from 'vue2-editor'


Vue.config.productionTip = false
Vue.use(VueEditor);

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    store,
    render: h => h(App)
})