<script>
    let body = document.getElementsByTagName("body")[0];
    let image_path = body.className == "dark" ? "dark" : "light";

    const toggle_darkmode = () => {
        let body = document.getElementsByTagName("body")[0];

        if (body.className == "dark") {
            body.className = "";
            image_path = "light";
            localStorage.setItem("display_mode", "light");
        } else {
            body.className = "dark";
            image_path = "dark";
            localStorage.setItem("display_mode", "dark");
        }
    }
</script>

<button id="darkmode-toggle" on:click={toggle_darkmode}>
    <img class="darkmode-toggle-image" src={`${image_path}.svg`} alt />
</button>

<style>
    #darkmode-toggle {
        position: fixed;
        top: 7.25px;
        left: 0;
        border: 0;
        background-color: unset;
    }

    #darkmode-toggle:hover {
        background-color: rgba(0, 0, 0, 0.1);
    }

    .darkmode-toggle-image {
        display: block;
        width: 25px;
        height: 25px;
    }
</style>
