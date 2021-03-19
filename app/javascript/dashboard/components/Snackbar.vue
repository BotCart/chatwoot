<template>
  <div>
    <div v-if="newMessage" class="ui-snackbar">
      <div class="ui-snackbar-text">
        {{ newMessage }}
        <a v-if="showButton" @click="fullMessage(message)">
          read the rest
        </a>
        <a v-if="showCloseButton" @click="clearMessage()">
          close
        </a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    message: String,
    showButton: Boolean,
    duration: {
      type: [String, Number],
      default: 3000,
    },
  },
  data() {
    return {
      showCloseButton: false,
      toggleAfterTimeout: true,
      newMessage: this.message,
    };
  },
  mounted() {
    this.truncateMessage(this.message);
  },
  methods: {
    truncateMessage(str, num = 80) {
      if (str.length > num) {
        this.showButton = true;
        this.newMessage = str.slice(0, num) + '...';
      } else {
        this.showButton = false;
        this.newMessage = str;
      }
    },
    fullMessage(str) {
      this.newMessage = str;
      this.showButton = false;
      this.showCloseButton = true;
    },
    clearMessage() {
      this.newMessage = '';
      this.showCloseButton = false;
    },
  },
};
</script>
