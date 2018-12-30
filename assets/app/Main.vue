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

h1,
h2,
h3,
h4,
h5 {
  margin: 0;
}
</style>
