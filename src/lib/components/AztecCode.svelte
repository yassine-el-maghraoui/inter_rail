<script>
	// Code Aztec (norme billets ferroviaires UIC) — plus dense/robuste qu'un QR.
	// Rendu côté client uniquement via import dynamique de bwip-js.
	let { value, size = 300 } = $props();
	let canvas = $state();

	$effect(() => {
		const text = value; // dépendance suivie
		if (!canvas) return;
		let cancelled = false;

		import('bwip-js/browser').then((mod) => {
			if (cancelled) return;
			const bwipjs = mod.default ?? mod;
			try {
				bwipjs.toCanvas(canvas, {
					bcid: 'azteccode',
					text,
					scale: 4,
					padding: 0,
					eclevel: '23'
				});
			} catch {
				/* payload invalide : on ignore */
			}
		});

		return () => {
			cancelled = true;
		};
	});
</script>

<canvas
	bind:this={canvas}
	class="block"
	style="width:{size}px;height:{size}px;image-rendering:pixelated"
	aria-label="Code Aztec du billet (démonstration)"
></canvas>
