<script lang="ts">
    import { fade } from 'svelte/transition';
    import { ReceiveEvent } from '@utils/eventsHandlers';

    let direction: string = 'N';
    let roads: string = 'Strawberry Ave x Olympic Fwy';
    let zone: string = 'Strawberry';

    let showMiles: boolean = false; // Controls visibility of the miles marker
    let miles: number = 0; // Distance in miles

    // Listen for the `compasstick` event
    ReceiveEvent('compasstick', (data: { direction: string, roads: string, zone: string }): void => {
        direction = data.direction;
        roads = data.roads;
        zone = data.zone;
    });

    // Listen for the `milesmark` event
    ReceiveEvent('milesmark', (data: { show: boolean, distance: number }): void => {
        showMiles = data.show;
        miles = data.distance;
    });
</script>

<div class="wrapper" transition:fade={{ duration: 100 }}>
    <div class="keyWrapper">
        <i class="fa-regular fa-compass icon"></i> {direction}
    </div>
    <div class="keyWrapper">
        <i class="fa-regular fa-location-dot icon"></i> {roads}
    </div>
    <div class="keyWrapper">
        <i class="fa-regular fa-map icon"></i> {zone}
    </div>
</div>

<!-- Miles Marker -->
{#if showMiles}
    <div class="milesWrapper" transition:fade={{ duration: 100 }}>
        <i class="fa-regular fa-location-dot icon"></i> {miles.toFixed(2)} mi
    </div>
{/if}

<style>
    .wrapper {
        position: relative;
        top: 2vh;
        margin: auto;
        height: auto;
        width: fit-content;
        display: flex;
        gap: 1vh;
    }
    .icon {
        color: yellowgreen;
        margin-right: 0.5vh;
    }
    .keyWrapper {
        position: relative;
        width: fit-content;
        font-size: 1.6vh;
        font-weight: 600;
        padding: 0.5vh;
        padding-inline: 1.5vh;
        background-color: rgba(0, 0, 0, 0.6);
        box-shadow: 0 0 2px black;
        border-radius: 1vh;
    }
    .milesWrapper {
        position: absolute;
        bottom: 27.5vh; /* Slightly above the bottom of the screen */
        left: 3vh; /* Positioned on the left side */
        font-size: 1.6vh;
        font-weight: 600;
        padding: 0.5vh;
        padding-inline: 1.5vh;
        background-color: rgba(0, 0, 0, 0.6);
        box-shadow: 0 0 2px black;
        border-radius: 1vh;
        transform: perspective(450px) rotateY(2.5deg); /* Apply the leftDiv rotation */
        color: white;
        display: flex;
        align-items: center;
        gap: 0.5vh;
    }
</style>