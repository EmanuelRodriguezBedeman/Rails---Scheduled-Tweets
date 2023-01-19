import { Controller } from "@hotwired/stimulus"

const osThemeDark = matchMedia("(prefers-color-scheme: dark)").matches;

export default class extends Controller {
    static targets = ["element", "ball"]

    connect() {
        let preferenceTheme = localStorage.getItem("preferenceTheme")

        if ((preferenceTheme === "dark") || (preferenceTheme === null && osThemeDark)) {
            this.element.classList.add("dark-theme")

            this.changeTheme("dark", "1.5")

        } else if (preferenceTheme === "light" || osThemeDark === false) {
            this.element.classList.remove("dark-theme")

            this.changeTheme("light", "0")
        }
    }

    themeToggle() {
        this.element.classList.toggle("dark-theme")
        
        let preferenceTheme = localStorage.getItem("preferenceTheme")
    
        if (this.element.classList.contains("transition-effect") === false) {
            this.element.classList.add("transition-effect")
        }
    
        if (preferenceTheme === "dark") {
            this.changeTheme("light", "0")
        } else if (preferenceTheme === "light") {
            this.changeTheme("dark", "1.5")
        }
    }

    changeTheme(theme, switchPosition) {
        localStorage.setItem("preferenceTheme", theme)

        ball.style.transform = `translateX(${switchPosition}rem)`
    }
}