<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import Body from "./components/Body";

export default {
  name: "app",
  components: {
    Body
  }
};
</script>

<style lang="scss">
@import "./style/theme"; // Import the theme engine
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.app-container {
  display: grid;
  grid-template-areas:
    "header header header"
    "sidebar body something"
    "footer footer footer";
  grid-template-rows: 10vh 1fr 200px;
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

body {
  margin: 0;
  font-family: "Merriweather", serif;
}

h1,
h2,
h3,
h4,
h5 {
  margin: 0;
}

a:visited {
  color: black;
}
</style>
