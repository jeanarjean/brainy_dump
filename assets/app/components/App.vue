<template>
  <div id="app">
    <md-app md-mode="reveal">
      <md-app-toolbar class="md-primary">
        <md-button v-if="isMobile" class="md-icon-button" @click="menuVisible = !menuVisible">
          <md-icon>menu</md-icon>
        </md-button>

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
      <md-app-drawer :md-permanent="isClipped" :md-active.sync="menuVisible">
        <Sidebar/>
      </md-app-drawer>
      <md-app-content md-scrollbar="true">
        <router-view></router-view>
      </md-app-content>
    </md-app>
  </div>
</template>

<script>
import Sidebar from "./Sidebar";

export default {
  name: "App",
  components: {
    Sidebar
  },
  data: () => ({
    menuVisible: false,
    windowWidth: window.innerWidth
  }),
  computed: {
    loggedIn: function() {
      return (
        this.$store.state.auth_token != null && this.$store.state.auth_token
      );
    },
    isMobile() {
      if (this.windowWidth <= 968) {
        return true;
      }
      return false;
    },
    isClipped() {
      if (!this.isMobile) {
        return "clipped";
      }
      return null;
    }
  },
  mounted() {
    window.addEventListener("resize", () => {
      this.windowWidth = window.innerWidth;
      console.log(this.isMobile);
    });
  }
};
</script>

<style lang="scss" scoped>
.md-app {
  height: 100vh;
  border: 1px solid rgba(#000, 0.12);
}

.md-app-drawer {
  width: 20vw;
  min-width: 300px;
}

.md-layout {
  width: 100%;
}
</style>

