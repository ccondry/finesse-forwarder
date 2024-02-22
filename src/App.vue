<template>
  <div
  style="display: flex; justify-content: center; flex-direction: column; align-items: center; height: 100vh;"
  >
    <div style="display: flex; flex-direction: column; gap: 1rem;">
      <!-- datacenter -->
      <div>
        <strong>Datacenter:</strong>
        &nbsp;
        <select v-model="form.datacenter" style="background-color: var(--color-background);">
          <option
          v-for="option of options"
          :key="option.value"
          :value="option.value"
          >
            {{ option.label }}
          </option>
        </select>
      </div>

      <!-- Session ID -->
      <div>
        <strong>Session ID:</strong>
        &nbsp;
        <input type="text" v-model="form.sessionId" />
      </div>

      <!-- Submit button -->
      <div style="display: flex; justify-content: center;">
        <button @click="submit">
          Go to VPN-less Finesse Desktop
        </button>
      </div>
    </div>

    <div v-show="error" style="color: red;">
      <strong>Error:</strong> {{ error }}
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      form: {
        datacenter: 'RTP',
        sessionId: '',
      },
      options: [
        {value: 'RTP', label: 'RTP'},
        {value: 'SJC', label: 'SJC'},
        {value: 'LON', label: 'LON'},
        {value: 'SNG', label: 'SNG'},
        {value: 'SYD', label: 'SYD'},
      ],
      error: null,
    }
  },

  methods: {
    async submit (e) {
      e.preventDefault();
      try {
        const url = `https://mm.cxdemo.net/api/v1/datacenters/${this.form.datacenter}/sessions/${this.form.sessionId}`;
        const options = {};
        const response = await fetch(url, options);
        if (response.ok) {
          const json = await response.json();
          window.location = `https://${json.dns3}:8445/desktop/`
        } else {
          this.error = await response.text();
        }
      } catch (e) {
        console.log(e);
      }
    },
  },
}
</script>