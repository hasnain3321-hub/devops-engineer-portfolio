document.getElementById('year').textContent = new Date().getFullYear();
const themeButton = document.getElementById('theme');
themeButton.addEventListener('click', () => {
  const isLight = document.body.classList.toggle('light');
  themeButton.textContent = isLight ? '☾' : '☀';
  themeButton.setAttribute('aria-label', isLight ? 'Switch to dark theme' : 'Switch to light theme');
});
