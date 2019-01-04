<template>
  <div>
    <md-toolbar class="md-transparent bold" md-elevation="0">Tags</md-toolbar>
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