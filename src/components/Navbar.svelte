<ul id="navbar">
    <li class="navbutton"><a href="#/">Home</a></li>
    <li class="navbutton">
        <a href="#/projects">Projects</a>
    </li>
    <li class="navbutton">
        <a href="#/contact_me">Contact Me</a>
    </li>
</ul>

<style>
    #navbar {
        display: inline-block;
        width: 100vw;
        padding: 0;
        margin: 0;
        background-color: #333;
    }

    .navbutton {
        display: inline-block;
        list-style-type: none;
        padding: 1em;
        background-color: #333;
        margin: 0;
    }

    .navbutton:hover {
        background-color: #555;
    }

    .navbutton a {
        color: white;
    }

    @media (max-width: 640px) {
        #navbar {
            display: none;
        }
    }
</style>
