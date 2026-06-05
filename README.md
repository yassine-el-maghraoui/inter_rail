# RailPass Demo

App mobile fictive de billetterie ferroviaire — **« RailPass Demo »**. Données 100% inventées, aucune marque réelle.

Stack : SvelteKit + Svelte 5 (runes) + Tailwind CSS v4 + lucide-svelte + qrcode.

## Lancer

```bash
npm install
npm run dev      # http://localhost:5173
npm run build    # build prod
```

## Écrans

Navigation gérée par état Svelte (`src/routes/+page.svelte`, variable `screen`).

- **Pass** (`src/lib/screens/PassScreen.svelte`) — header sombre, card voyageur, onglets jours scrollables, card trajet (CTA jaune « Afficher le billet » → écran Billet, bouton blanc « Modifier »).
- **Billet** (`TicketScreen.svelte`) — QR code généré via `qrcode` pointant vers `https://example.com/demo`, numéro de pass, type, validité, nom.
- **Détails** (`DetailsScreen.svelte`) — infos voyageur + trajet avec « Seat reservations required ».

Bottom nav 4 icônes (Planner, My Trip, My Pass, More) via lucide-svelte.

Palette : header `#1e1b4b`, CTA `#facc15`, fond blanc.
