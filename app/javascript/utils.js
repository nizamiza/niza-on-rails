export function querySelectIcons(element) {
  const icons = {};

  element.querySelectorAll(`[class*="icon-"]`).forEach((icon) => {
    const name = Array.from(icon.classList)
      .find((cls) => cls.startsWith("icon-"))
      ?.replace("icon-", "");

    if (name) {
      icons[name] = icon;
    }
  });

  return icons;
}    
