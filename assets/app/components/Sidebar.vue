<template>
  <div>
    <md-toolbar class="md-transparent bold" md-elevation="0">
      <div style="flex: 1;">Tags</div>
      <md-button class="md-raised md-accent" :to="{ name: 'New Tag'}">Add tag</md-button>
    </md-toolbar>
    <md-list>
      <md-list-item
        v-for="tag in tags"
        :key="tag.id"
        :to="{name: 'Tag',params: {id: tag.id}}"
      >{{tag.name}}</md-list-item>
    </md-list>
  </div>
</template>

<script>
import tag_api from "../../api/tag_api";

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
.bold {
  font-weight: 800;
}
</style>