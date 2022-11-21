import { Controller } from "@hotwired/stimulus"

function changeTheme(theme, switchPosition) {
    this.ball.style.transform = `translateX(${switchPosition}rem)`

    localStorage.setItem("preferenceTheme", theme)
}

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

            
        } else if (preferenceTheme === "light") {
            localStorage.setItem("preferenceTheme", "dark")

            
        }
    }
    
}