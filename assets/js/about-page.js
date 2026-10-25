(() => {
  'use strict';
  const menuBtn = document.getElementById('menuBtn');
  const mobileNav = document.getElementById('mobileNav');
  menuBtn?.addEventListener('click', () => {
    const open = mobileNav.classList.toggle('open');
    menuBtn.setAttribute('aria-expanded', String(open));
    menuBtn.innerHTML = open ? '<i class="bi bi-x-lg"></i>' : '<i class="bi bi-list"></i>';
  });
  mobileNav?.querySelectorAll('a').forEach(a => a.addEventListener('click', () => {
    mobileNav.classList.remove('open');
    menuBtn?.setAttribute('aria-expanded','false');
    if(menuBtn) menuBtn.innerHTML = '<i class="bi bi-list"></i>';
  }));

  const searchPanel = document.getElementById('searchPanel');
  const searchToggle = document.querySelector('.search-toggle');
  const closeSearch = document.getElementById('closeSearch');
  searchToggle?.addEventListener('click', () => { searchPanel.classList.add('open'); searchPanel.querySelector('input')?.focus(); });
  closeSearch?.addEventListener('click', () => searchPanel.classList.remove('open'));
  searchPanel?.addEventListener('click', e => { if(e.target === searchPanel) searchPanel.classList.remove('open'); });
  document.addEventListener('keydown', e => { if(e.key === 'Escape') searchPanel?.classList.remove('open'); });

  const hero = document.querySelector('.hero');
  const heroImages = ['assets/images/h1_bg-1.jpg','assets/images/h1_bg.jpg'];
  let heroIndex = 0;
  function setHero(index){ heroIndex = (index + heroImages.length) % heroImages.length; hero.style.backgroundImage = `url('${heroImages[heroIndex]}')`; }
  document.getElementById('prevHero')?.addEventListener('click', () => setHero(heroIndex - 1));
  document.getElementById('nextHero')?.addEventListener('click', () => setHero(heroIndex + 1));

  const testimonials = [
    {img:'assets/images/avatar-1.jpg',quote:'“Spaciaz turned our vision into reality. Their team was professional, creative and always responsive. We couldn’t be happier with the result!”',name:'Sarah Khan',role:'Homeowner, Dhaka'},
    {img:'assets/images/avatar-2.jpg',quote:'“The entire process felt simple and organized. The design team listened carefully and delivered a space that feels exactly like us.”',name:'James Miller',role:'Property Owner, Dhaka'},
    {img:'assets/images/avatar-3.jpg',quote:'“Excellent communication, thoughtful design and strong attention to detail. I would gladly recommend Spaciaz for a premium project.”',name:'Ayesha Rahman',role:'Business Owner, Dhaka'}
  ];
  let testIndex = 0;
  const renderTest = () => { const t=testimonials[testIndex]; document.getElementById('testAvatar').src=t.img; document.getElementById('testQuote').textContent=t.quote; document.getElementById('testName').textContent=t.name; document.getElementById('testRole').textContent=t.role; document.querySelectorAll('#testDots button').forEach((b,i)=>b.classList.toggle('active',i===testIndex)); };
  const changeTest = dir => { testIndex=(testIndex+dir+testimonials.length)%testimonials.length; renderTest(); };
  document.getElementById('prevTest')?.addEventListener('click',()=>changeTest(-1));
  document.getElementById('nextTest')?.addEventListener('click',()=>changeTest(1));
  document.querySelectorAll('#testDots button').forEach((b,i)=>b.addEventListener('click',()=>{testIndex=i;renderTest();}));
})();
