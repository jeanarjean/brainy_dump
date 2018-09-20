<template>
  <div class="tags-index">
      <div class="tag" v-for="tag in tags" :key="tag.id">
        <router-link :to="{ path: '/tags/' + tag.id}">
          <h1> {{tag.name}} </h1>
            <hr/>
        </router-link>
          <div v-if="tag.posts.length != 0">
            <div v-if="tag.posts.length != 0" v-for="post in tag.posts" :key="post.id">
              <h4> {{post.title}} </h4>
              <div v-html="post.body"> </div>
            </div>
          </div>
          <div v-else>
              This tag doesn't have any post yet!
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

<style lang="scss" scoped>
.tag {
  margin-bottom: 50px;
}

</style>

