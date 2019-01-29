<template>
  <div>
    <div v-if="data.posts.length != 0">
      <div>
        <span class="md-display-1">Recent Posts</span>
      </div>
      <br>
      <md-card class="post-card" v-for="post in data.posts" :key="post.id">
        <md-card-header class="header-style">
          <div class="md-title">
            <span class="md-title">
              <router-link
                :to="{ name: 'Post', params: { id: post.id }}"
                class="see-post"
              >{{post.title?post.title:"Untitled"}}</router-link>
            </span>
            <router-link :to="{ name: 'Edit Post', params: { id: post.id}}" class="post-action">
              <md-button class="md-icon-button">
                <md-icon>edit</md-icon>
              </md-button>
            </router-link>
            <md-button class="md-icon-button" v-on:click="deletePost(post.id)">
              <md-icon>delete</md-icon>
            </md-button>
          </div>
          <span class="md-title">{{date_formatter.formatDate(post.inserted_at)}}</span>
        </md-card-header>
        <md-card-content v-html="post.body"></md-card-content>
      </md-card>
    </div>
    <div v-else>
      <md-empty-state
        md-icon="book"
        md-label="Seems you haven't created any post yet"
        md-description="Start by adding creating a tag using the sidebar, then click on the big red plus button to add a new post"
      ></md-empty-state>
    </div>
    <div class="add-button">
      <div></div>
      <div class="add-button-div">
      <md-button class="md-fab md-accent" :to="{ name: 'New Post', params: {tag: tag}}">
        <md-icon>add</md-icon>
      </md-button>
      </div>
    </div>
  </div>
</template>

<script>
import post_api from "../api/post_api";
import date_formatter from "../utils/date_formatter";

export default {
  name: "post-creator",
  props: {
    tag: Object
  },
  data() {
    return {
      data: { posts: {} },
      date_formatter: date_formatter
    };
  },
  mounted() {
    post_api.get_posts(response => {
      this.data.posts = response;
      this.data.posts = this.data.posts.sort(function(a, b) {
        return new Date(b.inserted_at) - new Date(a.inserted_at);
      });
      this.data.posts = this.data.posts.slice(0, 10);
    });
  },
  methods: {
    deletePost(id) {
      const answer = window.confirm("Do you really want to delete this post?");
      if (answer) {
        post_api.delete_post(
          {
            id: id
          },
          response => {
            console.log(response);
            this.$router.go();
          }
        );
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.header-style {
  display: flex;
  justify-content: space-between;
}

.post-card {
  margin-bottom: 2vh;
}

.add-button {
  display: flex;
  position: sticky;
  justify-content: space-between;
  bottom: 25px;
}

.add-button-div {
  position: relative;
  z-index: 5;
}
</style>
