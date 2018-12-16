<template>
  <div id="app">
    <div class="app-container">
      <Header class="header"></Header>
      <div class="body">
        <div class="body-container">Redirecting to Home Page.</div>
      </div>
    </div>
  </div>
</template>

<script>
import Header from "./Header";

export default {
  name: "home",
  components: {
    Header
  },
  mounted: function() {
    this.$store.dispatch("SET_AUTH_TOKEN", this.$route.query.token);
    this.$router.push("/");
    location.reload();
  }
};
</script>

};
</script>
<style lang="scss" scoped>
.body-container {
  margin-top: 50px;
  background-color: white;
  height: 70vh;
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2),
    0 1px 5px 0 rgba(0, 0, 0, 0.12);
  overflow: scroll;
}

.body-content {
  margin-left: 20px;
  margin-top: 20px;
  height: 70vh;
}

.app-container {
  display: grid;
  grid-template-areas:
    "header header header"
    "body body body"
    "footer footer footer";
  grid-template-rows: 20vh 1fr 200px;
  grid-template-columns: 550px 1fr 200px;
}

.sidebar {
  grid-area: sidebar;
}

.body {
  grid-area: body;
}

.header  {
  grid-area: header;
}
</style>


