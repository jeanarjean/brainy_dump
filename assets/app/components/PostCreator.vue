<template>
  <div class="post-creator">
    <div class="post-creator-inner">
      <input placeholder="Title (optional)" class="post-form-title" v-model="data.title">
      <br/>
      <br/>
      <input placeholder="Tags (at least one)" class="post-form-tags" v-model="data.tags">
      <br/>
      <br/>
      <VueEditor class="body-editor" v-model="data.body"></VueEditor>
      <br/>
      <button v-on:click="this.createPost">Send</button>

      <h1> {{response}} </h1>
    </div>
  </div>
</template>

<script>
import post_api from "../api/post_api";
import { VueEditor } from "vue2-editor";

export default {
  name: "post-creator",
  components: {
    VueEditor
  },
  props: {
    tag: String
  },
  data() {
    return {
      data: { tags: this.tag },
      response: {}
    };
  },
  methods: {
    createPost() {
      console.log("asdasd");
      post_api.create_post(this.data, response => {
        this.response = response;
      });
      this.$router.go(-1);
    }
  }
};
</script>
<style lang="scss">
.post-body {
  height: 70vh;
  width: 70vw;
}

.post-form-title {
  height: 40px;
  width: 100%;
  font-size: 40px;
  border: 0;
  text-decoration: underline;

  &::-moz-placeholder {
    text-decoration: underline;
  }

  &::-webkit-input-placeholder {
    text-decoration: underline;
  }

  &::-ms-input-placeholder {
    text-decoration: underline;
  }
}

.post-form-tags {
  height: 20px;
  width: 100%;
  font-size: 20px;
  border: 0;
  text-decoration: underline;

  &::-moz-placeholder {
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
}
</style>