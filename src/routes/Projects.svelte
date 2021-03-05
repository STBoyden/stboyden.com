<script>
    import ProjectCard from "../components/ProjectCard.svelte";

    let projects = [
        {
            project_name: "Ocean",
            project_link: "https://github.com/STBoyden/ocean",
            description:
                "A C/C++ build system/project manager written in Rust.",
            picture_url:
                "https://raw.githubusercontent.com/STBoyden/ocean/master/logo.svg",
        },
        {
            project_name: "stboyden.com",
            project_link: "https://github.com/STBoyden/stboyden.com",
            description: "Personal website written in Svelte + JS.",
        },
        {
            project_name: "market-api",
            project_link: "https://github.com/MinesoftCC/market-api",
            description:
                "Market API for an Minecraft-ComputerCraft based economy. Intended to be used in conjunction with <a href='https://github.com/MinesoftCC/CCash'>this</a>. Written in Rust.",
        },
        {
            project_name: "market-dashboard",
            project_link: "https://github.com/MinesoftCC/market-dashboard",
            description:
                "A front-end for the market API created by me. Designed to work alongside the bank API developed by EntireTwix. Written in Rust.",
        },
    ];
</script>

<div id="projects">
    <h1>Projects</h1>
    {#each projects as project}
        <ProjectCard {...project} delay={750 * projects.indexOf(project) + 1} />
    {/each}
</div>

<style>
    #projects {
        margin-top: 5vh;
    }

    @media (max-width: 640px) {
        #projects {
            padding: 10px;
        }
    }
</style>
