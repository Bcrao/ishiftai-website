# iShiftAI - Enterprise AI Consulting Website

A professional website for iShiftAI, showcasing enterprise AI consulting services with focus on Microsoft AI Foundry, Copilot Agents, and enterprise transformation solutions.

## Website Features

### Pages Included

1. **Home (index.html)**
   - Hero section with value proposition
   - Services overview
   - Why choose iShiftAI section
   - Call-to-action buttons

2. **Services (services.html)**
   - Detailed service descriptions
   - Service features and deliverables
   - Engagement process (6-step methodology)
   - Service areas:
     - Microsoft AI Foundry Strategy & Implementation
     - Copilot Agents Development & Integration
     - Enterprise AI Application Development
     - Digital Transformation & AI Strategy
     - Training & Capability Building
     - AI Governance & Responsible AI

3. **Use Cases (use-cases.html)**
   - 5 detailed enterprise case studies
   - SVG illustrations for each use case
   - Real-world applications with business outcomes
   - Industries covered:
     - Financial Services (Intelligent Platform)
     - Healthcare (Clinical Decision Support)
     - Retail (Customer Intelligence)
     - Manufacturing (Predictive Maintenance)
     - Customer Service (Support Automation)

4. **Founder (founder.html)**
   - Executive profile section
   - Career highlights and timeline
   - Strategic engagements by industry
   - Vision and core values
   - Expertise tags
   - LinkedIn integration

5. **Contact (contact.html)**
   - Contact form with validation
   - Industry and interest selection
   - FAQ section (6 common questions)
   - Response time expectations
   - LinkedIn messaging option

### Design Features

- **Responsive Design**: Fully mobile-responsive layout
- **Modern UI**: Clean, professional design with Microsoft brand colors
- **SVG Illustrations**: Custom SVG illustrations for use cases
- **Navigation**: Sticky navigation bar with active page highlighting
- **Color Scheme**: 
  - Primary: #0078d4 (Microsoft Blue)
  - Secondary: #50e6ff (Light Cyan)
  - Accent: #ff6b35 (Orange)
- **Typography**: System fonts for optimal performance
- **Accessibility**: Semantic HTML with proper contrast ratios

### Technologies Used

- **HTML5**: Semantic markup
- **CSS3**: Responsive grid layout, flexbox, animations
- **JavaScript**: Form handling, navigation state management
- **SVG**: Custom vector illustrations

## File Structure

```
iShiftAI-website/
├── index.html          # Home page
├── services.html       # Services detail page
├── use-cases.html      # Enterprise use cases
├── founder.html        # Founder biography
├── contact.html        # Contact and inquiry form
├── styles.css          # Main stylesheet
├── script.js           # JavaScript functionality
└── README.md           # This file
```

## Getting Started

### To View the Website

1. Open any HTML file in a web browser
2. All pages are standalone and can be viewed directly
3. Navigate between pages using the navigation menu

### To Deploy

The website is static HTML/CSS/JavaScript and can be deployed to:
- GitHub Pages
- Netlify
- Vercel
- AWS S3 + CloudFront
- Azure Static Web Apps
- Any web hosting service

## Customization

### Update Company Information

Replace the following placeholders with your actual information:

- **Company Name**: iShiftAI (appears in navbar and footer)
- **Founder Name**: Chender Rao (in founder.html)
- **LinkedIn URL**: https://www.linkedin.com/in/bcrao
- **Contact Email**: Update form handling in script.js

### Modify Colors

Edit the CSS variables in `styles.css`:

```css
:root {
    --primary-color: #0078d4;
    --secondary-color: #50e6ff;
    --accent-color: #ff6b35;
    /* ... more colors */
}
```

### Add Real Client Names

Update the client engagement cards in `founder.html` with actual company names and details from your LinkedIn profile.

### Update Use Cases

Modify the use cases in `use-cases.html` to reflect your actual projects:
- Replace industry names
- Update outcomes and metrics
- Modify service descriptions
- Update SVG illustrations if desired

## SEO Optimization

Each page includes:
- Descriptive `<title>` tags
- Meta descriptions
- Semantic HTML structure
- Open Graph ready (add meta tags as needed)

### To Add Meta Descriptions

Add to the `<head>` section of each HTML file:

```html
<meta name="description" content="Your page description here">
```

## Form Handling

The contact form in `contact.html` currently displays a success message on submission. To actually send emails, integrate with:
- Formspree
- EmailJS
- Your own backend service
- AWS Lambda + SES
- SendGrid

## Performance Optimization

- Lightweight CSS and JavaScript
- No external dependencies
- Fast-loading SVG illustrations
- Optimized for Core Web Vitals

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers (iOS Safari, Chrome Mobile)

## Future Enhancements

Consider adding:
- Blog section for thought leadership
- Client testimonials/video testimonials
- Case study PDFs for download
- Team members page
- Events and webinars calendar
- Knowledge base or resource center
- Newsletter signup
- Chatbot integration
- Dark mode toggle

## License

This website is proprietary to iShiftAI and should not be distributed without permission.

## Contact

For website updates or modifications, contact the development team.

---

**Last Updated**: January 27, 2026
**Version**: 1.0
