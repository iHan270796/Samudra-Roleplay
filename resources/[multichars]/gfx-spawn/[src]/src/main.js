import { createApp } from 'vue'
import './assets/style.css'
import App from './App.vue'
import InlineSvg from 'vue-inline-svg';
import './assets/spawn.scss';

const app = createApp(App);
app.component('inline-svg', InlineSvg);
app.mount('#app');