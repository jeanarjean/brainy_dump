import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex);

const store = new Vuex.Store({
    state: {
        auth_token: localStorage.brainy_dump ? JSON.parse(localStorage.brainy_dump).auth_token : ""
    },
    actions: {
        SET_AUTH_TOKEN: function ({ commit }, payload) {
            commit("SET_AUTH_TOKEN_MUTATION", payload);
        },
    },
    mutations: {
        SET_AUTH_TOKEN_MUTATION: function (state, payload) {
            state.auth_token = payload;
        }
    },
    plugins: [createPersistedState({
        storage: {
            getItem: key => window.localStorage.getItem(key),
            setItem: (key, value) => window.localStorage.setItem(key, value),
            removeItem: key => window.localStorage.removeItem(key)
        },
        key: "brainy_dump"
    }
    )],
    strict: true
});

export default store;