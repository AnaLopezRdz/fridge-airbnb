// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import 'bootstrap';

import * as bootstrap from 'bootstrap';
window.bootstrap = bootstrap;
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))//ismael
