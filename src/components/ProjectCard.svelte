<script>
    import { fade } from "svelte/transition";

    export let project_name;
    export let project_link;
    export let description;
    export let delay = 500;
    export let picture_url = "";
</script>

<div in:fade={{ delay }} class="card">
    <div class="card-inner" on:click={(document.location = project_link)}>
        {#if picture_url != ""}
            <img src={picture_url} alt="" />
            <h2>{project_name} found <a href={project_link}>here</a>.</h2>
            <p>{@html description}</p>
        {:else}
            <h2 class="no-img">
                {project_name} found <a href={project_link}>here</a>.
            </h2>
            <p class="no-img">{@html description}</p>
        {/if}
    </div>
</div>

<style>
    .card {
        display: block;
        max-width: 50%;
        margin: 20px auto;
        padding: 10px;
        box-shadow: 2px 2px 5px 5px #999;
        background-color: #eee;
        cursor: pointer;
    }

    .card:hover {
        background-color: #ddd;
    }

    .card-inner {
        display: grid;
        width: 100%;
        height: 100%;
        text-align: left;
        grid-column-gap: 10px;
        grid-template-columns: min-content auto auto;
    }

    .card-inner * {
        display: inline-block;
        grid-column-start: 2;
        grid-column-end: 4;
    }

    .card-inner img {
        max-width: 150px;
        grid-column: 1;
        grid-row-start: 1;
        grid-row-end: 3;
    }

    .card-inner .no-img {
        grid-column-start: 1;
    }

    @media (max-width: 640px) {
        .card {
            max-width: 100vw;
            margin: 20px 0;
        }

        .card-inner {
            text-align: center;
        }

        .card-inner img {
            max-width: 100px;
            min-height: 100%;
            grid-column: 1;
            grid-row: 1;
        }

        .card-inner h2 {
            grid-column-start: 2;
            grid-column-end: 4;
        }

        .card-inner p {
            grid-column-start: 1;
            grid-column-end: 4;
        }
    }
</style>
