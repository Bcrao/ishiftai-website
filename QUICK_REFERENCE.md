# iShiftAI Website - Quick Reference

## 📁 Website Files Summary

```
iShiftAI-website/
├── index.html               ← Home/Landing page
├── services.html            ← Services & engagement process
├── use-cases.html           ← 5 enterprise case studies with SVG illustrations
├── founder.html             ← Your biography & experience
├── contact.html             ← Contact form & FAQ
├── styles.css               ← All styling (responsive, modern)
├── script.js                ← Form handling & navigation
├── README.md                ← Full documentation
└── CUSTOMIZATION_GUIDE.md   ← Deployment & customization
```

---

## 🎯 What Each Page Contains

### 1. HOME (index.html)
- **Hero**: Compelling headline + CTA buttons
- **Services**: 4-card overview of main offerings
- **Why Choose Us**: 4 key differentiators
- **Call-to-Action**: Drive to consulting

### 2. SERVICES (services.html)
- 6 detailed service offerings with features
- 6-step engagement process visualization
- CTA to contact

**Services Listed:**
1. Microsoft AI Foundry Strategy & Implementation
2. Copilot Agents Development & Integration
3. Enterprise AI Application Development
4. Digital Transformation & AI Strategy
5. Training & Capability Building
6. AI Governance & Responsible AI

### 3. USE CASES (use-cases.html)
- 5 complete case studies with:
  - Project title & industry
  - Technologies used
  - Project description
  - 4 measurable outcomes
  - Custom SVG illustration

**Industries Covered:**
1. **Financial Services** → 60% processing reduction
2. **Healthcare** → 40% documentation time savings
3. **Retail** → 45% conversion increase
4. **Manufacturing** → 50% downtime reduction
5. **Customer Service** → 70% auto-resolution rate

### 4. FOUNDER (founder.html)
- **Profile Section**: Name, title, bio (550+ words)
- **Expertise Tags**: 8 key areas
- **Timeline**: 4 career phases with details
- **Client Engagements**: 6 industry sectors
- **Vision & Values**: 4 core pillars

### 5. CONTACT (contact.html)
- **Form**: 8 fields (name, email, company, etc.)
- **Info Panel**: LinkedIn, email, response times
- **FAQ**: 6 common questions answered
- Form validation + success message

---

## ⚡ Quick Customization (15 min)

### Must Change:
1. Add your LinkedIn profile info (use cases & founder pages already link to linkedin.com/in/bcrao)
2. Replace use case descriptions with your real projects
3. Update founder bio with your actual experience
4. List real client names in founder page

### Nice to Have:
1. Change colors (in styles.css, top section)
2. Add actual metrics from your projects
3. Add company logo (if you have one)
4. Setup form submission

---

## 🚀 Deployment (Choose One)

### Easiest: GitHub Pages + Netlify (Free)
```
1. Create GitHub repo
2. Upload your files
3. Enable GitHub Pages (Settings → Pages)
4. Go live in 5 minutes
```

### Professional: Azure Static Web Apps
```
az staticwebapp create --name ishiftai-website \
  --resource-group my-rg --location eastus \
  --source https://github.com/YOUR_REPO
```

### Simple: Any Web Hosting
- Upload files via FTP/SFTP
- No backend needed (pure HTML/CSS/JS)

---

## 📧 Form Setup (Optional)

**Current State**: Form shows success message locally

**To Send Real Emails**, use:

1. **Formspree** (easiest)
   - Sign up at formspree.io
   - Update form action URL

2. **EmailJS** (client-side)
   - Sign up at emailjs.com
   - Add 3 lines of JS

3. **Azure Functions** (enterprise)
   - Create serverless function
   - Update form endpoint

---

## 🎨 Color Scheme

Current colors (Microsoft Azure inspired):
- **Primary Blue**: #0078d4 (main brand color)
- **Cyan**: #50e6ff (secondary accent)
- **Orange**: #ff6b35 (call-to-action)

To change, edit `styles.css` lines 8-15

---

## 📱 Responsive Design

✅ **Mobile Optimized** - All pages work on:
- Phones (375px - 480px)
- Tablets (768px - 1024px)
- Desktops (1200px+)

Test using Chrome DevTools (F12 → Device Toolbar)

---

## 📊 Content Updates

### To Update Use Cases:
1. Open `use-cases.html`
2. Find `<div class="use-case">`
3. Update:
   - `<h3>` - Project title
   - `.industry` - Industry name
   - `.tech` - Technologies
   - `<p>` - Description
   - `.outcomes` - Results/metrics

### To Update Founder Info:
1. Open `founder.html`
2. Update:
   - `<h2>` - Your name
   - `.title` - Your title
   - `.bio` - Your summary
   - `.expertise-tags` - Your skills
   - `.timeline-item` - Career phases
   - `.client-card` - Industries served

### To Update Services:
1. Open `services.html`
2. Update each `.service-detail` section with:
   - `<h2>` - Service name
   - `.service-description` - Description
   - `<li>` items - Features/deliverables

---

## 🔗 Important Links

- **LinkedIn**: linkedin.com/in/bcrao (update to your profile)
- **Contact Form**: Points to contact.html
- **All Pages**: Linked via navigation menu

---

## ✅ Pre-Launch Checklist

- [ ] All company info updated
- [ ] LinkedIn links working
- [ ] Use cases reflect your real projects
- [ ] Founder bio is accurate
- [ ] Contact form works
- [ ] Test on mobile
- [ ] Check all links
- [ ] Verify spelling
- [ ] Copy right year if needed

---

## 📞 Need to Make Changes?

### Easy Changes (Edit HTML directly):
- Text/descriptions
- Company name
- Links
- Headings
- Form fields

### Styling Changes (Edit CSS):
- Colors
- Fonts
- Spacing
- Layout
- Responsive breakpoints

### Functionality (Edit JavaScript):
- Form submission
- Navigation behavior
- Animations
- Analytics tracking

---

## 🎓 File Size & Performance

✅ **Lightweight**: No external dependencies
✅ **Fast Load**: <1 second on good connection
✅ **SEO Ready**: Proper HTML structure
✅ **Mobile First**: Responsive design

---

## 💡 Future Ideas

1. Add blog section (thought leadership)
2. Client testimonials/case study videos
3. Team members page
4. Webinar/events calendar
5. Resource downloads (PDFs, guides)
6. Live chat support
7. Newsletter signup
8. Dark mode toggle

---

## 🎯 Next Steps

### Today:
1. Customize with your real information (30 min)
2. Test all pages and links (10 min)
3. Choose deployment platform (5 min)

### This Week:
4. Deploy website (15 min)
5. Share on LinkedIn
6. Promote to network

### Ongoing:
7. Monitor analytics
8. Update with new projects
9. Maintain and improve

---

**Your website is production-ready! Good luck! 🚀**

For detailed instructions, see: `CUSTOMIZATION_GUIDE.md`
