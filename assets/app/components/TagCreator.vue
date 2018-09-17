<template>
  <div class="tag-creator">
      <input class="tag-form-name" placeholder="Tag Name" v-model="data.name">
      <br/>
      <br/>
      <button v-on:click="this.createTag">Send</button>

      <h1> {{response}} </h1>
  </div>
</template>

<script>
import tag_api from "../api/tag_api";

export default {
  name: "tag-creator",
  data() {
    return {
      data: {},
      response: {}
    };
  },
  methods: {
    createTag() {
      tag_api.create_tag(this.data, response => {
        this.response = response;
      });
      // this.$router.go(-1);
    }
  }
};
</script>
<style lang="scss">
.tag-form-name {
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
</style>