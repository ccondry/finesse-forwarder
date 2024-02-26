<template>
  <label v-if="label" :for="id">{{ label }}</label>
  <div class="field-content" :class="{ grouped }">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: 'Field',

  props: {
    label: {
      type: String,
      default () {
        return ''
      }
    },
    grouped: {
      type: Boolean,
      default: false
    }
  },

  computed: {
  }
}
</script>
