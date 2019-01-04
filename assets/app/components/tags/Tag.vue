<template>
  <div class="tag">
    <div class="tag-content">
      <div class="tag-header">
        <span class="md-display-1">
          {{tag.name}}
          <router-link :to="{ name: 'Edit Tag', params: { id: tag.id }}">
            <md-button class="md-icon-button md-primary">
              <md-icon>edit</md-icon>
            </md-button>
          </router-link>
          <md-button class="md-icon-button md-primary" v-on:click="this.deleteTag">
            <md-icon>delete</md-icon>
          </md-button>
        </span>
        <br>
        <span
          class="md-subheading"
          v-if="tag.posts"
        >Last updated: {{tag.posts[0]?date_formatter.formatDate(tag.posts[0].updated_at):date_formatter.formatDate(tag.updated_at)}}</span>
      </div>
      <div class="post" v-for="post in tag.posts" :key="post.id">
        <div class="post-title">
          <span class="left-side-title">
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
          </span>
          <span class="md-title">{{date_formatter.formatDate(post.inserted_at)}}</span>
        </div>
        <hr>
        <div v-html="post.body"></div>
      </div>
      <div class="add-button">
        <div></div>
        <md-button class="md-fab md-accent" :to="{ name: 'New Post', params: {tag: tag}}">
          <md-icon>add</md-icon>
        </md-button>
      </div>
    </div>
  </div>
</template>

<script>
import tag_api from "../../api/tag_api";
import post_api from "../../api/post_api";
import date_formatter from "../../utils/date_formatter";

export default {
  name: "tag",
  data() {
    return {
      id: {},
      tag: {},
      posts: [],
      date_formatter: date_formatter
    };
  },
  mounted: function() {
    this.id = this.$route.params.id;
    tag_api.get_tag(this.id, response => {
      this.tag = response;
      this.tag.posts = this.tag.posts.sort(function(a, b) {
        return new Date(b.inserted_at) - new Date(a.inserted_at);
      });
      console.log(this.tag);
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
    deleteTag() {
      const answer = window.confirm(
        "Do you really want to delete the tag and all its posts?"
      );
      if (answer) {
        tag_api.delete_tag(
          {
            id: this.tag.id
          },
          response => {
            console.log(response);
            // TODO GO SOMEWHERE ELSE
          }
        );
      }
    },
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

<style <style lang="scss" scoped>
.tag {
  display: flex;
  justify-content: space-between;
}

.tag-header {
  font-size: 0.8rem;
  margin-bottom: 50px;
}

.tag-content {
  width: 100%;
}

.tag-action:hover {
  cursor: pointer;
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
  align-items: center;
}

.left-side-title {
  display: flex;
  align-items: center;
}

.post-action {
  color: black;
}

.post-action:hover {
  cursor: pointer;
}

.add-button {
  display: flex;
  position: sticky;
  justify-content: space-between;
  bottom: 25px;
}
</style>
