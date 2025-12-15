# Copilot Instructions - Property Card Demo

## Project Overview
This is a **single-file HTML prototype** demonstrating property card UI redesigns for TravelAI's vacation rental platform. The document uses interactive comparisons to showcase three evolutionary design phases: Current State → Figma Proposal → Final Proposal. It targets decision-makers and designers, not end users.

## Architecture & Content Structure

### Single-File Pattern
- **`index.html`** contains ALL content: HTML structure, Tailwind CSS classes, inline styles, and visual comparisons
- **No JavaScript**: Purely static HTML. Interactions (hover states) use CSS only
- **Responsive grid layout**: Flex-based comparisons that reflow on smaller screens
- **Color system**: Emerald (#0d6e6e) brand color, status badges use semantic colors (red=current, orange=proposal, emerald=final)

### Visual Comparison Pattern
Each redesign phase shows a 3-way vertical comparison:
1. **Current (Live)** - Screenshot frame showing production UI
2. **Figma Proposal** - Designed concept with mock data
3. **Final Proposal** - Implementation target with specific improvements called out

### Two Design Goals
- **Goal 1 (PARITY)**: Match competitor features (distance to center, icon-based amenities, nightly rate, free cancellation)
- **Goal 2 (EXCEED)**: Competitive advantages (Best Price badge, Top X% rating tier, scarcity indicators like "Only 2 left")

## Critical Data Elements & Tag Conventions

### Rating System
```html
<span class="bg-[#0d6e6e] text-white text-xs font-bold px-2 py-0.5 rounded">9.84</span>
```
- Always shows review score, count, and quality label ("Exceptional" = 9.0+)
- NEW in parity phase: Add percentile context: "Top 5% in Ubud"

### Price Presentation
- **Parity change**: Flip primary/secondary. Make nightly rate prominent (`$69/night`), total secondary (`$486 total · 7 nights`)
- **Icon convention**: `/night` text suffix, not separate element
- Include discount badge with percentage: `<span class="bg-emerald-100 text-emerald-700">-17%</span>`

### New Information Elements (Parity)
1. **Distance to center**: Icon + text format
   ```html
   <span class="text-[#0d6e6e] font-medium">0.8 mi to center</span>
   ```
2. **Icon amenities**: Bag of 3-4 amenities as pill buttons with inline SVG icons
3. **Free cancellation**: Checkmark + green text, positioned before price block
   ```html
   <svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"/></svg>
   ```

### Exceed Additions
- **Best Price badge**: Positioned bottom-left of image area, emerald bg, white text
- **Scarcity text**: "🔥 Only 2 left at this price" - emoji convention for urgency
- **Rating percentile**: "Top 5% in Ubud" - shows ranking relative to geographic market

## Development Patterns

### Tailwind CSS Conventions
- **Custom colors**: Use `[#0d6e6e]` (brand teal) and `[#003580]` (Booking.com blue) in bracket notation
- **Card styling**: Chain `.card-shadow` + `.card-hover` for consistent interaction
- **Text sizing**: Amenities and labels use `text-xs`, titles use `text-sm`, never larger
- **Spacing**: Use consistent `mb-1`, `mb-2` for vertical rhythm within cards

### Asset References
- **Placeholder images**: Use Unsplash URLs with `?w=600&h=400&fit=crop` params for consistent sizing
- **Screenshots**: Reference local PNG files (`current-booking.png`, `current-vrbo.png`)
- **Icon approach**: Inline SVG buttons (map marker, heart) with `stroke-width="2"`, no icon library dependency

### Responsive Behavior
- Cards are fixed `w-[280px]` on desktop
- Comparisons use `flex items-start gap-6 flex-wrap` to reflow on mobile
- No breakpoint-specific hiding (both verticals always shown)

## Content Update Workflow
When adding new partner comparisons or redesign iterations:
1. **Keep section headers consistent**: `<!-- ==================== CONTEXT/GOAL X ==================== -->`
2. **Use status badges**: `<span class="bg-[COLOR]-100 text-[COLOR]-700 px-3 py-1 rounded-full text-sm font-semibold">[STATUS]</span>`
3. **Mirror existing structure**: Current → Figma → Final, with arrows between
4. **Reference source data**: Include Expedia QBR context or data sources in context boxes

## Deployment & Container
- **Dockerfile** serves this file via nginx on port 8080
- **No build step**: Changes to `index.html` are immediately reflected after container restart
- **Local testing**: Use any local server (`python -m http.server 8000`) to preview before commit

## Anti-Patterns to Avoid
- ❌ Adding external JavaScript frameworks
- ❌ Creating separate CSS files (keep Tailwind inline)
- ❌ Using pre-built component libraries beyond Tailwind
- ❌ Hardcoding image dimensions without `fit=crop` (causes distortion)
- ❌ Mixing icon approaches (keep SVG inline, don't switch to icon fonts)

## Key Files Reference
- **`index.html`**: Source of truth, contains all structure and styling
- **`Dockerfile`**: Container configuration, minimal customization
- **`current-booking.png`, `current-vrbo.png`**: Local screenshots for comparison overlays
