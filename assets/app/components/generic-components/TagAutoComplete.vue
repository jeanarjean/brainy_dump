<template>
  <div>
    <vue-tags-input
      v-model="tag"
      :tags="tags"
      :autocomplete-items="autocompleteItems"
      :add-only-from-autocomplete="true"
      @tags-changed="update"
    />
  </div>
</template>
<script>
import VueTagsInput from "@johmun/vue-tags-input";
import tag_api from "../../api/tag_api";

export default {
  name: "tag-auto-complete",
  props: ["value"],
  components: {
    VueTagsInput
  },
  data() {
    return {
      tag: this.value,
      tags: [],
      autocompleteItems: [],
      debounce: null
    };
  },
  watch: {
    tags(val) {
      this.$emit("input", val);
    },
    tag: "initItems"
  },
  methods: {
    update(newTags) {
      console.log(newTags);
      this.tags = newTags;
    },
    initItems() {
      clearTimeout(this.debounce);
      this.debounce = setTimeout(() => {
        tag_api.get_tags(response => {
          console.log(response);
          this.autocompleteItems = 
          response.map(a => {
            return { text: a.name, id: a.id };
          });
        });
      }, 600);
    }
  }
};
</script>