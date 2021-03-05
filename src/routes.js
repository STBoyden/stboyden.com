import Home from './routes/Home.svelte';
import NotFound from './routes/NotFound.svelte';
import Contact from './routes/Contact.svelte';
import Projects from './routes/Projects.svelte';

export default {
    '/': Home,
    '/contact_me': Contact,
    '/projects': Projects,
    // The catch-all route must always be last
    '*': NotFound
};
