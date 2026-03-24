$content = Get-Content "c:\Users\BE1\Desktop\HENYCO FF\HENYCO\contact.html" -Raw

$oldSocialsExact = '(?s)<div style="margin-top: 30px;">\s*<div style="margin-bottom: 25px(.*?)</p>\s*</div>\s*</div>\s*</div>'

$newSocials = '<div class="contact-big-icons">
                    <a href="mailto:contact@henyco.com" title="Email"><img src="ICONS/MAIL.webp" alt="Email"></a>
                    <a href="https://wa.me/21620669007" title="WhatsApp"><img src="ICONS/WHATSAPP.webp" alt="WhatsApp"></a>
                    <a href="https://www.linkedin.com/company/henyco" target="_blank" title="LinkedIn"><img src="ICONS/LINKEDIN.webp" alt="LinkedIn"></a>
                    <a href="https://x.com/henyco" target="_blank" title="X (Twitter)"><img src="ICONS/X.webp" alt="X"></a>
                </div>'
$content = $content -replace $oldSocialsExact, $newSocials

$oldForm = '(?s)<form class="minimal-form" style="margin-top: 30px;">\s*<div class="form-group">\s*<input type="text" placeholder="Nom complet">\s*</div>\s*<div class="form-group">\s*<input type="email" placeholder="Email professionnel">\s*</div>\s*<div class="form-group">\s*<textarea placeholder="Votre message" rows="5"></textarea>\s*</div>\s*<button type="submit" class="btn-primary" style="width: fit-content;">Envoyer la demande</button>\s*</form>'

$newForm = '<form class="minimal-form" action="https://formsubmit.co/contact@henyco.com" method="POST" style="margin-top: 30px;">
                    <input type="hidden" name="_captcha" value="false">
                    <input type="hidden" name="_subject" value="Nouvelle demande de contact HENYCO">
                    <input type="hidden" name="_next" value="https://henyco.com/contact.html">
                    <div class="form-group">
                        <input type="text" name="name" placeholder="Nom complet" required>
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" placeholder="Email professionnel" required>
                    </div>
                    <div class="form-group">
                        <input type="text" name="subject" placeholder="Sujet" required>
                    </div>
                    <div class="form-group">
                        <textarea name="message" placeholder="Votre message" rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn-primary form-submit-btn">Envoyer la demande</button>
                </form>'

$content = $content -replace $oldForm, $newForm

Set-Content -Path "c:\Users\BE1\Desktop\HENYCO FF\HENYCO\contact.html" -Value $content -NoNewline
