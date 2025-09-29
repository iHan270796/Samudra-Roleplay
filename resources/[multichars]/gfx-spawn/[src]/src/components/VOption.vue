<template>
    <div class="option" @click="handleClick">
        <div class="name">
            <span class="icon" v-if="option.house">
                <i class="fas fa-home"></i>
            </span>
            <span class="icon" v-else>
                <i class="fas fa-map-marker-alt"></i>
            </span>
            <slot name="name"></slot>
        </div>
        <div class="time">
            <slot name="time"></slot>
        </div>
        <inline-svg :src="bgIcon" v-if="!option.title" />
    </div>
</template>

<script>
import loadDynamicPNG from '../utils/imageLoader';

export default {
    name: 'VOption',
    emits: ['click'],
    props: {
        option: {
            type: Object,
            required: true
        },
        selected: {
            type: Number,
            required: true
        }
    },
    data: () => ({
        theme: new URLSearchParams(window.location.search).get('theme') || 'neon',
    }),
    computed: {
        bgIcon() {
            return loadDynamicPNG(`icons/${this.theme}-item-bg.svg`);
        }
    },
    methods: {
        handleClick() {
            this.$emit('change', this.option);
        }
    }
}
</script>