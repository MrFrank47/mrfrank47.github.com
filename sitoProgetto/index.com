<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pilot — Costruisci il tuo futuro</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Clash+Display:wght@400;500;600;700&family=Satoshi:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
:root {
  --teal: #3de8b0;
  --blue: #4a9eff;
  --green: #5bde85;
  --grad: linear-gradient(135deg, #4a9eff 0%, #3de8b0 100%);
  --grad-warm: linear-gradient(135deg, #ff8c42 0%, #ffcf5c 100%);
  --bg: #0a0c10;
  --surface: rgba(255,255,255,0.04);
  --border: rgba(255,255,255,0.08);
  --text: #f0f4ff;
  --muted: rgba(240,244,255,0.45);
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

html { scroll-behavior: smooth; }

body {
  background: var(--bg);
  color: var(--text);
  font-family: 'Satoshi', sans-serif;
  font-weight: 400;
  line-height: 1.6;
  overflow-x: hidden;
}

/* ─── NOISE TEXTURE ─── */
body::before {
  content: '';
  position: fixed; inset: 0;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.03'/%3E%3C/svg%3E");
  pointer-events: none; z-index: 0;
}

/* ─── GLOW ORBS ─── */
.orb {
  position: fixed;
  border-radius: 50%;
  filter: blur(120px);
  pointer-events: none;
  z-index: 0;
  opacity: 0.18;
}
.orb1 { width: 600px; height: 600px; background: #4a9eff; top: -200px; left: -200px; }
.orb2 { width: 500px; height: 500px; background: #3de8b0; top: 40%; right: -200px; }
.orb3 { width: 400px; height: 400px; background: #ff8c42; bottom: 10%; left: 30%; opacity: 0.12; }

/* ─── TYPOGRAPHY ─── */
h1, h2, h3, h4 { font-family: 'Clash Display', sans-serif; line-height: 1.1; }

/* ─── NAV ─── */
nav {
  position: fixed; top: 0; left: 0; right: 0; z-index: 100;
  padding: 18px 40px;
  display: flex; align-items: center; justify-content: space-between;
  backdrop-filter: blur(20px);
  background: rgba(10,12,16,0.7);
  border-bottom: 1px solid var(--border);
}
.logo {
  font-family: 'Clash Display', sans-serif;
  font-size: 1.5rem;
  font-weight: 700;
  background: var(--grad);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
  letter-spacing: -0.5px;
}
.logo span { font-weight: 400; }
nav .cta-nav {
  background: var(--grad);
  color: #000;
  border: none;
  padding: 10px 24px;
  border-radius: 100px;
  font-family: 'Satoshi', sans-serif;
  font-weight: 700;
  font-size: 0.85rem;
  cursor: pointer;
  letter-spacing: 0.3px;
  transition: opacity 0.2s, transform 0.2s;
}
.cta-nav:hover { opacity: 0.85; transform: scale(1.03); }

/* ─── SECTIONS ─── */
section { position: relative; z-index: 1; }

/* ─── HERO ─── */
#hero {
  min-height: 100vh;
  display: flex; align-items: center;
  padding: 120px 40px 80px;
  max-width: 1200px;
  margin: 0 auto;
  gap: 60px;
}
.hero-left { flex: 1; max-width: 560px; }
.badge {
  display: inline-flex; align-items: center; gap: 8px;
  background: rgba(74,158,255,0.12);
  border: 1px solid rgba(74,158,255,0.3);
  border-radius: 100px;
  padding: 6px 16px;
  font-size: 0.8rem;
  font-weight: 600;
  color: var(--blue);
  margin-bottom: 28px;
  letter-spacing: 0.5px;
}
.hero-title {
  font-size: clamp(2.8rem, 5vw, 4.2rem);
  font-weight: 700;
  letter-spacing: -2px;
  margin-bottom: 20px;
  line-height: 1.05;
}
.hero-title .grad {
  background: var(--grad);
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
}
.hero-sub {
  color: var(--muted);
  font-size: 1.05rem;
  line-height: 1.7;
  margin-bottom: 36px;
  max-width: 460px;
}
.cta-group { display: flex; gap: 14px; flex-wrap: wrap; align-items: center; }
.btn-primary {
  background: var(--grad);
  color: #000;
  border: none;
  padding: 16px 32px;
  border-radius: 100px;
  font-family: 'Satoshi', sans-serif;
  font-weight: 700;
  font-size: 1rem;
  cursor: pointer;
  transition: opacity 0.2s, transform 0.2s, box-shadow 0.2s;
  box-shadow: 0 0 40px rgba(74,158,255,0.3);
}
.btn-primary:hover { opacity: 0.9; transform: translateY(-2px); box-shadow: 0 8px 50px rgba(74,158,255,0.4); }
.hero-note { color: var(--muted); font-size: 0.8rem; }
.hero-right {
  flex: 1;
  display: flex; justify-content: center; align-items: center;
  position: relative;
}
.phone-cluster {
  position: relative;
  width: 340px; height: 600px;
}
.phone-wrap {
  position: absolute;
  border-radius: 44px;
  overflow: hidden;
  box-shadow: 0 40px 100px rgba(0,0,0,0.6), 0 0 0 1px rgba(255,255,255,0.08);
}
.phone-wrap img { width: 100%; height: 100%; object-fit: cover; display: block; }
.phone-main {
  width: 220px;
  top: 20px; left: 50%;
  transform: translateX(-50%);
  z-index: 3;
  animation: float1 4s ease-in-out infinite;
}
.phone-side1 {
  width: 180px;
  top: 100px; left: -10px;
  z-index: 2;
  transform: rotate(-8deg);
  opacity: 0.75;
  animation: float2 4s ease-in-out infinite 0.5s;
}
.phone-side2 {
  width: 180px;
  top: 100px; right: -10px;
  z-index: 2;
  transform: rotate(8deg);
  opacity: 0.75;
  animation: float3 4s ease-in-out infinite 1s;
}
@keyframes float1 { 0%,100%{transform:translateX(-50%) translateY(0)} 50%{transform:translateX(-50%) translateY(-14px)} }
@keyframes float2 { 0%,100%{transform:rotate(-8deg) translateY(0)} 50%{transform:rotate(-8deg) translateY(-10px)} }
@keyframes float3 { 0%,100%{transform:rotate(8deg) translateY(0)} 50%{transform:rotate(8deg) translateY(-10px)} }

.glow-ring {
  position: absolute;
  width: 300px; height: 300px;
  border-radius: 50%;
  top: 50%; left: 50%;
  transform: translate(-50%, -50%);
  background: radial-gradient(circle, rgba(74,158,255,0.12) 0%, transparent 70%);
  z-index: 1;
}

/* ─── PROBLEM ─── */
#problem {
  padding: 100px 40px;
  max-width: 900px;
  margin: 0 auto;
  text-align: center;
}
.section-label {
  display: inline-block;
  font-size: 0.7rem;
  font-weight: 700;
  letter-spacing: 3px;
  text-transform: uppercase;
  color: var(--teal);
  margin-bottom: 16px;
}
.section-title {
  font-size: clamp(2rem, 4vw, 3rem);
  font-weight: 700;
  letter-spacing: -1.5px;
  margin-bottom: 20px;
}
.section-sub {
  color: var(--muted);
  font-size: 1.05rem;
  margin-bottom: 60px;
  max-width: 540px;
  margin-left: auto;
  margin-right: auto;
}
.pain-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 20px;
  margin-bottom: 50px;
}
.pain-card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 20px;
  padding: 28px 24px;
  text-align: left;
  backdrop-filter: blur(10px);
  transition: border-color 0.2s, transform 0.2s;
}
.pain-card:hover { border-color: rgba(74,158,255,0.3); transform: translateY(-4px); }
.pain-emoji { font-size: 2rem; margin-bottom: 14px; display: block; }
.pain-card h4 { font-size: 1rem; font-weight: 700; margin-bottom: 8px; }
.pain-card p { font-size: 0.88rem; color: var(--muted); line-height: 1.6; }
.resolution {
  background: linear-gradient(135deg, rgba(74,158,255,0.08), rgba(61,232,176,0.08));
  border: 1px solid rgba(61,232,176,0.25);
  border-radius: 20px;
  padding: 28px 32px;
  font-size: 1.05rem;
  font-weight: 500;
  color: var(--teal);
}

/* ─── HOW IT WORKS ─── */
#how {
  padding: 100px 40px;
  max-width: 1100px;
  margin: 0 auto;
}
#how .section-title, #how .section-label { text-align: center; display: block; }
#how .section-sub { text-align: center; }
.steps {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 24px;
  margin-top: 60px;
  position: relative;
}
.step-card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 24px;
  padding: 36px 30px;
  backdrop-filter: blur(10px);
  position: relative;
  overflow: hidden;
  transition: transform 0.2s;
}
.step-card:hover { transform: translateY(-6px); }
.step-num {
  font-family: 'Clash Display', sans-serif;
  font-size: 5rem;
  font-weight: 700;
  position: absolute;
  top: -10px; right: 20px;
  opacity: 0.05;
  line-height: 1;
}
.step-icon {
  width: 52px; height: 52px;
  border-radius: 16px;
  display: flex; align-items: center; justify-content: center;
  font-size: 1.5rem;
  margin-bottom: 20px;
}
.step-icon.blue { background: rgba(74,158,255,0.15); }
.step-icon.teal { background: rgba(61,232,176,0.15); }
.step-icon.green { background: rgba(91,222,133,0.15); }
.step-card h3 { font-size: 1.2rem; font-weight: 700; margin-bottom: 12px; letter-spacing: -0.5px; }
.step-card p { font-size: 0.9rem; color: var(--muted); line-height: 1.65; }

/* ─── FEATURES ─── */
#features {
  padding: 100px 40px;
  max-width: 1100px;
  margin: 0 auto;
}
#features .section-title, #features .section-label { text-align: center; display: block; }
#features .section-sub { text-align: center; }
.features-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px;
  margin-top: 60px;
}
@media(max-width:640px){ .features-grid { grid-template-columns: 1fr; } }
.feat-card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 24px;
  padding: 32px 28px;
  backdrop-filter: blur(10px);
  transition: border-color 0.25s, transform 0.25s;
}
.feat-card:hover { border-color: rgba(61,232,176,0.25); transform: translateY(-4px); }
.feat-card.wide { grid-column: span 2; }
@media(max-width:640px){ .feat-card.wide { grid-column: span 1; } }
.feat-emoji { font-size: 2rem; margin-bottom: 16px; display: block; }
.feat-card h3 { font-size: 1.05rem; font-weight: 700; margin-bottom: 10px; }
.feat-card p { font-size: 0.88rem; color: var(--muted); line-height: 1.65; }

/* ─── SCREENSHOTS CAROUSEL ─── */
#screens {
  padding: 80px 0 100px;
  overflow: hidden;
}
#screens .section-label, #screens .section-title { text-align: center; display: block; }
.screens-inner { padding: 0 40px; }
.screens-strip {
  display: flex;
  gap: 24px;
  margin-top: 50px;
  padding: 20px 40px 40px;
  overflow-x: auto;
  scrollbar-width: none;
  -webkit-overflow-scrolling: touch;
}
.screens-strip::-webkit-scrollbar { display: none; }
.screen-item {
  flex-shrink: 0;
  width: 200px;
  border-radius: 36px;
  overflow: hidden;
  box-shadow: 0 30px 80px rgba(0,0,0,0.5), 0 0 0 1px rgba(255,255,255,0.07);
  transition: transform 0.3s;
}
.screen-item:hover { transform: scale(1.05) translateY(-8px); }
.screen-item img { width: 100%; display: block; }

/* ─── TARGET ─── */
#target {
  padding: 100px 40px;
  max-width: 900px;
  margin: 0 auto;
  text-align: center;
}
.target-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 20px;
  margin-top: 50px;
}
.target-card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 20px;
  padding: 30px 22px;
  backdrop-filter: blur(10px);
  text-align: left;
  transition: border-color 0.2s, transform 0.2s;
}
.target-card:hover { border-color: rgba(74,158,255,0.3); transform: translateY(-4px); }
.target-emoji { font-size: 2rem; margin-bottom: 14px; display: block; }
.target-card h4 { font-size: 1rem; font-weight: 700; margin-bottom: 8px; }
.target-card p { font-size: 0.85rem; color: var(--muted); line-height: 1.6; }

/* ─── STATUS ─── */
#status {
  padding: 80px 40px;
  max-width: 700px;
  margin: 0 auto;
  text-align: center;
}
.status-pill {
  display: inline-flex; align-items: center; gap: 8px;
  background: rgba(91,222,133,0.1);
  border: 1px solid rgba(91,222,133,0.3);
  border-radius: 100px;
  padding: 8px 18px;
  font-size: 0.82rem;
  font-weight: 600;
  color: var(--green);
  margin-bottom: 24px;
}
.pulse {
  width: 8px; height: 8px;
  background: var(--green);
  border-radius: 50%;
  animation: pulse 1.5s ease-in-out infinite;
}
@keyframes pulse { 0%,100%{opacity:1;transform:scale(1)} 50%{opacity:0.5;transform:scale(1.4)} }
.status-text { color: var(--muted); font-size: 0.95rem; line-height: 1.7; }

/* ─── CTA FINAL ─── */
#cta {
  padding: 100px 40px 120px;
  text-align: center;
  max-width: 700px;
  margin: 0 auto;
}
#cta .section-title {
  font-size: clamp(2rem, 4vw, 3.2rem);
  margin-bottom: 16px;
}
#cta .section-sub { margin-bottom: 48px; }
.email-form {
  display: flex;
  gap: 12px;
  max-width: 480px;
  margin: 0 auto 20px;
}
@media(max-width: 500px){ .email-form { flex-direction: column; } }
.email-input {
  flex: 1;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 100px;
  padding: 16px 24px;
  color: var(--text);
  font-family: 'Satoshi', sans-serif;
  font-size: 0.95rem;
  outline: none;
  transition: border-color 0.2s;
}
.email-input::placeholder { color: var(--muted); }
.email-input:focus { border-color: var(--teal); }
.btn-waitlist {
  background: var(--grad);
  color: #000;
  border: none;
  padding: 16px 28px;
  border-radius: 100px;
  font-family: 'Satoshi', sans-serif;
  font-weight: 700;
  font-size: 0.95rem;
  cursor: pointer;
  white-space: nowrap;
  transition: opacity 0.2s, transform 0.2s;
  box-shadow: 0 0 40px rgba(61,232,176,0.25);
}
.btn-waitlist:hover { opacity: 0.88; transform: scale(1.03); }
.cta-bonus {
  font-size: 0.8rem;
  color: var(--muted);
}
.cta-bonus span { color: var(--teal); font-weight: 600; }

/* ─── PARTNERS ─── */
#partners {
  padding: 80px 40px;
  max-width: 900px;
  margin: 0 auto;
  text-align: center;
}
.partners-box {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: 24px;
  padding: 48px 40px;
  backdrop-filter: blur(10px);
}
.partners-box h2 { font-size: 1.5rem; margin-bottom: 16px; letter-spacing: -0.5px; }
.partners-box p { color: var(--muted); font-size: 0.92rem; line-height: 1.75; max-width: 600px; margin: 0 auto 28px; }
.partner-logos { display: flex; gap: 16px; flex-wrap: wrap; justify-content: center; }
.partner-chip {
  background: rgba(255,255,255,0.06);
  border: 1px solid rgba(255,255,255,0.1);
  border-radius: 100px;
  padding: 8px 18px;
  font-size: 0.82rem;
  font-weight: 600;
  color: var(--muted);
  transition: color 0.2s, border-color 0.2s;
}
.partner-chip:hover { color: var(--text); border-color: rgba(255,255,255,0.25); }

/* ─── FOOTER ─── */
footer {
  border-top: 1px solid var(--border);
  padding: 48px 40px;
  display: flex;
  flex-wrap: wrap;
  gap: 24px;
  align-items: center;
  justify-content: space-between;
  position: relative; z-index: 1;
}
.footer-left .logo { font-size: 1.2rem; }
.footer-copy { font-size: 0.82rem; color: var(--muted); margin-top: 6px; }
.footer-links { display: flex; gap: 24px; flex-wrap: wrap; }
.footer-links a {
  font-size: 0.82rem;
  color: var(--muted);
  text-decoration: none;
  transition: color 0.2s;
}
.footer-links a:hover { color: var(--text); }
.footer-contact { font-size: 0.82rem; color: var(--muted); }
.footer-contact a { color: var(--teal); text-decoration: none; }

/* ─── DIVIDER ─── */
.divider {
  width: 1px;
  height: 120px;
  background: linear-gradient(to bottom, transparent, var(--border), transparent);
  margin: 0 auto;
}

/* ─── ANIMATIONS ─── */
.fade-up {
  opacity: 0;
  transform: translateY(30px);
  transition: opacity 0.7s ease, transform 0.7s ease;
}
.fade-up.visible {
  opacity: 1;
  transform: translateY(0);
}

/* ─── SUCCESS MSG ─── */
.success-msg {
  display: none;
  color: var(--teal);
  font-size: 0.95rem;
  font-weight: 600;
  padding: 12px;
}
</style>
</head>
<body>

<div class="orb orb1"></div>
<div class="orb orb2"></div>
<div class="orb orb3"></div>

<!-- NAV -->
<nav>
  <div class="logo">Pilot<span>.</span></div>
  <button class="cta-nav" onclick="document.getElementById('cta').scrollIntoView({behavior:'smooth'})">Entra nella Waitlist →</button>
</nav>

<!-- HERO -->
<section id="hero">
  <div class="hero-left fade-up">
    <div class="badge">🚀 Il tuo navigatore personale per la carriera</div>
    <h1 class="hero-title">Costruisci il tuo<br><span class="grad">futuro</span>,<br>un passo alla volta.</h1>
    <p class="hero-sub">Pilot usa l'Intelligenza Artificiale avanzata per creare roadmap di carriera personalizzate: ti dice esattamente cosa studiare, per quanto tempo e dove trovare i corsi migliori per raggiungere il lavoro dei tuoi sogni.</p>
    <div class="cta-group">
      <button class="btn-primary" onclick="document.getElementById('cta').scrollIntoView({behavior:'smooth'})">Unisciti alla Waitlist</button>
      <span class="hero-note">🎁 1 mese Premium gratuito al lancio</span>
    </div>
  </div>
  <div class="hero-right fade-up" style="transition-delay:0.2s">
    <div class="glow-ring"></div>
    <div class="phone-cluster">
      <div class="phone-wrap phone-side1">
        <img src="/mnt/user-data/uploads/1780923910809_image.png" alt="Progress screen" onerror="this.style.background='linear-gradient(135deg,#1a2035,#0d1520)';this.style.minHeight='320px'">
      </div>
      <div class="phone-wrap phone-main">
        <img src="/mnt/user-data/uploads/1780923927112_image.png" alt="Discover screen" onerror="this.style.background='linear-gradient(135deg,#1a2035,#0d1520)';this.style.minHeight='400px'">
      </div>
      <div class="phone-wrap phone-side2">
        <img src="/mnt/user-data/uploads/1780923906629_image.png" alt="Roadmap screen" onerror="this.style.background='linear-gradient(135deg,#1a2035,#0d1520)';this.style.minHeight='320px'">
      </div>
    </div>
  </div>
</section>

<div class="divider"></div>

<!-- PROBLEM -->
<section id="problem">
  <div class="fade-up">
    <span class="section-label">Il Problema</span>
    <h2 class="section-title">Troppe informazioni,<br>zero chiarezza.</h2>
    <p class="section-sub">Vuoi cambiare lavoro o imparare una nuova competenza, ma ti scontri subito con una domanda: da dove inizio?</p>
    <div class="pain-grid">
      <div class="pain-card">
        <span class="pain-emoji">🤯</span>
        <h4>Confusione sui corsi</h4>
        <p>Ci sono migliaia di piattaforme. Qual è il corso giusto per te? Senza una guida, ogni scelta è un salto nel buio.</p>
      </div>
      <div class="pain-card">
        <span class="pain-emoji">🧭</span>
        <h4>Nessuna strategia</h4>
        <p>Comprare un corso a caso non basta per ottenere un lavoro. Serve un piano step-by-step, non una lista infinita.</p>
      </div>
      <div class="pain-card">
        <span class="pain-emoji">💸</span>
        <h4>Budget e tempo sprecati</h4>
        <p>Iniziare percorsi formativi sbagliati o non adatti al mercato del tuo Paese è un errore costoso.</p>
      </div>
    </div>
    <div class="resolution">
      ✦ Pilot risolve tutto questo, trasformando il caos in una mappa chiara e strutturata.
    </div>
  </div>
</section>

<div class="divider"></div>

<!-- HOW IT WORKS -->
<section id="how">
  <div class="fade-up">
    <span class="section-label">Come Funziona</span>
    <h2 class="section-title">Dal tuo punto di partenza<br>al lavoro dei sogni in 3 step.</h2>
    <p class="section-sub">Un processo semplice, guidato dall'AI.</p>
  </div>
  <div class="steps">
    <div class="step-card fade-up">
      <div class="step-num">1</div>
      <div class="step-icon blue">🧑</div>
      <h3>Raccontaci di te</h3>
      <p>Inserisci la tua professione attuale, il tuo reddito, il tuo Paese e il tuo obiettivo lavorativo. Ad esempio: da Cameriere a Junior iOS Developer.</p>
    </div>
    <div class="step-card fade-up" style="transition-delay:0.1s">
      <div class="step-num">2</div>
      <div class="step-icon teal">🤖</div>
      <h3>L'AI disegna la rotta</h3>
      <p>Il nostro motore AI analizza il mercato e genera istantaneamente una Roadmap divisa in moduli logici, con tempistiche di studio stimate.</p>
    </div>
    <div class="step-card fade-up" style="transition-delay:0.2s">
      <div class="step-num">3</div>
      <div class="step-icon green">🏆</div>
      <h3>Impara e tieni traccia</h3>
      <p>Segui i task uno per uno. Clicca sui link diretti per iscriverti ai migliori corsi, segna i progressi e festeggia i traguardi raggiunti.</p>
    </div>
  </div>
</section>

<div class="divider"></div>

<!-- SCREENSHOTS -->
<section id="screens">
  <div class="screens-inner fade-up">
    <span class="section-label">L'App in Azione</span>
    <h2 class="section-title" style="font-size:clamp(1.8rem,3vw,2.5rem);letter-spacing:-1px;margin-top:12px">Ogni schermata, un passo verso il tuo futuro.</h2>
  </div>
  <div class="screens-strip">
    <div class="screen-item">
      <img src="/mnt/user-data/uploads/1780923901870_image.png" alt="Welcome screen">
    </div>
    <div class="screen-item">
      <img src="/mnt/user-data/uploads/1780923927112_image.png" alt="Discover screen">
    </div>
    <div class="screen-item">
      <img src="/mnt/user-data/uploads/1780923906629_image.png" alt="Roadmap screen">
    </div>
    <div class="screen-item">
      <img src="/mnt/user-data/uploads/1780923910809_image.png" alt="Progress screen">
    </div>
    <div class="screen-item">
      <img src="/mnt/user-data/uploads/1780923916113_image.png" alt="Achievement screen">
    </div>
  </div>
</section>

<div class="divider"></div>

<!-- FEATURES -->
<section id="features">
  <div class="fade-up">
    <span class="section-label">Funzionalità</span>
    <h2 class="section-title">Molto più di una<br>semplice to-do list.</h2>
    <p class="section-sub">Strumenti reali per una crescita professionale reale.</p>
  </div>
  <div class="features-grid">
    <div class="feat-card fade-up">
      <span class="feat-emoji">🎯</span>
      <h3>Iper-Personalizzazione</h3>
      <p>La tua roadmap tiene conto del tuo budget e del Paese in cui vivi, suggerendo percorsi realistici e accessibili.</p>
    </div>
    <div class="feat-card fade-up" style="transition-delay:0.1s">
      <span class="feat-emoji">🔗</span>
      <h3>Integrazione con le Academy</h3>
      <p>Non devi cercare su Google. Pilot ti fornisce link diretti verso Coursera, edX, Udemy e le migliori piattaforme.</p>
    </div>
    <div class="feat-card fade-up" style="transition-delay:0.15s">
      <span class="feat-emoji">☁️</span>
      <h3>Cloud & Multi-device</h3>
      <p>Accedi con Apple (Sign-in with Apple). I tuoi progressi sono salvati nel cloud, disponibili su qualsiasi dispositivo.</p>
    </div>
    <div class="feat-card fade-up" style="transition-delay:0.2s">
      <span class="feat-emoji">🏆</span>
      <h3>Gamification</h3>
      <p>Percentuali di completamento, trofei e un'interfaccia interattiva per mantenerti sempre motivato lungo il percorso.</p>
    </div>
  </div>
</section>

<div class="divider"></div>

<!-- TARGET -->
<section id="target">
  <div class="fade-up">
    <span class="section-label">Per Chi</span>
    <h2 class="section-title">Disegnata per chi<br>vuole crescere.</h2>
    <p class="section-sub">Qualunque sia il tuo punto di partenza, Pilot ha una rotta per te.</p>
    <div class="target-grid">
      <div class="target-card">
        <span class="target-emoji">🔄</span>
        <h4>Career Switchers</h4>
        <p>Vuoi reinventarti professionalmente? Capisci esattamente quali competenze colmare e in quanto tempo.</p>
      </div>
      <div class="target-card">
        <span class="target-emoji">🎓</span>
        <h4>Studenti & Neolaureati</h4>
        <p>Colma il divario tra teoria accademica e skill pratiche richieste dalle aziende nel mercato reale.</p>
      </div>
      <div class="target-card">
        <span class="target-emoji">📈</span>
        <h4>Professionisti in Upskilling</h4>
        <p>Hai già un lavoro ma vuoi acquisire skill specifiche in AI o management per ottenere una promozione.</p>
      </div>
    </div>
  </div>
</section>

<div class="divider"></div>

<!-- STATUS -->
<section id="status">
  <div class="fade-up">
    <div class="status-pill">
      <div class="pulse"></div>
      Beta Privata
    </div>
    <h2 class="section-title" style="font-size:2rem;letter-spacing:-1px;margin-bottom:16px">Il lancio è alle porte.</h2>
    <p class="status-text">Pilot è attualmente in fase Beta privata. Stiamo perfezionando i nostri algoritmi di AI (basati su Mistral) e chiudendo le partnership con i leader mondiali dell'educazione online.</p>
  </div>
</section>

<div class="divider"></div>

<!-- CTA -->
<section id="cta">
  <div class="fade-up">
    <span class="section-label">Unisciti</span>
    <h2 class="section-title">Non lasciare la tua<br>carriera al caso.</h2>
    <p class="section-sub">Unisciti a centinaia di pionieri. Iscriviti alla waitlist oggi e ottieni l'accesso anticipato.</p>
    <div class="email-form">
      <input class="email-input" type="email" id="emailInput" placeholder="Inserisci la tua email...">
      <button class="btn-waitlist" onclick="joinWaitlist()">Entra nella Waitlist →</button>
    </div>
    <div class="success-msg" id="successMsg">🎉 Perfetto! Ti contatteremo presto con accesso anticipato e 1 mese Premium gratuito.</div>
    <p class="cta-bonus">🎁 Ricevi <span>1 mese di Pilot Premium gratuito</span> al lancio</p>
  </div>
</section>

<div class="divider"></div>

<!-- PARTNERS -->
<section id="partners">
  <div class="fade-up">
    <div class="partners-box">
      <h2>Collabora con Pilot</h2>
      <p>Pilot non si limita a incollare link. Forniamo alle grandi piattaforme e-learning traffico altamente qualificato ed "intent-driven": l'utente clicca sul link di un corso solo quando quel corso è richiesto dal suo percorso personalizzato. Tassi di conversione significativamente più alti rispetto ai tradizionali canali di affiliazione.</p>
      <div class="partner-logos">
        <div class="partner-chip">Coursera</div>
        <div class="partner-chip">edX</div>
        <div class="partner-chip">Udemy</div>
        <div class="partner-chip">LinkedIn Learning</div>
        <div class="partner-chip">Domestika</div>
      </div>
    </div>
  </div>
</section>

<!-- FOOTER -->
<footer>
  <div class="footer-left">
    <div class="logo">Pilot<span>.</span></div>
    <div class="footer-copy">© 2026 Pilot App. Tutti i diritti riservati.</div>
    <div class="footer-contact" style="margin-top:6px">Contatti: <a href="mailto:flombardi824@gmail.com">flombardi824@gmail.com</a></div>
  </div>
  <div class="footer-links">
    <a href="https://mrfrank47.github.io/en/" target="_blank">Privacy Policy</a>
    <a href="#" onclick="showLegal('terms')">Termini di Servizio</a>
    <a href="#" onclick="showLegal('cookie')">Gestione Cookie</a>
  </div>
</footer>

<!-- LEGAL MODALS -->
<div id="legalModal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,0.85);z-index:200;backdrop-filter:blur(12px);align-items:center;justify-content:center;padding:20px;">
  <div style="background:#131722;border:1px solid rgba(255,255,255,0.1);border-radius:24px;max-width:600px;width:100%;max-height:80vh;overflow-y:auto;padding:40px;position:relative;">
    <button onclick="closeLegal()" style="position:absolute;top:16px;right:16px;background:none;border:none;color:var(--muted);font-size:1.5rem;cursor:pointer;line-height:1;">×</button>
    <div id="legalContent"></div>
  </div>
</div>

<script>
// Scroll animations
const observer = new IntersectionObserver((entries) => {
  entries.forEach(e => { if(e.isIntersecting) e.target.classList.add('visible'); });
}, { threshold: 0.1 });
document.querySelectorAll('.fade-up').forEach(el => observer.observe(el));

// Waitlist
function joinWaitlist() {
  const email = document.getElementById('emailInput').value;
  const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if(!re.test(email)) {
    document.getElementById('emailInput').style.borderColor = '#ff6b6b';
    setTimeout(() => { document.getElementById('emailInput').style.borderColor = ''; }, 2000);
    return;
  }
  document.getElementById('successMsg').style.display = 'block';
  document.getElementById('emailInput').value = '';
}

// Legal modals
const legalTexts = {
  terms: `<h2 style="font-family:'Clash Display',sans-serif;font-size:1.5rem;margin-bottom:20px;letter-spacing:-0.5px">Termini di Servizio</h2>
<p style="color:var(--muted);font-size:0.9rem;line-height:1.75">
<strong style="color:var(--text)">1. Accettazione dei Termini</strong><br>
Utilizzando Pilot, l'utente accetta integralmente i presenti Termini di Servizio.<br><br>
<strong style="color:var(--text)">2. Descrizione del Servizio</strong><br>
Pilot è un'applicazione mobile che genera roadmap di carriera personalizzate tramite intelligenza artificiale. Il servizio include suggerimenti formativi, link a piattaforme di terze parti e strumenti di tracciamento progressi.<br><br>
<strong style="color:var(--text)">3. Account e Accesso</strong><br>
L'accesso avviene tramite Sign-in with Apple. L'utente è responsabile della sicurezza del proprio account.<br><br>
<strong style="color:var(--text)">4. Limitazione di Responsabilità</strong><br>
Pilot fornisce indicazioni orientative basate su algoritmi AI. Non garantiamo l'ottenimento di specifici risultati occupazionali. Le roadmap sono suggerimenti e non sostituiscono la consulenza professionale.<br><br>
<strong style="color:var(--text)">5. Link di Terze Parti</strong><br>
Pilot integra link affiliati verso piattaforme di formazione. Non siamo responsabili per i contenuti o le politiche di tali piattaforme.<br><br>
<strong style="color:var(--text)">6. Modifiche</strong><br>
Ci riserviamo il diritto di modificare i presenti Termini con preavviso di 30 giorni via email.<br><br>
<strong style="color:var(--text)">7. Contatti</strong><br>
Per qualsiasi questione legale: <a href="mailto:flombardi824@gmail.com" style="color:var(--teal)">flombardi824@gmail.com</a>
</p>`,
  cookie: `<h2 style="font-family:'Clash Display',sans-serif;font-size:1.5rem;margin-bottom:20px;letter-spacing:-0.5px">Gestione Cookie</h2>
<p style="color:var(--muted);font-size:0.9rem;line-height:1.75">
<strong style="color:var(--text)">Cookie Tecnici</strong><br>
Utilizziamo cookie strettamente necessari al funzionamento del sito (sessione, preferenze). Non richiedono consenso.<br><br>
<strong style="color:var(--text)">Cookie Analitici</strong><br>
Utilizziamo strumenti di analisi aggregata e anonima per migliorare l'esperienza utente. Nessun dato personale viene condiviso con terze parti.<br><br>
<strong style="color:var(--text)">Cookie di Marketing</strong><br>
Non utilizziamo cookie di profilazione o pubblicità comportamentale di terze parti.<br><br>
<strong style="color:var(--text)">Come gestire i cookie</strong><br>
Puoi disabilitare i cookie dal tuo browser in qualsiasi momento. Tieni presente che disabilitare i cookie tecnici potrebbe compromettere alcune funzionalità del sito.<br><br>
<strong style="color:var(--text)">Contatti</strong><br>
Per esercitare i tuoi diritti GDPR: <a href="mailto:flombardi824@gmail.com" style="color:var(--teal)">flombardi824@gmail.com</a>
</p>`
};

function showLegal(type) {
  document.getElementById('legalContent').innerHTML = legalTexts[type];
  const m = document.getElementById('legalModal');
  m.style.display = 'flex';
}
function closeLegal() {
  document.getElementById('legalModal').style.display = 'none';
}
document.getElementById('legalModal').addEventListener('click', function(e) {
  if(e.target === this) closeLegal();
});
</script>
</body>
</html>
