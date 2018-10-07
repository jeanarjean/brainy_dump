<template>
    <div class="sidebar-container">
      <div class="sidebar-content">
        <router-link :to="{ path: '/tags/new'}">
          <h1> New Tags </h1>
        </router-link>
        <router-link :to="{ path: '/posts/new'}">
          <h1> New Posts </h1>
        </router-link>
        <div class="tag" v-for="tag in tags" :key="tag.id">
          <router-link :to="{ path: '/tags/' + tag.id}">
            <h1> {{tag.name}} </h1>
            <hr/>
          </router-link>
        </div>
      </div>
    </div>
</template>

<script>
import tag_api from "../api/tag_api";

export default {
  name: "sidebar-component",
  data() {
    return {
      tags: []
    };
  },
  mounted: function() {
    tag_api.get_tags(response => {
      this.tags = response;
    });
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
  background-color: white;
  margin-left: 30px;
  box-shadow:  0 2px 2px 0 rgba(0,0,0,0.14), 0 3px 1px -2px rgba(0,0,0,0.2), 0 1px 5px 0 rgba(0,0,0,0.12);
  /* border-width: 3px;
  border-style: solid;
  border-radius: 2px; */
}

.sidebar-content {
}
</style>