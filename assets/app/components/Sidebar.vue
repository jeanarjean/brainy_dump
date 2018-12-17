<template>
  <div class="sidebar-container">
    <div class="sidebar-content">
      <div class="sidebar-header">
        <router-link :to="{ name: 'New Tag'}">
          <div class="sidebar-header-new">New Tag</div>
        </router-link>
        <router-link :to="{ name: 'New Post'}">
          <div class="sidebar-header-new">New Post</div>
        </router-link>
      </div>
      <div class="tag" v-for="tag in tags" :key="tag.id">
        <router-link :to="{ name: 'Tag', params: {id: tag.id}}">
          <div class="sidebar-tag-name">{{tag.name}}</div>
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
</style>