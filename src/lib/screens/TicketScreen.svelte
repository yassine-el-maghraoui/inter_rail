<script>
	import Header from '$lib/components/Header.svelte';
	import AztecCode from '$lib/components/AztecCode.svelte';
	import { pass } from '$lib/data.js';

	let { onback } = $props();

	// Heure d'émission figée (le code ne change jamais).
	const clock = '10:00:00';
</script>

<Header title="Billet" {onback} />

<div class="flex-1 overflow-y-auto bg-white px-5 py-5">
	<!-- card billet style ticket -->
	<div class="rounded-2xl bg-white shadow-lg ring-1 ring-gray-100">
		<div class="flex justify-end px-5 pt-4">
			<span class="text-xl font-semibold text-night">{clock}</span>
		</div>

		<div class="flex flex-col items-center px-5 pb-5">
			<div class="my-2 w-full">
				<AztecCode passNumber={pass.reference} />
			</div>
			<p class="mt-1.5 text-base tracking-wide text-night/70">
				PASS NUMBER <span class="font-bold text-night">{pass.reference}</span>
			</p>
		</div>

		<!-- encoche ticket -->
		<div class="relative border-t border-dashed border-gray-200">
			<span
				class="absolute -top-3 -left-3 h-6 w-6 rounded-full bg-gray-200"
			></span>
			<span
				class="absolute -top-3 -right-3 h-6 w-6 rounded-full bg-gray-200"
			></span>
		</div>

		<div class="px-6 py-6">
			<p class="text-2xl font-bold text-night">{pass.productName}</p>
			<p class="text-2xl font-bold text-night">{pass.type}</p>

			<p class="mt-5 text-base text-gray-400">Valid on</p>
			<p class="text-2xl font-bold text-night">{pass.validOn}</p>

			<div class="my-5 border-t border-gray-200"></div>

			<div class="flex items-center justify-between">
				<p class="text-lg text-gray-400">Name</p>
				<p class="text-xl font-semibold text-night">{pass.travellerShort}</p>
			</div>
			<div class="mt-3 flex items-center justify-between">
				<p class="text-lg text-gray-400">Date of birth</p>
				<p class="text-xl font-semibold text-night">{pass.dateOfBirth}</p>
			</div>
		</div>
	</div>
</div>
