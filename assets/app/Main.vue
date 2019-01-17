<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: "app"
};
</script>

<style lang="scss">
@import "./style/theme"; // Import the theme engine
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

body {
  margin: 0;
  font-family: "Merriweather", serif;
}
a:link {
  text-decoration: none;
}
</style>
