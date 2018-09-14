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
  width: 300px;
  height: 70vh;
}

.sidebar-content {
  background-color: gray;

  width: 240px;
  height: 85vh;
  margin-left: 20px;
  margin-right: 20px;
}
</style>