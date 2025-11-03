<script lang="ts">
    import { linear } from 'svelte/easing';
    import { tweened } from 'svelte/motion';

    export let displayOutline: boolean = true;
    export let height: number = 50;
    export let innerColor: string = "#212121";
    export let innerColorOpacity: number = 1;
    export let outlineColor: string = "red";
    export let outlineColorOpacity: number = 0.4;
    export let progressColor: string = "red";
    export let progressValue: number = 100;
    export let ringSize: number = 4;
    export let rotateDegree: number = 0;
    export let translateX: number = 0;
    export let translateY: number = 0;
    export let width: number = 50;
    export let maxLengthDisplay: number = 100;
    export let maxProgressValue: number = 100;
    export let showInnerBG: boolean = false;
    export let displayNumber: number = 0;
    export let text: string = "";
    export let gears: number = 8; // Number of gears

    let radius: number = 25;
    let transposeValue: number = progressValue / maxProgressValue * 100;

    const progressTween = tweened(transposeValue, {
        duration: 200,
        easing: linear,
    });

    const displayNumberTween = tweened(displayNumber, {
        duration: 600,
        easing: linear,
    });

    $: {
        progressValue = Math.min(progressValue, maxProgressValue);
        transposeValue = progressValue / maxProgressValue * 100;
        progressTween.set(transposeValue);
    }

    $: displayNumberTween.set(displayNumber);

    let normalizedRadius: number = radius - ringSize / 2;
    let circumference: number = normalizedRadius * 2 * Math.PI;
    let strokeDashoffset: number = circumference - ($progressTween / 100) * circumference;

    $: radius = height > width ? height / 2 : width / 2;
    $: {
        normalizedRadius = radius - ringSize / 2;
        circumference = normalizedRadius * 2 * Math.PI;
    }
    $: {
        strokeDashoffset = circumference - ($progressTween / (100 / maxLengthDisplay)) / 100 * circumference;
    }

    // Gear line logic
    const polarToCartesian = (centerX: number, centerY: number, radius: number, angleInDegrees: number) => {
        const angleInRadians = ((angleInDegrees - 90) * Math.PI) / 180.0;
        return {
            x: centerX + radius * Math.cos(angleInRadians),
            y: centerY + radius * Math.sin(angleInRadians),
        };
    };

    const createGearLine = (centerX: number, centerY: number, innerRadius: number, outerRadius: number, angle: number) => {
        const inner = polarToCartesian(centerX, centerY, innerRadius, angle);
        const outer = polarToCartesian(centerX, centerY, outerRadius, angle);
        return `M ${inner.x} ${inner.y} L ${outer.x} ${outer.y}`;
    };

    const gearLines = [...Array(gears)].map((_, i) => {
        const angle = -120 + (i * 240) / (gears - 1);
        const textPosition = polarToCartesian(radius, radius, radius - 6, angle); // Increase radius offset for text
        return { angle, textPosition };
    });

    // ...existing code...


</script>

<svg
    width="100%"
    height="100%"
    viewBox="0 0 {radius * 2} {radius * 2}"
    overflow="visible"
    style="transform: perspective(450px) rotateY(-2.5deg);"
>
    <g
        transform="
        {rotateDegree > 0 ? 'rotate(' + rotateDegree + ' ' + radius + ' ' + radius + ')' : ''}
        {'translate(' + translateX + ' ' + translateY + ')'}"
    >
        {#if displayOutline}
            <circle
                opacity={outlineColorOpacity}
                fill="transparent"
                stroke={outlineColor}
                stroke-dashoffset={circumference - (maxLengthDisplay / 100) * circumference}
                stroke-dasharray={circumference + ' ' + circumference}
                stroke-width={ringSize}
                r={normalizedRadius}
                cx={radius}
                cy={radius}
                transform="rotate(-90, {radius}, {radius})"
            />
        {/if}
        {#if showInnerBG}
            <circle
                fill={innerColor}
                fill-opacity={innerColorOpacity}
                stroke="transparent"
                stroke-dashoffset={0}
                stroke-dasharray={circumference + ' ' + circumference}
                stroke-width={ringSize - 0.6}
                r={normalizedRadius - ringSize / 2 + 0.1}
                cx={radius}
                cy={radius}
                transform="rotate(-90, {radius}, {radius})"
            />
        {/if}
        <circle
            stroke="{progressColor}"
            fill="transparent"
            stroke-dashoffset={strokeDashoffset}
            stroke-dasharray={circumference + ' ' + circumference}
            stroke-width={ringSize}
            r={normalizedRadius}
            cx={radius}
            cy={radius}
            transform="rotate(-90, {radius}, {radius})"
            style="filter: drop-shadow(0 0 0.1vh {progressColor});"
        />
    </g>

    <!-- Gear Lines -->
    <g transform="translate(0, 0) scale(1.0)"> <!-- Apply transformations only to gear lines -->
        {#each gearLines as { angle, textPosition }, i}
            <g>
                <!-- Use custom radii for each gear line -->
                <path
                    d={createGearLine(
                        radius,
                        radius,
                        radius - 4.5, 
                        radius + 1.5,
                        angle
                    )}
                    stroke="#dee2e6"
                    stroke-width="1.05"
                    opacity="1"
                    stroke-linecap="round"
                />
            </g>
        {/each}
    </g>

<!-- Text (Numbers) -->
<g transform="translate(2, 3) scale(1.10)"> <!-- No transformations applied to the text -->
    {#each gearLines as { angle, textPosition }, i}
        <text
            x={textPosition.x}
            y={textPosition.y}
            text-anchor="middle"
            alignment-baseline="middle"
            fill="white"
            font-size="4"
            font-weight="bold"
        >
            {i}
        </text>
    {/each}
</g>

    {#if text}
        <text class="vehicle-number" x="50%" y="45%" dominant-baseline="middle" text-anchor="middle">
            {Math.floor($displayNumberTween)}
        </text>
        <text class="vehicle-text" x="50%" y="70%" dominant-baseline="middle" text-anchor="middle">
            {text}
        </text>
    {/if}
</svg>

<style>
    .vehicle-number {
        font-family: 'Akshar';
        font-size: 2vh;
        fill: rgba(255, 255, 255, 0.9);
    }

    .vehicle-text {
        font-family: 'Akshar';
        font-size: 0.95vh;
        fill: rgba(255, 255, 255, 0.75);
    }
</style>