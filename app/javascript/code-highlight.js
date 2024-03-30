function composeUrl(path) {
  return new URL(`/npm:highlight.js@11.9.0${path}`, "https://ga.jspm.io");
}

const { default: hljs } = await import(composeUrl("/lib/core.js"));

["xml", "css", "javascript"].map(async (lang) => {
  const { default: highlight } = await import(
    composeUrl(`/lib/languages/${lang}.js`)
  );
  
  hljs.registerLanguage(lang, highlight);

  document.querySelectorAll(`[data-lang="${lang}"]`).forEach((block) => {
    const content = block.dataset.content?.trim();
    const hl = hljs.highlight(content, { language: lang }).value;

    block.innerHTML = hl;
  });
});
