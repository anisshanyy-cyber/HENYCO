$files = Get-ChildItem -Filter *.html
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw

    # 1. Update Logo in Nav
    $content = $content -replace '(?s)<div class="logo">\s*<a href="index\.html">\s*<img src="henyco logo\.webp" alt="HENYCO Logo">\s*</a>\s*</div>', '<div class="logo">
            <a href="index.html">
                <img src="henyco logo.webp" alt="HENYCO Logo" class="desktop-logo">
                <img src="LOGOMOB.webp" alt="HENYCO Logo" class="mobile-logo">
            </a>
        </div>'

    # 1b. Alternative in case there was no newline in logo <a>
    $content = $content -replace '(?s)<div class="logo">\s*<a href="index\.html"><img src="henyco logo\.webp" alt="HENYCO Logo"></a>\s*</div>', '<div class="logo">
            <a href="index.html">
                <img src="henyco logo.webp" alt="HENYCO Logo" class="desktop-logo">
                <img src="LOGOMOB.webp" alt="HENYCO Logo" class="mobile-logo">
            </a>
        </div>'

    # 2. Update Footer Logo and Text
    $content = $content -replace '(?s)<div class="footer-expertise">\s*<div class="footer-logo">\s*<a href="index\.html"><img src="henyco logo\.webp" alt="HENYCO Logo"></a>\s*</div>\s*<p>L''expertise qui réchauffe vos performances, l''IA qui refroidit vos délais\.</p>\s*</div>', '<div class="footer-expertise">
                <div class="footer-logo">
                    <a href="index.html"><img src="footer-logo.webp" alt="HENYCO Logo"></a>
                </div>
            </div>'

    # 3. Update Socials
    $content = $content -replace '(?s)<h4>Contact & Réseaux</h4>\s*<div class="footer-links">\s*<a href="mailto:contact@henyco\.com">Email</a>\s*<a href="https://wa\.me/21620669007">WhatsApp</a>\s*<a href="https://www\.linkedin\.com/company/henyco" target="_blank">LinkedIn</a>\s*<a href="https://x\.com/henyco" target="_blank">X \(Twitter\)</a>\s*</div>', '<h4>Contact & Réseaux</h4>
                <div class="social-icons-wrapper">
                    <a href="mailto:contact@henyco.com"><img src="ICONS/MAIL.webp" alt="Email"></a>
                    <a href="https://wa.me/21620669007"><img src="ICONS/WHATSAPP.webp" alt="WhatsApp"></a>
                    <a href="https://www.linkedin.com/company/henyco" target="_blank"><img src="ICONS/LINKEDIN.webp" alt="LinkedIn"></a>
                    <a href="https://x.com/henyco" target="_blank"><img src="ICONS/X.webp" alt="X"></a>
                </div>'

    # Socials Alternative (if missing one link or spacing differs)
    $content = $content -replace '(?s)<h4>Contact &amp; Réseaux</h4>\s*<div class="footer-links">\s*<a href="mailto:contact@henyco\.com">Email</a>\s*<a href="https://wa\.me/21620669007">WhatsApp</a>\s*<a href="https://www\.linkedin\.com/company/henyco" target="_blank">LinkedIn</a>\s*<a href="https://x\.com/henyco" target="_blank">X \(Twitter\)</a>\s*</div>', '<h4>Contact & Réseaux</h4>
                <div class="social-icons-wrapper">
                    <a href="mailto:contact@henyco.com"><img src="ICONS/MAIL.webp" alt="Email"></a>
                    <a href="https://wa.me/21620669007"><img src="ICONS/WHATSAPP.webp" alt="WhatsApp"></a>
                    <a href="https://www.linkedin.com/company/henyco" target="_blank"><img src="ICONS/LINKEDIN.webp" alt="LinkedIn"></a>
                    <a href="https://x.com/henyco" target="_blank"><img src="ICONS/X.webp" alt="X"></a>
                </div>'

    Set-Content -Path $file.FullName -Value $content -NoNewline
}
