<template>
  <div class="tags-index">
      <div v-for="tag in tags" :key="tag.id">
        <router-link :to="{ path: '/tags/' + tag.id}">
          <h1> {{tag.name}} </h1>
            <hr/>
        </router-link>
          <div v-for="post in tag.posts" :key="post.id">
            <h4> {{post.title}} </h4>
            <div v-html="post.body"> </div>
          </div>
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
