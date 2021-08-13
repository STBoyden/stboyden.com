<script>
    import { fade } from "svelte/transition";
    import SvelteTable from "svelte-table";
    import { Stretch } from "svelte-loading-spinners";

    let sort_by = "created_at";
    let sort_order = 1;


    const columns = [
        {
            key: "repo_name",
            title: "Repository",
            value: v => `<a class="table-link" href="${v.project_link}">${v.name}</a>`,
            sortable: true,
        },
        {
            key: "description",
            title: "Description",
            value: v => v.description,
        },
        {
            key: "language",
            title: "Language",
            value: v => v.language,
        },
        {
            key: "created_at",
            title: "Created at",
            value: v => new Date(v.created_at).toUTCString(),
            sortable: true,
        },
        {
            key: "updated_at",
            title: "Last updated",
            value: v => new Date(v.updated_at).toUTCString(),
            sortable: true,
        },
        {
            key: "open_issues",
            title: "Open issues",
            value: v => v.open_issues,
            sortable: true,
        },
        {
            key: "releases",
            title: "Releases",
            value: v => v.releases,
            sortable: true,
        },
        {
            key: "size",
            title: "Size (kb)",
            value: v => v.size,
            sortable: true,
        }
    ];

    async function get_data() {
        const url = "https://git.stboyden.com/api/v1";
        const repos_endpoint = "repos/search?uid=1";

        let projects = [];

        const response = await window.fetch(`${url}/${repos_endpoint}`, {
            method: "GET",
        });


        if (response.ok) {
            let json = await response.json();

            for (let i = 0; i < json.data.length; i++) {
                let language = "";
                let language_response = await window.fetch(
                    `${url}/repos/${json.data[i]["full_name"]}/languages`, 
                    { method: "GET" }
                );

                if (language_response.ok) { language = Object.keys(await language_response.json())[0] }

                projects.push({ 
                    full_name: json.data[i]["full_name"],
                    name: json.data[i]["name"],
                    project_link: json.data[i]["html_url"],
                    description: json.data[i]["description"] || "This repository has no description.",
                    created_at: json.data[i]["created_at"],
                    updated_at: json.data[i]["updated_at"],
                    open_issues: json.data[i]["open_issues_count"],
                    releases: json.data[i]["release_counter"],
                    size: json.data[i]["size"],
                    language
                });
            }

        }

        return projects;
    }

</script>

<div id="projects">
    <h1>Projects</h1>
    {#await get_data()}
        <p>Contacting git.stboyden.com...</p>
        <div style="align-content: center">
            <Stretch size="60" color="#ddd" unit="px" />
        </div>
    {:then projects} 
        <div class="container" in:fade={{ delay: 100 }} out:fade={{ duration: 0 }}>
            <p>
                You can click/tap on the name of the repository to be taken to the
                relevant repository page.
            </p>
            <p><i>
                Please note: Some of these dates are inaccurate. For example,
                project-triangle was created on the 14th May 2020, and was last
                updated 9th September 2020. The reason for these inaccuracies
                is that these repositories were originally mirrors of the
                Github repositories, but I have since moved the main repository
                for each to my Gitea instance, which then pushes any updates I
                make to GitHub as a sort of "backup".
            </i></p>
        </div>
        <div class="table-container" in:fade={{ delay: 250 }} out:fade={{ duration: 0 }}>
            <SvelteTable 
                bind:sortBy={sort_by}
                bind:sortOrder={sort_order}
                columns="{columns}" 
                rows="{projects}" 
                classNameTable={['table']}
                classNameThead={['table-primary']}
            />
        </div>
    {:catch}
        <p>Could not fetch data from git.stboyden.com.</p>
    {/await}

</div>

<style>
    #projects {
        padding: 10px;
        margin-top: 5vh;
    }

    .container p {
        margin: 5px auto;
        max-width: 50%;
    }

    :global(.table) {
        margin: 0 auto;
        max-width: 75%;
    }

    :global(.table *) {
        box-sizing: border-box;
    }

    :global(.table-link) {
        color: #333 !important;
    }

    :global(.table tbody tr:nth-child(odd)) {
        background-color: #ddd;
    }
   
    @media (max-width: 850px) {
        #projects {
            padding: 0 10px;
        }

        .table-container {
            overflow: scroll;
            max-height: 60vh;
        }

        .container {
            margin: 0;
            padding: 0 10px 0 0;
        }

        .container p {
            max-width: 100%;
            text-align: justify;
        }

        :global(.table) {
            margin: 0 auto;
        }
    }
</style>
