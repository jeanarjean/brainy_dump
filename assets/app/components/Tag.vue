<template>
  <div class="tag">
    <div>
      <h1 class="tag-title"> {{tag.name}}</h1>
      <h2> Last updated: {{formatDate(tag.posts[0].updated_at)}}</h2>
      <div v-for="post in tag.posts" :key="post.id">
        <div class="post-title">
          <h3> {{post.title}} </h3>
          <h2> {{formatDate(post.inserted_at)}} </h2>
        </div>
        <div v-html="post.body">
        </div>
      </div>
    </div>
    <div>
       <router-link :to="{ name: 'New Post', params: { tag: tag.name }}" class="new-post">
        +
       </router-link>
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
      tag: {},
      posts: []
    };
  },
  mounted: function() {
    this.id = this.$route.params.id;
    tag_api.get_tag(this.id, response => {
      this.tag = response;
      console.log(this.tag.posts);
      this.tag.posts = this.tag.posts.sort(function(a, b) {
        return new Date(b.inserted_at) - new Date(a.inserted_at);
      });
      console.log(this.tag.posts);
    });
  },
  methods: {
    formatDate(date) {
      var d = new Date(date);
      return d.toDateString();
    }
  }
};
</script>
<style>
.tag {
  display: flex;
  justify-content: space-between;
}
.new-post {
  font-size: 50px;
}

.post-title {
  display: flex;
  justify-content: space-between;
}

.tag-title {
  font-size: 4rem;
}
</style>
