const tabGroups = Object.groupBy(
  Array.from(document.querySelectorAll("[role='tab']")).map((tab) => [
    tab,
    document.querySelector(`#${tab.getAttribute("aria-controls")}`),
  ]),
  ([tab]) => tab.parentElement.id
);

for (const tabs of Object.values(tabGroups)) {
  for (const [tab, tabpanel] of tabs) {
    tab.addEventListener("click", () => {
      tabs.forEach(([tab, panel]) => {
        tab.setAttribute("aria-selected", false);
        panel.hidden = true;
      });

      tab.setAttribute("aria-selected", true);
      tabpanel.hidden = false;
    });
  }
}
