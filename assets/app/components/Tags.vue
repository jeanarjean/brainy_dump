<template>
  <div class="tags">
    {{tags}}
      <div v-for="tag in tags" :key="tag.id">
          <h1> {{tag.name}} </h1>
          <h5> {{tag.id}} </h5>
      </div>
  </div>
</template>

<script>
import tag_api from "../api/tag_api";

export default {
  name: "Tags",
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
