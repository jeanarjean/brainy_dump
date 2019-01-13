<template>
  <div>
    <vue-tags-input
      v-model="tag"
      :tags="tags"
      :autocomplete-items="filteredItems"
      :add-only-from-autocomplete="true"
      :max_tags="this.max_tags"
      @tags-changed="update"
    />
  </div>
</template>
<script>
import VueTagsInput from "@johmun/vue-tags-input";
import tag_api from "../../api/tag_api";

export default {
  name: "tag-auto-complete",
  props: ["value", "max_tags", "init"],
  components: {
    VueTagsInput
  },
  data() {
    if (this.init) {
      this.$emit("input", { id: this.init.id, text: this.init.name });
    }
    return {
      tag: this.value,
      tags: this.init ? [{ id: this.init.id, text: this.init.name }] : [],
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
      this.tags = newTags;
    },
    initItems() {
      clearTimeout(this.debounce);
      this.debounce = setTimeout(() => {
        tag_api.get_tags(response => {
          this.autocompleteItems = response.map(a => {
            return { text: a.name, id: a.id };
          });
        });
      }, 600);
    }
  },
  computed: {
    filteredItems() {
      return this.autocompleteItems.filter(i => {
        return i.text.toLowerCase().indexOf(this.tag.toLowerCase()) !== -1;
      });
    }
  }
};
</script>