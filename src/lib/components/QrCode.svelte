<script>
	import QRCode from 'qrcode';

	let { value, size = 280 } = $props();
	let dataUrl = $state('');

	$effect(() => {
		QRCode.toDataURL(value, {
			width: size,
			margin: 1,
			errorCorrectionLevel: 'H',
			color: { dark: '#000000', light: '#ffffff' }
		})
			.then((url) => (dataUrl = url))
			.catch(() => (dataUrl = ''));
	});
</script>

{#if dataUrl}
	<img src={dataUrl} alt="QR code de démonstration" width={size} height={size} />
{:else}
	<div
		class="flex items-center justify-center bg-gray-100 text-sm text-gray-400"
		style="width:{size}px;height:{size}px"
	>
		QR…
	</div>
{/if}
