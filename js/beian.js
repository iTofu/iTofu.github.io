(() => {
  'use strict';

  const container = document.getElementById('site-beian');
  if (!container) return;

  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 5000);

  fetch('https://api.leoxv.com/web/beian', {
    credentials: 'omit',
    cache: 'no-store',
    signal: controller.signal
  })
    .then(response => {
      if (!response.ok) throw new Error('Unavailable');
      return response.json();
    })
    .then(data => {
      if (controller.signal.aborted || !data || data.show !== true ||
          typeof data.text !== 'string' || !data.text.trim() ||
          data.url !== 'https://beian.miit.gov.cn/') return;

      const link = document.createElement('a');
      link.href = data.url;
      link.textContent = data.text;
      link.target = '_blank';
      link.rel = 'noopener noreferrer';
      container.replaceChildren(link);
      container.hidden = false;
    })
    .catch(() => {})
    .finally(() => clearTimeout(timeout));
})();
