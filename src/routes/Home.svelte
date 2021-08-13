<script>
    import { fade, fly } from "svelte/transition";
</script>

<div id="home" in:fade={{ delay: 100 }}>
    <div in:fade out:fade={{ delay: 100, duration: 0 }}>
        <h1
            style="font-family: 'monospace'"
            in:fly={{ y: 200, duration: 2000 }}
            out:fade={{ delay: 0, duration: 0 }}
        >
            Hi, I'm Samuel Boyden
        </h1>
        <h3 in:fly={{ y: 200, duration: 2000 }} out:fade={{ duration: 0 }}>
            I am a hobbyist software developer from the United Kingdom.
        </h3>
    </div>
    <div class="body" in:fade={{ delay: 2250 }} out:fade={{ duration: 0 }}>
        <p>
            Ever since primary school, I've been interested in computers and how
            they work. I've always been curious with the inner workings of
            everything from the operating system to the website.
        </p>
        <p>
            My primary programming language is Rust, but I have experience with
            Node, C#, C++ and Python, as well as some front-end frameworks such
            as React and Svelte.
        </p>
    </div>
    <div class="body" in:fade={{ delay: 3000 }} out:fade={{ duration: 0 }}>
        <p>
            You can check out the <a href="#/projects">projects page</a> for some
            of my Git projects.
        </p>
        <p>Additionally, you can view my work on these profiles:</p>
        <ul>
            <li>Self-hosted Gitea: <a href="https://git.stboyden.com">here</a></li>
            <li>Github: <a href="https://github.com/STBoyden">here</a></li>
            <li>Gitlab: <a href="https://gitlab.com/STBoyden">here</a></li>
        </ul>
    </div>
    <div class="body" in:fade={{ delay: 4000 }} out:fade={{ duration: 0 }}>
        You can request my CV by using one of the options <a href="#/contact_me"
            >here</a
        >.
    </div>
    <br />
    <div class="body" in:fade={{ delay: 5000 }} out:fade={{ duration: 0 }}>
        The source code of this website can be found <a
            href="https://git.stboyden.com/STBoyden/stboyden.com">here</a
        >.
    </div>
    <br />
    <div class="body" in:fade={{ delay: 6000 }} out:fade={{ duration: 0 }}>
        If you're feeling generous, feel free to donate to my Liberapay page
        profile <a href="https://liberapay.com/STBoyden">here</a>.
    </div>
</div>

<style>
    .body {
        display: block;
        text-align: justify;
        font-size: large;
        max-width: 50%;
        margin: 0 auto;
    }

    @media (max-width: 850px) {
        #home {
            padding: 10px;
        }
        .body {
            max-width: unset;
            margin: 0 0;
            text-align: left;
        }
    }
</style>
