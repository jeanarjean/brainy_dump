<template>
  <div id="app">
    <div class="app-container"> 
      <Header class="header"> </Header>
      <div class="body">
        <Body>
        </Body>
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
import Body from "./components/Body";

export default {
  name: "app",
  components: {
    Header,
    Body,
    Sidebar
  }
};
</script>

<style>
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  background-color: lightgray;
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


.header {
  grid-area: header;
}

body {
  margin: 0;
  font-family: 'Merriweather', serif;
}

h1,  h2,  h3, h4, h5 {
  margin: 0;
}

a:visited {
  color: black;
}
</style>
