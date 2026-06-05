<script>
	import { QrCode } from 'lucide-svelte';
	import Header from '$lib/components/Header.svelte';
	import { pass, days, journey } from '$lib/data.js';

	let { onshowticket, ondetails } = $props();
</script>

<Header title="{pass.traveller.split(' ')[0]}'s Pass" showMenu />

<!-- bande décorative -->
<div class="h-4 bg-sky-300/70"></div>

<div class="flex-1 overflow-y-auto bg-white px-5 pb-6">
	<!-- titre produit -->
	<div class="pt-5">
		<h2 class="text-2xl font-bold text-night">{pass.productName}</h2>
		<p class="mt-1 text-lg text-night/80">{pass.planLabel}</p>
	</div>

	<div class="my-4 border-t border-gray-200"></div>

	<!-- nom + détails -->
	<div class="flex items-start justify-between gap-4">
		<div class="min-w-0">
			<p class="text-sm text-gray-400">Name</p>
			<p class="mt-0.5 text-2xl break-words text-night">{pass.traveller}</p>
		</div>
		<button
			onclick={ondetails}
			class="shrink-0 rounded-xl border border-gray-200 px-5 py-3 text-lg text-night shadow-sm transition hover:bg-gray-50"
			>Details</button
		>
	</div>

	<div class="mt-5 flex gap-6">
		<div class="flex-1">
			<p class="text-sm text-gray-400">Pass reference</p>
			<p class="mt-0.5 text-xl text-night">{pass.reference}</p>
		</div>
		<div class="w-px bg-gray-200"></div>
		<div class="flex-1">
			<p class="text-sm text-gray-400">Pass type</p>
			<p class="mt-0.5 text-xl text-night">{pass.type}</p>
		</div>
	</div>

	<div class="my-4 border-t border-gray-200"></div>

	<div class="flex items-start justify-between gap-4">
		<div>
			<p class="text-sm text-gray-400">Validity period</p>
			<p class="mt-0.5 text-xl text-night">{pass.validityPeriod}</p>
		</div>
		<button
			class="rounded-xl border border-gray-200 px-5 py-3 text-lg text-night shadow-sm transition hover:bg-gray-50"
			>Go to My Trip</button
		>
	</div>

	<div class="mt-4">
		<p class="text-sm text-gray-400">Travel days</p>
		<p class="mt-0.5 text-2xl text-night">{pass.daysUsed}/{pass.daysTotal} used</p>
	</div>

	<!-- onglets jours -->
	<div class="-mx-5 mt-6 flex gap-3 overflow-x-auto px-5 pb-2">
		{#each days as day (day.label)}
			<div class="relative shrink-0">
				<div
					class="flex h-28 w-36 flex-col justify-center rounded-2xl px-5 {day.active
						? 'border-2 border-night bg-white'
						: 'bg-gray-100'}"
				>
					<p class="text-2xl font-bold text-night">{day.label}</p>
					<p class="mt-1 text-lg text-gray-400">{day.status}</p>
				</div>
				{#if day.active}
					<span
						class="absolute -top-2 right-3 flex h-9 w-9 items-center justify-center rounded-full bg-cta text-night shadow"
					>
						<QrCode class="h-5 w-5" />
					</span>
				{/if}
			</div>
		{/each}
	</div>

	<!-- card trajet -->
	<div class="mt-5 rounded-2xl bg-gray-100 p-5">
		<p class="font-semibold text-night">{journey.date}</p>
		<p class="mt-2 text-2xl font-bold text-night">{journey.from} - {journey.to}</p>
		<p class="mt-2 text-lg text-night/70">{journey.note}</p>

		<button
			onclick={onshowticket}
			class="mt-5 flex w-full items-center justify-center gap-2 rounded-xl bg-cta py-4 text-xl font-bold text-night shadow-sm transition hover:brightness-95"
		>
			<QrCode class="h-6 w-6" />
			Afficher le billet
		</button>
		<button
			class="mt-3 w-full rounded-xl border border-gray-200 bg-white py-4 text-xl font-bold text-night shadow-sm transition hover:bg-gray-50"
			>Modifier</button
		>
	</div>
</div>
