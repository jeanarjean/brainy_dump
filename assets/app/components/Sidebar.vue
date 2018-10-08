<template>
    <div class="sidebar-container">
      <div class="sidebar-content">
        <div class="sidebar-header">
          <router-link :to="{ path: '/tags/new'}">
            <div class="sidebar-header-new"> New Tag </div>
          </router-link>
          <router-link :to="{ path: '/posts/new'}">
            <div class="sidebar-header-new"> New Post </div>
          </router-link>
        </div>
        <div class="tag" v-for="tag in tags" :key="tag.id">
          <router-link :to="{ path: '/tags/' + tag.id}">
            <div class="sidebar-tag-name"> {{tag.name}} </div>
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

<style scoped lang="scss">
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

.sidebar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 50px;
}

.sidebar-header-new {
  font-size: 1rem;
  font-weight: 600;
  margin-left: 2px;
  margin-right: 8px;
}

.sidebar-header-new:hover {
  background: rgba(0,0,0,0.12);
}

.sidebar-tag-name {
  display: flex;
  align-items: center;
  font-size: .90rem;
  height: 2rem;
  margin-left: 2px;
}

.sidebar-tag-name:hover {
  font-size: .90rem;
  background: rgba(0,0,0,0.12);
}
</style>