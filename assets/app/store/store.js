import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex);

const topic_map = {
    1: { type: "topic", title: "javascript", nodes: [  2,  3, 4, 9]},
    2: { type: "topic", title: "classes", nodes: [7]},
    3: { type: "topic", title: "functions", nodes: [ 8, 5]},
    4: { type: "topic", title: "es6", nodes: [7, 5]},
    5: { type: "topic", title: "arrow functions", nodes: [ 8 ] },
    6: { type: "text", content: "hey" },
    7: { type: "text", content: "yup" },
    8: { type: "text", content: "functional languages are ok" }
};

const store = new Vuex.Store({
    state: {
        topic_map
    },
    actions: {
        MODIFY_CONTENT: function({ commit }, payload) {
            commit("MODIFY_CONTENT_MUTATION", payload);
        },
        ADD_TOPIC: function({ commit }, payload) {
            commit("ADD_TOPIC_MUTATION", payload);
        }
    },
    mutations: {
        MODIFY_CONTENT_MUTATION: function(state, payload) {
            state.topic_map[payload.id].content = payload.content;
        },
        ADD_TOPIC_MUTATION: function(state, payload) {
            console.log("alo")
            state.topic_map[9] = {type: "topic", title: "allo"};
        }
    },
    getters: {
        getNodeById: (state) => (id) => {
            return state.topic_map[id]
        }
    },
    plugins: [createPersistedState({
        storage: {
          getItem: key => window.localStorage.getItem(key),
          setItem: (key, value) => window.localStorage.setItem(key, value),
          removeItem: key => window.localStorage.removeItem(key)
        }
    })],
    strict: true 
});

export default store;