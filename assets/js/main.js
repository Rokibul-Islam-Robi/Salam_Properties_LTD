document.addEventListener('DOMContentLoaded', () => {
  const nav = document.querySelector('#mainNav');
  nav.querySelectorAll('a[href^="#"]:not([data-bs-toggle])').forEach(link => {
    link.addEventListener('click', () => {
      if (window.innerWidth < 992) bootstrap.Collapse.getOrCreateInstance(nav, {toggle: false}).hide();
    });
  });
  const back = document.querySelector('.back-to-top');
  const updateScroll = () => back.classList.toggle('visible', window.scrollY > 650);
  window.addEventListener('scroll', updateScroll, {passive: true});
  updateScroll();
  const dialog = document.querySelector('.preview-dialog');
  const picture = dialog.querySelector('img');
  // document.querySelectorAll('[data-preview]').forEach(button => {
  //   button.addEventListener('click', () => {
  //     dialog.querySelector('h3').textContent = button.dataset.preview;
  //     picture.src = 'assets/images/' + button.dataset.image;
  //     picture.alt = button.dataset.preview;
  //     picture.hidden = false;
  //     dialog.querySelector('.dialog-note').textContent = button.classList.contains('watch-pill')
  //       ? 'Our landmark projects. Replace this image preview with your own video when integrating the template.' : '';
  //     dialog.showModal();
  //   });
  // });
  // document.querySelectorAll('[data-policy]').forEach(link => {
  //   link.addEventListener('click', event => {
  //     event.preventDefault();
  //     dialog.querySelector('h3').textContent = link.dataset.policy;
  //     picture.hidden = true;
  //     dialog.querySelector('.dialog-note').textContent = 'Add your company’s ' + link.dataset.policy.toLowerCase() + ' here before publishing.';
  //     dialog.showModal();
  //   });
  // });
  dialog.querySelector('.dialog-close').addEventListener('click', () => dialog.close());
  dialog.addEventListener('click', event => {
    const rect = dialog.getBoundingClientRect();
    if (event.clientX < rect.left || event.clientX > rect.right || event.clientY < rect.top || event.clientY > rect.bottom) dialog.close();
  });
  document.querySelector('.enquiry-form').addEventListener('submit', event => {
    event.preventDefault();
    const status = event.currentTarget.querySelector('.form-status');
    status.hidden = false;
    status.textContent = 'This is a template preview. Connect the form to your email service or backend to receive enquiries.';
  });
});



