<template>
  <div class="tags-index">
    {{tags}}
      <div v-for="tag in tags" :key="tag.id">
        <router-link :to="{ path: '/tags/' + tag.id}">
          <h1> {{tag.name}} </h1>
          <div v-for="post in tag.posts" :key="post.id">
            <h2> {{post.title}} </h2>
           </div>
        </router-link>



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
