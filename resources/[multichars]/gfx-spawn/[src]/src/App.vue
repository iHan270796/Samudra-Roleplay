<script>
import VOptionList from './components/VOptionList.vue'
import loadDynamicPNG from './utils/imageLoader';
import { post } from './utils/fivemApi';
export default {
    name: 'App',
    components: {
        VOptionList
    },

    data: () => ({
        options: [],
        show: new URLSearchParams(window.location.search).get('spawn') == 'true',
        theme: new URLSearchParams(window.location.search).get('theme') || 'neon',

        lastCursor: null,
        locale: {
            title_busstop: "SELECT BUS STOP",
            title_apartment: "SELECT APARTMENT",
            station: "STATION",
            time: "TIME",
            select_location: "SELECT LOCATION",
        },
        isApartmentSelection: false
    }),

    computed: {
        background() {
            return loadDynamicPNG(`backgrounds/${this.theme}-bg.png`);
        },
        busIcon() {
            if (this.isApartmentSelection) {
                return loadDynamicPNG(`icons/apartment.svg`);
            }
            return loadDynamicPNG(`icons/${this.theme}-bus.svg`);
        }
    },

    mounted() {
        if (this.show) {
            document.addEventListener('mouseover', function (e) {
                var cursor = getComputedStyle(e.target).cursor;
                if (cursor !== this.lastCursor) {
                    this.lastCursor = cursor;
                    post('setCursor', { cursor });
                }
            });

            post('getLocations', {}).then(data => {
                if (data.apartments && data.apartments.length > 0) {
                    data.locations = data.apartments;
                    this.isApartmentSelection = true;
                } else {
                    this.isApartmentSelection = false;
                }
                this.options = data.locations.sort((a, b) => {
                    if (a.id === "lastlocation") return -1;
                    if (b.id === "lastlocation") return 1;
                    return a.time - b.time;
                }).map((location, index) => {
                    return {
                        id: location.id,
                        name: location.name,
                        time: location.time + ' ' + data.unit,
                        house: location.house,
                    }
                });

                this.locale = data.locale;

            });
        }
    },

    methods: {
        onSelect(data) {
            post('spawn', data);
        }
    }
}
</script>

<template>
    <div :class="['bus-sign', `theme-${theme}`]" v-if="show" :style="{ backgroundImage: 'url(' + background + ')' }">
        <VOptionList :options="options" @select="onSelect" :locale="locale">
            <template v-slot:title>
                <div class="logo">
                    <inline-svg :src="busIcon" />
                </div>
                <h1> {{ isApartmentSelection ? locale.title_apartment : locale.title_busstop }}
                </h1>
            </template>
        </VOptionList>
    </div>
</template>