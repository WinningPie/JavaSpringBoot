import Vue from 'vue'
import Vuex from "vuex"

Vue.use(Vuex)


export default new Vuex.Store({
    state:{
        routes: []
    },
    mutations: {
        findAllRoutes(state,data) {
            state.routes = data
        }
    },
    actions: {

    }
})

