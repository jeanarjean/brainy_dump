<template>
  <div class="tag">
      <h1> {{tag.name}}</h1>
      <div v-for="post in tag.posts" :key="post.id">
          <h2> {{post.title}} </h2>
          {{post.body}}
        </div>
  </div>
</template>

<script>
import tag_api from "../api/tag_api";

export default {
  name: "tag",
  data() {
    return {
      id: {},
      tag: {}
    };
  },
  mounted: function() {
    this.id = this.$route.params.id;
    tag_api.get_tag(this.id, response => {
      this.tag = response;
    });
  }
};
</script>
