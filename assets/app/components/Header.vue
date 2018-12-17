<template>
  <div class="header-container">
    <md-toolbar class="md-accent-variant">
      <div class="header-title" style="flex: 1">
        <router-link :to="{ name: 'Home'}" class="tag-action">Brainy Dump</router-link>
      </div>
      <div v-if="!loggedIn">
        <a href="/auth/auth0">
          <md-button class="md-primary md-raised">Login</md-button>
        </a>
      </div>
      <div class="account" v-else>
        <!-- <md-button class="md-icon-button md-raised md-primary">
          <md-icon>person</md-icon>
        </md-button>-->
        <a href="/logout">
          <md-button class="md-primary md-raised">Logout</md-button>
        </a>
      </div>
    </md-toolbar>
  </div>
</template>

<script>
export default {
  name: "header-component",
  components: {},
  data() {
    return {
      topic: {}
    };
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

<style <style lang="scss" scoped>
.header-container {
  grid-area: header;
}

.options {
  font-size: 50px;
}

.header-title {
  font-size: 2rem;
  font-weight: 800;
}
.account {
  display: flex;
}
</style>