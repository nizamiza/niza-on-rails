export function initDialogs() {
  const dialogs = document.querySelectorAll("dialog");

  document.addEventListener("click", ({ target }) => {
    if (!(target instanceof Element)) {
      return;
    }

    for (const dialog of dialogs) {
      if (!dialog.open) {
        continue;
      }

      const isOpening = Boolean(
        target.closest(`[aria-controls="${dialog.id}"]`)
      );

      if (!dialog.contains(target) && !isOpening) {
        dialog.close();
      }
    }
  });

  document.addEventListener("keydown", (event) => {
    if (event.key !== "Escape") {
      return;
    }

    for (const dialog of dialogs) {
      if (dialog.open) {
        dialog.close();
      }
    }
  });
}
