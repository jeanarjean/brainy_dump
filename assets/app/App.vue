<template>
  <div id="app">
    <div class="app-container"> 
      <Header class="header"> </Header>
      <div class="body">
        <router-view></router-view>
      </div>
      <div class="sidebar">
        <Sidebar/>
      </div>
    </div>
  </div>
</template>

<script>
import Header from "./components/Header";
import Sidebar from "./components/Sidebar";

export default {
  name: "app",
  components: {
    Header,
    Sidebar
  }
};
</script>

<style>
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}

.app-container {
  display: grid;
  grid-template-areas:
    "header header header"
    "sidebar body body"
    "footer footer footer";
  grid-template-rows: 8vh 1fr 200px;
  grid-template-columns: 300px 1fr 200px;
}

.sidebar {
  grid-area: sidebar;
}

.body {
  grid-area: body;
  margin-top: 50px;
  background-color: lightgray;
}


.header {
  grid-area: header;
}

body {
  margin: 0;
  font-family: 'Merriweather', serif;
}

h1 {
  margin: 0;
}

a:visited {
  color: red;
}
</style>
