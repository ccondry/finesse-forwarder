import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import Field from './components/Field.vue'
import Message from './components/Message.vue'

createApp(App).mount('#app')
app.component('Field', Field)
app.component('Message', Message)
