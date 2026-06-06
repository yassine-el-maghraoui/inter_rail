<script>
	import { onMount } from 'svelte';

	// Générateur pseudo-aléatoire seedé (Mulberry32) → code déterministe & inchangeable.
	function createSeededRandom(seed) {
		let h = 0;
		for (let i = 0; i < seed.length; i++) {
			h = (Math.imul(31, h) + seed.charCodeAt(i)) | 0;
		}
		return function () {
			let t = (h += 0x6d2b79f5);
			t = Math.imul(t ^ (t >>> 15), t | 1);
			t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
			return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
		};
	}

	let { passNumber = '34CZYN' } = $props();

	let canvas;

	$effect(() => {
		if (!canvas) return;
		drawAztec(passNumber);
	});

	function drawAztec(seed) {
		const ctx = canvas.getContext('2d');
		const size = 79; // largeur/hauteur en modules
		const scale = 4; // facteur d'échelle de rendu
		canvas.width = size * scale;
		canvas.height = size * scale;

		const rng = createSeededRandom(seed);
		const center = Math.floor(size / 2);

		ctx.fillStyle = '#ffffff';
		ctx.fillRect(0, 0, canvas.width, canvas.height);
		ctx.fillStyle = '#000000';

		for (let y = 0; y < size; y++) {
			for (let x = 0; x < size; x++) {
				const dx = x - center;
				const dy = y - center;
				const dist = Math.max(Math.abs(dx), Math.abs(dy));

				let isBlack = false;

				// Bullseye central (finder pattern Aztec)
				if (dist <= 6) {
					if (dist <= 1) isBlack = true;
					else if (dist === 2) isBlack = false;
					else if (dist === 3) isBlack = true;
					else if (dist === 4) isBlack = false;
					else if (dist === 5) isBlack = true;
					else if (dist === 6) isBlack = false;
				} else {
					// Couches de données pseudo-aléatoires (seed = pass number)
					isBlack = rng() > 0.5;
					// Repères structurels type Aztec
					if (x % 16 === 0 || y % 16 === 0) {
						isBlack = (x + y) % 2 === 0;
					}
				}

				if (isBlack) {
					ctx.fillRect(x * scale, y * scale, scale, scale);
				}
			}
		}
	}

	onMount(() => {
		drawAztec(passNumber);
	});
</script>

<div class="flex flex-col items-center justify-center rounded-lg bg-white p-0 select-none">
	<canvas
		bind:this={canvas}
		class="aspect-square w-full object-contain"
		style="image-rendering: pixelated; image-rendering: crisp-edges;"
		aria-label="Code Aztec du billet (démonstration)"
	></canvas>
</div>
