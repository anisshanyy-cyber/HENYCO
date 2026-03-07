let currentLang = 'fr';
let translations = {};

async function loadTranslations() {
    try {
        const response = await fetch('translations.json');
        translations = await response.json();
        applyTranslations();
    } catch (error) {
        console.error('Error loading translations:', error);
    }
}

function applyTranslations() {
    const elements = document.querySelectorAll('[data-i18n]');
    elements.forEach(el => {
        const key = el.getAttribute('data-i18n');
        if (translations[currentLang] && translations[currentLang][key]) {
            el.innerText = translations[currentLang][key];
        }
    });
}

function toggleLanguage() {
    currentLang = currentLang === 'fr' ? 'en' : 'fr';
    const switchBtn = document.querySelector('.lang-switch');
    if (switchBtn) {
        switchBtn.innerText = currentLang === 'fr' ? 'EN' : 'FR';
    }
    applyTranslations();
}

// Initial load
document.addEventListener('DOMContentLoaded', () => {
    loadTranslations();

    // Global Scroll Reveal Animation
    const observerOptions = {
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, observerOptions);

    document.querySelectorAll('.fade-in').forEach(el => {
        observer.observe(el);
    });
});
