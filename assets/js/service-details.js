document.addEventListener("DOMContentLoaded", function () {
  var menuBtn = document.getElementById("menuBtn");
  var mobileNav = document.getElementById("mobileNav");

  if (menuBtn && mobileNav) {
    menuBtn.addEventListener("click", function () {
      var open = mobileNav.classList.toggle("open");
      menuBtn.setAttribute("aria-expanded", String(open));
      menuBtn.innerHTML = open
        ? '<i class="bi bi-x-lg"></i>'
        : '<i class="bi bi-list"></i>';
    });

    mobileNav.querySelectorAll("a").forEach(function (link) {
      link.addEventListener("click", function () {
        mobileNav.classList.remove("open");
        menuBtn.setAttribute("aria-expanded", "false");
        menuBtn.innerHTML = '<i class="bi bi-list"></i>';
      });
    });
  }

  var faqBtns = document.querySelectorAll(".sd-faq-q");
  if (faqBtns.length && !faqBtns[0].dataset.faqBound) {
    faqBtns.forEach(function (btn) {
      btn.dataset.faqBound = "1";
      btn.addEventListener("click", function () {
        var item = btn.closest(".sd-faq-item");
        if (!item) return;
        var willOpen = !item.classList.contains("open");
        document.querySelectorAll(".sd-faq-item.open").forEach(function (other) {
          if (other !== item) {
            other.classList.remove("open");
            var otherBtn = other.querySelector(".sd-faq-q");
            if (otherBtn) otherBtn.setAttribute("aria-expanded", "false");
          }
        });
        item.classList.toggle("open", willOpen);
        btn.setAttribute("aria-expanded", String(willOpen));
      });
    });
  }
});
