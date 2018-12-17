<template>
  <div id="app">
    <div class="app-container">
      <Header class="header"></Header>
      <div class="body md-layout md-gutter">
        <div class="md-layout-item md-medium-size-33 md-small-size-50 md-xsmall-size-100">
          <Sidebar/>
        </div>
        <div
          class="md-layout-item md-medium-size-33 md-small-size-50 md-xsmall-size-100 md-size-70"
        >
          <router-view></router-view>
        </div>
        <div
          class="md-layout-item md-medium-size-33 md-small-size-50 md-xsmall-size-100 md-size-10"
        ></div>
      </div>
      <div class="footer"></div>
    </div>
  </div>
</template>

<script>
import Header from "./Header";
import Sidebar from "./Sidebar";

export default {
  name: "body",
  components: {
    Header,
    Sidebar
  }
};
</script>

};
</script>
<style lang="scss" scoped>
.app-container {
  height: 100vh;
  display: grid;
  grid-template-areas:
    "header header header"
    "body body body"
    "footer footer footer";
  grid-template-rows: 10vh 1fr 100px;
  grid-template-columns: 550px 1fr 200px;
}

.body {
  grid-area: body;
}

.header  {
  grid-area: header;
}

.footer  {
  grid-area: footer;
}
</style>

