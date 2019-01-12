<template>
  <div class="post-creator">
    <div class="post-creator-inner">
      <input placeholder="Title (optional)" class="post-form-title" v-model="data.title">
      <br>
      <br>
      <TagAutoComplete :init="this.tag" v-model="data.tags"></TagAutoComplete>
      <br>
      <br>
      <quill-editor class="body-editor" v-model="data.body"/>
      <div class="bottom">
        <div style="flex: 1;"></div>
        <md-button class="md-raised md-accent" v-on:click="this.createPost">Create</md-button>
      </div>
    </div>
  </div>
</template>

<script>
import post_api from "../../api/post_api";
import TagAutoComplete from "../generic-components/TagAutoComplete";

export default {
  name: "post-creator",
  components: {
    TagAutoComplete
  },
  props: {
    tag: Object
  },
  data() {
    return {
      data: { tags: "" },
      response: {}
    };
  },
  mounted() {
    console.log(this.tag);
  },
  methods: {
    createPost() {
      post_api.create_post(this.data, response => {
        this.response = response;
      });
      this.$router.go(-1);
    }
  },
  beforeRouteLeave(to, from, next) {
    if (this.data.body || this.data.title) {
      const answer = window.confirm(
        "Do you really want to leave? you have unsaved changes!"
      );
      if (answer) {
        next();
      } else {
        next(false);
      }
    } else {
      next();
    }
  }
};
</script>

<style lang="scss">
.post-form-title {
  height: 40px;
  width: 100%;
  font-size: 40px;
  border: 0;
  text-decoration: underline;
  New &::-moz-placeholder {
    text-decoration: underline;
  }

  &::-webkit-input-placeholder {
    text-decoration: underline;
  }

  &::-ms-input-placeholder {
    text-decoration: underline;
  }
}

.post-creator-inner {
  margin-top: 20px;
  width: 95%;
  background-color: white;
}

.body-editor {
  margin-bottom: 2vh;
}

.ql-container {
  height: 60vh;
}

.bottom {
  display: flex;
  align-content: space-between;
}
</style>