<template>
  <div id="app">
    <md-app md-mode="reveal">
      <md-app-toolbar class="md-primary">
        <div class="header-title" style="flex: 1;">
          <router-link
            :to="{ name: 'StaticPages'}"
            class="md-primary-alternate"
            style="color: white;"
          >
            <span class="md-title">Brainy Dump</span>
          </router-link>
        </div>
        <div v-if="!loggedIn">
          <a href="/auth/auth0">
            <md-button class="md-accent md-raised">Login/Sign Up</md-button>
          </a>
        </div>
        <div class="account" v-else>
          <!-- <md-button class="md-icon-button md-raised md-primary">
              <md-icon>person</md-icon>
          </md-button>-->
          <a href="/logout">
            <md-button class="md-accent md-raised">Logout</md-button>
          </a>
        </div>
      </md-app-toolbar>

      <md-app-content>
        <md-card>
          <md-card-header>
            <div class="md-title">Welcome to Brainy Dump</div>
          </md-card-header>

          <md-card-content>Brainy Dump is a note taking / journaling application that allows to journal different facets of your life.</md-card-content>
          <md-card-actions>
            <md-button class="md-accent md-raised" :to="{ name: 'AppHome'}">Access App</md-button>
          </md-card-actions>
        </md-card>
      </md-app-content>
    </md-app>
  </div>
</template>

<script>
import Sidebar from "./Sidebar";

export default {
  name: "static-pages",
  data: () => ({
    menuVisible: false
  }),
  components: {
    Sidebar
  },
  computed: {
    loggedIn: function() {
      return (
        this.$store.state.auth_token != null && this.$store.state.auth_token
      );
    }
  }
};
</script>

};
</script>

<style lang="scss" scoped>
.md-app {
  height: 100vh;
  border: 1px solid rgba(#000, 0.12);
}
</style>


