<template>
    <div class="sidebar-container">
      <div class="sidebar-content">
        <router-link :to="{ path: '/tags/'}">
          <h1> Tags </h1>
        </router-link>
        <router-link :to="{ path: '/tags/new'}">
          <h1> New Tags </h1>
        </router-link>
        <router-link :to="{ path: '/posts/'}">
          <h1> New Posts </h1>
        </router-link>
      </div>
    </div>
</template>

<script>
export default {
  name: "sidebar-component",
  data() {
    return {
      topic: {}
    };
  }
};
</script>

<style>
.sidebar-container {
  margin-top: 50px;
  text-align: right;

}

.sidebar-content {
  display: inline-block;
  width: 200px;
  height: 70vh;
  text-align: left;
  border-width: 3px;
  border-style: solid;
  border-radius: 2px;
}

.sidebar-content {
  background-color: gray;
}
</style>