const osThemeDark = matchMedia("(prefers-color-scheme: dark)").matches;
const element = $("body");
let preferenceTheme = localStorage.getItem("preferenceTheme");

if (preferenceTheme === null && osThemeDark || preferenceTheme === "dark") {
    changeTheme("dark", "1.5");
} else {
    changeTheme("light", "0");
};

function themeToggle() {

    element.toggleClass("dark-theme");

    let preferenceTheme = localStorage.getItem("preferenceTheme");

    if (element.hasClass("transition-effect") === false) {
        element.addClass("transition-effect");
    };
 
    if (preferenceTheme === "dark") {
        changeTheme("light", "0");
    } else if (preferenceTheme === "light" || osThemeDark != true) {
        changeTheme("dark", "1.5");
    };
};

function changeTheme(theme, switchPosition) {
    $("#ball").css('transform',`translateX(${switchPosition}rem)`);
    localStorage.setItem("preferenceTheme", theme);

    if (theme === "dark") {
        element.addClass("dark-theme");
    } else {
        element.removeClass("dark-theme");
    }
};

export {themeToggle, changeTheme};