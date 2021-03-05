<script>
    import Router from "svelte-spa-router";
    import Navbar from "./components/Navbar.svelte";
    import routes from "./routes";
</script>

<Navbar />
<main>
    <Router {routes} />
</main>

<style>
    main {
        text-align: center;
        margin: 15vh auto 0;
    }

    @media (max-width: 640px) {
        main {
            margin: 5vh 0 0;
            max-width: none;
        }
    }
</style>
