<script>
    import Router from "svelte-spa-router";
    import Navbar from "./components/Navbar.svelte";
    import DarkmodeButton from './components/DarkmodeButton.svelte'
    import routes from "./routes";

    let body = document.getElementsByTagName("body")[0];

    body.className = localStorage.getItem("display_mode") || "light";
</script>

<Navbar />
<DarkmodeButton />
<main>
    <Router {routes} />
</main>

<style>
    main {
        text-align: center;
        margin: 15vh auto 0;
    }

    @media (max-width: 375px) {
        main {
            margin: 20vh 0 0;
            max-width: none;
        }
    }
</style>
