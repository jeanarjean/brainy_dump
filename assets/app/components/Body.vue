<template>
  <div class="body-container">
    <div class="body-content">
        <router-view></router-view>
    </div>
  </div>
</template>

<script>
export default {
  name: "body-container"
};
</script>
<style lang="scss" scoped>
.body-container {
  margin-top: 50px;
  background-color: white;
  height: 70vh;
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2),
    0 1px 5px 0 rgba(0, 0, 0, 0.12);
  overflow: scroll;
}

.body-content {
  margin-left: 20px;
  margin-top: 20px;
  height: 70vh;
}
</style>

