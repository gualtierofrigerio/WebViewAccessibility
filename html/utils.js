function fontSizeChanged(size) {
    console.log("font changed size = " + size);
    var pixelSize = size + "px";
    document.documentElement.style.setProperty("font-size", pixelSize);
}
