<script lang="ts">
    import { onMount } from 'svelte';
    import { fade } from 'svelte/transition';
    import { STATS } from '@stores/stores';
    import { ReceiveEvent } from '@utils/eventsHandlers';
    import { IsVehicleHudVisible } from '@stores/stores';
    let visible: boolean = false;
    let showcrosshair: boolean = false;
    let health: number = 47;
    let armor: number = 10;
    let talking: boolean = false;
    let talkingOnRadio: boolean = false;
    let onRadio: boolean = false;
    let onPhone: boolean = false;
    let audioRange: number = 0;
    let stats: {[key:string]: number} = {
        hunger: 90,
        thirst: 50,
        stress: 10,
        oxygen: 100,
    }
    let statOrder: Array<string> = ['hunger', 'thirst', 'stress','oxygen']
    let ammoShowing: boolean = false;
    let ammoInClip: number = 1;
    let ammoAvailable: number = 14;
    let ammoType: number = 1;
    let isReloading: boolean = false;
    ReceiveEvent('updateStats', (data: {showing: boolean, health: number, armor: number, isTalking: boolean, talkingOnRadio: boolean, onRadio: boolean, onPhone: boolean, voiceRange: number, stats: {[key:string]: number}} ): void =>{
        visible = data.showing;
        health = data.health;
        armor = data.armor;
        talking = data.isTalking;
        talkingOnRadio = data.talkingOnRadio;
        onRadio = data.onRadio;
        onPhone = data.onPhone;
        audioRange = data.voiceRange;
        stats = data.stats;
    });

    ReceiveEvent('crosshair', (data: {showing: boolean} ): void =>{
        showcrosshair = data.showing;
    });

    let vehicleHudVisible = false;

    onMount(() => {
      window.addEventListener("message", function (e) {
        let ed = e.data
        if (ed.action == "UpdateAmmo") {
          if (ed.data.event === "ammoUpdate") {
            ammoShowing = ed.data.showing
            if (ed.data.showing == false) { return }
            ammoInClip = ed.data.ammo.inClip
            ammoAvailable = ed.data.ammo.available
            ammoType = ed.data.ammo.type
            isReloading = ed.data.ammo.isReloading
          }
        }
      })

    const unsubscribe = IsVehicleHudVisible.subscribe(value => {
        vehicleHudVisible = value;
    });

    return () => unsubscribe();
  });
</script>
{#if (visible)}


  
    <div 
    class="crosshair-wrapper" 
    style="display: {showcrosshair ? 'flex' : 'none'};">
    <img src="crosshair.png" alt="Crosshair" class="crosshair">
    </div>

    <div class="leftDiv" transition:fade={{ duration: 100 }}>
        <div class="barsWrapper">
            <div class="wasteWrapper">
                {#if (armor > 0)}
                    <div class="barWrapper">
                        <i class="fa-solid fa-shield icon"></i>
                        <span class="barTxt" style="color: #2489db;">{armor}</span>
                        <div class="armorBarWrapper">
                            <div class="armorBarBase">
                                <div class="armorBarPill"></div>
                                <div class="armorBarPill"></div>
                                <div class="armorBarPill"></div>
                                <div class="armorBarPill"></div>
                                <div class="armorBarPill"></div>
                            </div>
                            <div class="armorBar" style="width: {armor}%;">
                                <div class="armorBarBase">
                                    <div class="armorBarPill" style="background-color: #2489db; box-shadow: 0 0 0.5vh #2489db; "></div>
                                    <div class="armorBarPill" style="background-color: #2489db; box-shadow: 0 0 0.5vh #2489db; "></div>
                                    <div class="armorBarPill" style="background-color: #2489db; box-shadow: 0 0 0.5vh #2489db; "></div>
                                    <div class="armorBarPill" style="background-color: #2489db; box-shadow: 0 0 0.5vh #2489db; "></div>
                                    <div class="armorBarPill" style="background-color: #2489db; box-shadow: 0 0 0.5vh #2489db; "></div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if}
                <div class="barWrapper">
                    <i class="fa-solid fa-heart icon" style="{health==0 && 'color:red;'}"></i>
                    <span class="barTxt" style="{health==0 && 'color:red;'}">{health}</span>
                    <div class="barBase" style="{health==0 && 'box-shadow: 0 0 1vh red;'}">
                        <div class="healthbar" style="width:{health}%"></div>
                    </div>
                </div>
                <div class="statWrapper">
                    {#each statOrder as stat}
                        {#if (stats[stat] && $STATS[stat] && $STATS[stat].hide != stats[stat])}
                            <div class="stat">
                                <div class="statBarBase">
                                    <div class="statBar" style="height:{stats[stat]}%; background-color: {$STATS[stat].color}; box-shadow: 0 0 0.5vh {$STATS[stat].color};"></div>
                                </div>
                                <i class="fa-light fa-{$STATS[stat].icon} barIcon"></i>
                            </div>
                        {/if}
                    {/each}
                </div>
            </div>
        </div>
    </div>
    {#if (ammoShowing)} 
    <div class="ammo-wrapper" style="gap: {ammoType === 0 ? '0.7rem' : '0.8rem'}; right: {vehicleHudVisible === false ? '13rem' : '35rem'}">
        {#if (ammoType === 1)}
        <img src="long.svg" alt="Ammo Icon (3 Bullets)">
        {:else if (ammoType === 0)}
        <img src="short.svg" alt="Ammo Icon (3 Bullets)">
        {/if}
     <div class="col">
         {#if (isReloading)}
         <span class="large gray">0</span>
         {:else if (!isReloading)}
         <span class="large">{ammoInClip}</span>
         {/if}
         <span class="sm">{ammoAvailable}</span>
     </div>
  </div>
    {/if}
    {#if (onPhone)}
        <i class="fa-regular fa-phone talkingIcon"></i>
    {:else if (onRadio)}
        <i class="fa-regular fa-walkie-talkie talkingIcon"></i>
    {/if}
    <div class="rightDiv" transition:fade={{ duration: 100 }}>
        <div class="audioBarsWrapper">
            {#each Array(7) as _, index (index)}
                <div class="audioBar {talkingOnRadio?'audioRadio': talking && 'audioTalking'}" style="{audioRange == 1?'max-height: 50%':audioRange==2&&'max-height: 70%'}"></div>
            {/each}
        </div>
        <div class="audioRangWrapper">
            {#each Array(3) as _, index (index)}
                <div class="{audioRange<index+1?'audioRangeBar':'audioBarActive'}"></div>
            {/each}
        </div>
    </div>
{/if}

<style>
   :root {
        --green: #87da21;
        --white-faded: hsla(0, 0%, 100%, 0.5);
        --font-primary: Geist, sans-serif;
    }

        /* CROSSHAIR */
    .crosshair-wrapper {
      position: absolute;
      top: 50.3%;
      left: 50%;
      transform: translateY(-50%) translateX(-50%);
      display: none;
    }
    
    .crosshair {
      opacity: 100%;
      width: 3.9vh;
      height: 3.3vh;
    }

    .ammo-wrapper {
        position: absolute;
        bottom: 4vh;
        right: 6vw;
        display: flex;
        align-items: center;
        transform: perspective(450px) rotateY(-2.5deg); /* Add the 3D transformation here */
        /*transform: perspective(1200px) rotateX(5deg) rotateY(-5deg) rotateZ(0deg) scale(1);*/
        transform-origin: center center; 
        
    }

    .ammo-wrapper img {
        width: 4rem;
        height: 6rem;
    }

    .ammo-wrapper .col {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 2.5rem;
    }

    .ammo-wrapper .col .large {
        color: var(--green);
        text-shadow: 0 5px 5px rgba(135, 218, 33, 0.25), 
                        0 5px 20px rgba(135, 218, 33, 0.35);
        font-family: var(--font-primary);
        font-size: 2.5rem;
        font-weight: 700;
        line-height: 1;
    }

    .ammo-wrapper .col .large.gray {
        color: var(--white-faded);
        text-shadow: none;
    }

    .ammo-wrapper .col .sm {
        color: var(--white-faded);
        font-family: var(--font-primary);
        font-size: 2rem;
        font-weight: 400;
    }

    .talkingIcon {
        position: absolute;
        bottom: 12vh;
        right: 5vh;
        font-size:  3vh;
        color: yellowgreen;
        text-shadow: 0 0 2px yellowgreen;
    }
    .audioRangeBar {
        border: 1px solid rgba(165, 165, 165, 0.582);
        background-color: rgba(39, 39, 39, 0.664);
        box-shadow: 0 0 2px rgba(39, 39, 39, 0.664);
        border-radius: 0.1vh;
    }
    .audioBarActive {
        background-color: yellowgreen;
        box-shadow: 0 0 2px yellowgreen;
        border-radius: 0.1vh;
    }
    .audioRangWrapper {
        position: absolute;
        bottom: 2vh;
        right: 5vh;
        width: 5vh;
        height: 0.5vh;
        display: grid;
        grid-template-columns: repeat(3, auto);
        gap: 0.5vh;
    }
    .audioBar {
        display: block;
        position: relative;
        height: 20%;
        width: 5px;
        border-radius: 0.1vh;
        background-color: rgba(39, 39, 39, 0.664);
        box-shadow: 0 0 2px rgba(39, 39, 39, 0.664);
    }
    .audioTalking {
        background-color: yellowgreen;
        box-shadow: 0 0 2px yellowgreen;
        animation: audioPlaying 1s linear infinite;
    }
    .audioRadio {
        background-color: #2489db;
        box-shadow: 0 0 2px #2489db;
        animation: audioPlaying 1s linear infinite;
    }
    .audioBarsWrapper {
        position: absolute;
        bottom: 3.5vh;
        right: 5vh;
        width: 52px;
        height: 50px;
        display: flex;
        gap: 4px;
        align-items: center;
    }
    .barIcon {
        position: absolute;
        font-size: 2vh;
        right: 0vh;
        width: 3.2vh;
        top: 0.5vh;
        text-align: center;
    }
    .statBar {
        position: absolute;
        bottom: 0vh;
        width: 100%;
        height: 50%;
        background-color: rgb(139, 91, 252);
        box-shadow: 0 0 0.5vh rgb(139, 91, 252);
    }
    .statBarBase {
        position: absolute;
        width: 0.4vh;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6);
    }
    .stat {
        position: relative;
        height: 3vh;
    }
    .statWrapper {
        position: absolute;
        top: 50%;
        left: 29vh;
        width: 17vh;
        height: auto;
        transform: translateY(-50%);
        display: grid;
        grid-template-columns: repeat(4, auto);
        gap: 0.5vh;
    }
    .barWrapper {
        position: relative;
    }
    .icon {
        color: rgba(255, 255, 255, 0.815);
    }
    .barTxt {
        position: absolute;
        top: 0vh;
        left: 2vh;
        color: #92db24;
        text-shadow: 1px 1px black;
    }
    .barBase {
        position: absolute;
        top: 0.8vh;
        right: 0vh;
        width: 23vh;
        height: 0.75vh;
        background-color: rgba(0, 0, 0, 0.6);
        border-radius: 0.2vh;
    }
    .healthbar {
        position: relative;
        height: 100%;
        background-color: #92db24;
        box-shadow: 0 0 0.5vh #92db24;
        transition: 200ms;
    }
    .armorBar {
        position: relative;
        height: 100%;
        overflow: hidden;
        transition: 200ms;
    }
    .armorBarWrapper {
        position: absolute;
        top: 0.9vh;
        right: 0vh;
        width: 23vh;
        height: 0.5vh;
    }
    .armorBarBase {
        position: absolute;
        height: 100%;
        width: 23vh;
        display: grid;
        grid-template-columns: repeat(5, auto);
        gap: 0.5vh;
    }
    .armorBarPill {
        border-radius: 0.5vh;
        background-color: rgba(0, 0, 0, 0.6);
    }
    .wasteWrapper {
        position: absolute;
        top: 0vh;
        left: 0vh;
        width: 100%;
        height: auto;
    }
    .barsWrapper {
        position: absolute;
        bottom: 4vh;
        left: 5vh;
        width: 28vh;
        height: auto;
    }
    .leftDiv {
        position: absolute;
        top: 5vh;
        left: 0vh;
        width: 50%;
        height: 90%;
        transform: perspective(450px) rotateY(2.5deg);
    }
    .rightDiv {
        position: absolute;
        top: 5vh;
        right: 0vh;
        width: 50%;
        height: 90%;
        transform: perspective(450px) rotateY(-2.5deg);
    }
    @keyframes audioPlaying {
        0%{
            height: 20%;
        }
        50%{
            height: 100%;
        }
        100%{
            height: 20%;
        }
    }
    .audioBar:nth-child(2){
        animation-delay: 0.6s;
    }
    .audioBar:nth-child(3){
        animation-delay: 0.4s;
    }
    .audioBar:nth-child(4){
        animation-delay: 0.5s;
    }
    .audioBar:nth-child(5){
        animation-delay: 0.8s;
    }
    .audioBar:nth-child(6){
        animation-delay: 0.3s;
    }

</style>