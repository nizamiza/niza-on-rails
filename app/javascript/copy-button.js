import { querySelectIcons } from "utils";

export function initCopyButtons() {
  for (const button of document.querySelectorAll(".copy-button")) {
    const icons = querySelectIcons(button);

    if (!Object.keys(icons).length) {
      console.error("Could not find some icons.");
      continue;
    }

    toggleAriaHidden(true, icons.alert, icons.check);

    button.addEventListener("click", async function () {
      let copyText = this.dataset.text?.trim();

      const selector = copyText.match(/^:selector\((.+)\)$/)?.[1];

      if (selector) {
        const target = document.querySelector(selector);
        copyText =
          target?.dataset.content?.trim() || target?.textContent?.trim();
      }

      if (!copyText) {
        return;
      }

      try {
        await navigator.clipboard.writeText(copyText);
        setAriaHiddenToggleTimeout(icons.clipboard, icons.check);
      } catch (error) {
        console.error(error);
        setAriaHiddenToggleTimeout(icons.clipboard, icons.alert);
      }
    });
  }
}

function toggleAriaHidden(force, ...elements) {
  for (const element of elements) {
    element.setAttribute("aria-hidden", force ? "true" : "false");
  }
}

function setAriaHiddenToggleTimeout(elementToShow, ...elementsToHide) {
  toggleAriaHidden(true, elementToShow);
  toggleAriaHidden(false, ...elementsToHide);

  setTimeout(() => {
    toggleAriaHidden(false, elementToShow);
    toggleAriaHidden(true, ...elementsToHide);
  }, 3000);
}
