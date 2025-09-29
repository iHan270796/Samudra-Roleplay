<template>
    <div class="option-list">
        <div class="title">
            <slot name="title"></slot>
        </div>
        <div class="options" ref="options">
            <div class="option title" style="pointer-events: none;">
                <div class="name">
                    {{ locale.station }}
                </div>
                <div class="time">
                    {{ locale.time }}
                </div>
            </div>
            <VOption v-for="option, id in options" :key="id" :option="option" :selected="modelValue" @change="onChange">
                <template #name>{{ option.name }}</template>
                <template #time>{{ option?.time }}</template>
            </VOption>
        </div>
        <div class="footer">
            <div class="key">
                <inline-svg :src="buttonBackground" />
                <span>
                    LMB
                </span>
            </div>
            <span>
                {{ locale.select_location }}
            </span>
        </div>
    </div>
</template>

<script>
import VOption from './VOption.vue'
import loadDynamicPNG from '../utils/imageLoader';

export default {
    name: 'VOptionList',
    emits: ['update:modelValue', 'select'],
    components: {
        VOption
    },
    data: () => ({
        selected: 0,
        theme: new URLSearchParams(window.location.search).get('theme') || 'neon',

        scrollHandler: null
    }),
    props: {
        options: {
            type: Array,
            required: true
        },
        modelValue: {
            type: Number,
            required: true
        },
        locale: {
            type: Object,
            required: true
        }
    },
    methods: {
        onChange(e) {
            this.$emit('update:modelValue', e);
            this.$emit('select', e);
        }
    },
    computed: {
        buttonBackground() {
            return loadDynamicPNG(`icons/${this.theme}-button-bg.svg`);
        }
    },
    mounted() {
        this.scrollHandler = (e) => {
            const { data } = e;
            if (data.type === 'scroll') {
                if (data.direction === 'up') {
                    this.$refs.options.scrollTop -= 150;
                } else if (data.direction === 'down') {
                    this.$refs.options.scrollTop += 150;
                }
            }
        }
        window.addEventListener('message', this.scrollHandler);
    },

    beforeUnmount() {
        window.removeEventListener('message', this.scrollHandler);
    }
}
</script>