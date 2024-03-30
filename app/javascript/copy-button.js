function toggleAriaHidden(element, force) {
  element.setAttribute("aria-hidden", force ? "true" : "false");
}

function setIconToggleTimeout(iconToShow, timeout, ...iconsToHide) {
  setTimeout(() => {
    toggleAriaHidden(iconToShow, false);

    for (const icon of iconsToHide) {
      toggleAriaHidden(icon, true);
    }
  }, timeout);
}

export function initCopyButtons() {
  for (const button of document.querySelectorAll(".copy-button")) {
    const alertIcon = button.querySelector(".icon-alert");
    const checkIcon = button.querySelector(".icon-check");
    const clipboardIcon = button.querySelector(".icon-clipboard");

    if (!alertIcon || !checkIcon || !clipboardIcon) {
      console.error("Could not find some icons.");
      continue;
    }

    toggleAriaHidden(alertIcon, true);
    toggleAriaHidden(checkIcon, true);

    button.addEventListener("click", async function () {
      let copyText = this.dataset.text?.trim();

      const selector = copyText.match(/^:selector\((.+)\)$/)?.[1];

      if (selector) {
        const target = document.querySelector(selector);
        copyText = target?.dataset.content?.trim() || target?.textContent?.trim();
      }

      if (!copyText) {
        return;
      }

      try {
        await navigator.clipboard.writeText(copyText);

        toggleAriaHidden(checkIcon, false);
        toggleAriaHidden(clipboardIcon, true);

        setTimeout(() => {
          toggleAriaHidden(checkIcon, true);
          toggleAriaHidden(clipboardIcon, false);
        }, 3000);

        setIconToggleTimeout(clipboardIcon, 3000, checkIcon);
      } catch (error) {
        console.error(error);

        toggleAriaHidden(alertIcon, false);
        toggleAriaHidden(checkIcon, true);
        toggleAriaHidden(clipboardIcon, true);

        setIconToggleTimeout(clipboardIcon, 3000, alertIcon);
      }
    });
  }
}
