<template>
  <div class="tag-creator">
    <md-field class="input">
      <label>Tag Name</label>
      <md-input v-model="data.name"></md-input>
      <md-button class="md-raised md-primary" v-on:click="this.createTag">Create</md-button>
      <TagAutoComplete v-model="data.parent" max_tags="1"></TagAutoComplete>
    </md-field>
  </div>
</template>

<script>
import tag_api from "../../api/tag_api";
import TagAutoComplete from "../generic-components/TagAutoComplete";

export default {
  name: "tag-creator",
  components: {
    TagAutoComplete
  },
  data() {
    return {
      data: {},
      response: {}
    };
  },
  methods: {
    createTag() {
      this.data.parent = this.data.parent[0];
      tag_api.create_tag(this.data, response => {
        this.response = response;
      });
    }
  },
  beforeRouteLeave(to, from, next) {
    if (this.data.name) {
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

.input {
  width: 700px;
}
@media only screen and (max-width: 600px) {
  .input {
    width: 300px;
  }
}

@media only screen and (max-width: 400px) {
  .input {
    width: 100vw;
  }
}
</style>