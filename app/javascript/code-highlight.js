async function init() {
  function hljsUrl(path) {
    return new URL(`/npm:highlight.js@11.9.0${path}`, "https://ga.jspm.io");
  }

  const { default: hljs } = await import(hljsUrl("/lib/core.js"));

  const codeBlocks = document.querySelectorAll(":is(code, pre)[data-lang]");

  for (const block of codeBlocks) {
    const { content, lang } = block.dataset;
    const code = content?.trim() || block.textContent.trim();

    if (!code) {
      continue;
    }

    const { default: highlight } = await import(
      hljsUrl(`/lib/languages/${lang}.js`)
    );

    hljs.registerLanguage(lang, highlight);

    block.innerHTML = hljs.highlight(code, { language: lang }).value;
  }
}

init();
