import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["element", "ball"]

    themeToggle() {
    
        this.element.classList.toggle("dark-theme")
        
        let preferenceTheme = localStorage.getItem("preferenceTheme")
    
        if (this.element.classList.contains("transition-effect") === false) {
            this.element.classList.add("transition-effect")
        }
    
        if (preferenceTheme === "dark") {
            localStorage.setItem("preferenceTheme", "light")

            ball.style.transform = `translateX(0rem)`
        } else if (preferenceTheme === "light") {
            localStorage.setItem("preferenceTheme", "dark")

            ball.style.transform = `translateX(1.5rem)`
        }
    }
}