import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["element", "ball"]

    themeToggle() {
        this.element.classList.toggle("dark-theme")
        console.log(this.element.classList.contains("transition-effect"))
    }
}
