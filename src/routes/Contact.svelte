<script>
    import { fade } from "svelte/transition";

    let details = {
        Email: "<a href='mailto:sam@stboyden.com'>sam@stboyden.com</a>",
        Phone: "+44 7581 750711",
    };
    let keys = [...Object.keys(details)];
</script>

<div id="contact" in:fade={{ delay: 100 }}>
    <h3>You can contact me through these methods</h3>
    {#each keys as k}
        <h2
            in:fade={{
                delay: 500 * keys.indexOf(k),
            }}
        >
            {k}: {@html details[k]}
        </h2>
    {/each}
</div>

<style>
    @media (max-width: 640px) {
        #contact {
            padding: 10px;
        }
    }
</style>
