export function loadDynamicPNG(imageName) {
    try {
        const imageUrl = new URL(`/src/assets/${imageName}`, import.meta.url).href;
        return imageUrl;
    } catch (error) {
        console.error(`PNG error: ${imageName}`, error);
        return null;
    }
}

export default loadDynamicPNG;