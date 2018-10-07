<template>
  <div class="tag">
    <div class="tag-content">
      <div class="tag-header">
        <span class="tag-title"> {{tag.name}}
          <router-link :to="{ name: 'Edit Tag', params: { id: tag.id }}" class="new-post">
            [edit]
          </router-link>
          <span v-on:click="this.deleteTag"> [delete] </span> 
        </span>
        <h2 v-if="tag.posts"> Last updated: {{tag.posts[0]?formatDate(tag.posts[0].updated_at):0}}</h2>
      </div>
      <div class="post" v-for="post in tag.posts" :key="post.id">
        <div class="post-title">
        <span class="post-title"> 
          <router-link :to="{ name: 'Post', params: { id: post.id }}" class="see-post">
            {{post.title?post.title:"Untitled"}} 
          </router-link>
          <router-link :to="{ name: 'Edit Post', params: { id: post.id }}" class="new-post">
            [edit]
          </router-link>
          <span v-on:click="deletePost(post.id)"> [delete] </span> </span>
          <h2> {{formatDate(post.inserted_at)}} </h2>
        </div>
         <hr/>
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
import post_api from "../api/post_api";

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
      this.tag.posts = this.tag.posts.sort(function(a, b) {
        return new Date(b.inserted_at) - new Date(a.inserted_at);
      });
      console.log(this.tag.posts);
    });
  },
  beforeRouteUpdate(to, from, next) {
    this.id = to.params.id;
    tag_api.get_tag(this.id, response => {
      this.tag = response;
      this.tag.posts = this.tag.posts.sort(function(a, b) {
        return new Date(b.inserted_at) - new Date(a.inserted_at);
      });
    });
    next();
  },
  methods: {
    formatDate(date) {
      var d = new Date(date);
      return d.toDateString();
    },
    deleteTag() {
      const answer = window.confirm(
        "Do you really want to delete the tag and all its posts?"
      );
      if (answer) {
        tag_api.delete_tag({ id: this.tag.id }, response => {
          console.log(response);
        });
      }
    },
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
.tag {
  display: flex;
  justify-content: space-between;
}

.tag-header {
  margin-bottom: 50px;
}

.tag-content {
  width: 100%;
}
.new-post {
  font-size: 50px;
}

.post {
  margin-bottom: 30px;
}

.post-title {
  display: flex;
  justify-content: space-between;
}

.tag-title {
  font-size: 4rem;
}
</style>
