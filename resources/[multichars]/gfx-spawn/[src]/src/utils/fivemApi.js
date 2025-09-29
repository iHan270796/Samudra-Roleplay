let resourceName = "gfx-spawn";
resourceName = window.GetParentResourceName ? window.GetParentResourceName() : resourceName;
const post = (url, data) => {
    try {
        return fetch(`http://${resourceName}/${url}`, {
            method: "POST",
            body: JSON.stringify(data),
            headers: {
                "Content-Type": "application/json",
            },
        }).then((response) => response && response.json());
    } catch (error) {
        // console.log("post error", error);
    }
};

export { post };