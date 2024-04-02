const demoResultTabpanels = Array.from(
  document.querySelectorAll(`[role="tabpanel"][id$="-result"]`)
);

function resolveCodeBlockTag(lang) {
  switch (lang) {
    case "html":
      return "div";
    case "css":
      return "style";
    case "javascript":
    case "js":
      return "script";
    default:
      return "pre";
  }
}

function initDemoResultTabpanels() {
  for (const panel of demoResultTabpanels) {
    const panelCode = panel.querySelector("pre");

    if (panel.innerHTML.trim() && panelCode.dataset.content?.trim()) {
      continue;
    }

    panel.innerHTML = "<p>Loading...</p>";

    const demoId = panel.id.replace("-result", "");
    const otherPanels = panel.parentElement.querySelectorAll(
      `[role="tabpanel"][id^="${demoId}"]:not([id$="-result"])`
    );

    const codeBlocks = [];

    for (const otherPanel of otherPanels) {
      const lang = otherPanel.id.replace(`${demoId}-`, "");
      const tag = resolveCodeBlockTag(lang);

      const element = document.createElement(tag);

      const code =
        otherPanel.querySelector("[data-content]")?.dataset.content || "";

      element.innerHTML = code;
      codeBlocks.push(element);
    }

    panel.innerHTML = "";
    panel.append(...codeBlocks);
  }
}

initDemoResultTabpanels();
