<template>
  <div class="post">
    <div class="post-title">{{post.title}}</div>
    <div class="post-date">
      Created: {{date_formatter.formatDate(post.inserted_at)}}
      <br>
      Last Updated: {{date_formatter.formatDate(post.updated_at)}}
    </div>
    <div v-html="post.body" class="post-content"></div>
  </div>
</template>

<script>
import post_api from "../../api/post_api";
import date_formatter from "../../utils/date_formatter";

export default {
  name: "tag",
  data() {
    return {
      post: {},
      date_formatter: date_formatter
    };
  },
  mounted: function() {
    this.id = this.$route.params.id;
    post_api.get_post(this.id, response => {
      this.post = response;
    });
  },
  methods: {
    deletePost(id) {
      const answer = window.confirm("Do you really want to delete this post?");
      if (answer) {
        post_api.delete_post({ id: id }, response => {
          console.log(response);
        });
      }
    }
  }
};
</script>
<style <style lang="scss" scoped>
.post-title {
  font-size: 3rem;
  font-weight: 800;
}

.post-date {
  font-weight: 600;
}
</style>