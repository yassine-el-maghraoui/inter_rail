<script>
	import { AlertCircle } from 'lucide-svelte';
	import Header from '$lib/components/Header.svelte';
	import { pass, journey } from '$lib/data.js';

	let { onback } = $props();

	const info = [
		['Name', pass.travellerShort],
		['Date of birth', pass.dateOfBirth],
		['Residence', pass.residence],
		['ID number', pass.idNumber],
		['Activated on', pass.activatedOn],
		['Last online', pass.lastOnline]
	];

	// Texte de sécurité répété en filigrane (données fictives).
	const wmText = `${pass.productName.toUpperCase()} / ${pass.travellerShort.toUpperCase()} / ${pass.dateOfBirth.slice(0, 5)} / ${pass.reference} / ${pass.type.toUpperCase()} / ${pass.validOn}`;
	const wmLine = `${wmText} / ${wmText} / ${wmText} / ${wmText}`;
	// Décalage horizontal par ligne pour un rendu organique (comme un vrai filigrane).
	const wmOffsets = [-120, -40, -160, -70, -200, -90, -150, -30, -180, -110, -60, -140, -90, -20];
</script>

<Header title="Détails" {onback} />

<div class="flex-1 overflow-y-auto bg-white px-5 py-5">
	<!-- infos voyageur -->
	<div class="space-y-3">
		{#each info as [label, value] (label)}
			<div class="flex items-center justify-between">
				<span class="text-lg text-gray-400">{label}</span>
				<span class="text-lg font-medium text-night">{value}</span>
			</div>
		{/each}
	</div>

	<div class="my-6 border-t border-gray-200"></div>

	<!-- trajet -->
	<div class="flex items-center justify-between">
		<h2 class="text-2xl font-bold text-night">Journeys</h2>
		<button class="text-lg font-medium text-night underline">Edit journeys</button>
	</div>

	<div class="mt-4 flex gap-3">
		<span class="mt-1.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full border-2 border-cta">
			<span class="h-2 w-2 rounded-full bg-night"></span>
		</span>
		<div>
			<p class="text-xl text-night">
				{journey.from} <span class="font-bold">{journey.depart}</span> – {journey.to}
			</p>
			<p class="text-xl text-night">
				<span class="font-bold">{journey.arrive}</span> {journey.train}
			</p>
			<p class="mt-1 text-base text-gray-500">
				Gate {journey.gate} · Ticket {journey.ticketNumber}
			</p>

			<div class="mt-3 inline-flex items-center gap-2 rounded-full bg-white px-3 py-1 shadow ring-1 ring-gray-100">
				<AlertCircle class="h-5 w-5 fill-orange-500 text-white" />
				<span class="text-base text-night">{journey.passOnly}</span>
			</div>
			<p class="mt-2 text-lg italic text-orange-500">{journey.seatReservation}</p>
		</div>
	</div>

	<!-- bloc émetteur avec filigrane de sécurité -->
	<div class="relative mt-6 overflow-hidden">
		<!-- filigrane : texte répété en diagonale, décalé ligne par ligne -->
		<div
			class="pointer-events-none absolute inset-0 -top-6 -left-1/3 flex w-[180%] -rotate-[14deg] flex-col justify-between select-none"
			aria-hidden="true"
		>
			{#each wmOffsets as off, i (i)}
				<p
					class="text-base font-semibold whitespace-nowrap text-gray-400/45"
					style="margin-left: {off}px"
				>
					{wmLine}
				</p>
			{/each}
		</div>

		<!-- filet guilloché : deux jeux de vagues croisées -->
		<svg
			class="pointer-events-none absolute inset-0 h-full w-full text-gray-300/80"
			aria-hidden="true"
			preserveAspectRatio="none"
		>
			{#each Array.from({ length: 16 }) as _, i (i)}
				<path
					d="M0 {14 + i * 20} Q 70 {2 + i * 20}, 140 {14 + i * 20} T 280 {14 + i * 20} T 420 {14 +
						i * 20} T 560 {14 + i * 20} T 700 {14 + i * 20}"
					fill="none"
					stroke="currentColor"
					stroke-width="0.8"
				/>
			{/each}
			{#each Array.from({ length: 16 }) as _, i (i)}
				<path
					d="M0 {24 + i * 20} Q 70 {36 + i * 20}, 140 {24 + i * 20} T 280 {24 + i * 20} T 420 {24 +
						i * 20} T 560 {24 + i * 20} T 700 {24 + i * 20}"
					fill="none"
					stroke="currentColor"
					stroke-width="0.8"
				/>
			{/each}
		</svg>

		<!-- contenu au-dessus -->
		<div class="relative z-10 py-8">
			<div class="flex justify-between text-night">
				<div>
					<p class="text-base">Issuer</p>
					<p class="text-lg font-bold">{pass.issuer}</p>
				</div>
				<div>
					<p class="text-base">{pass.standard}</p>
				</div>
			</div>
			<div class="mt-10 flex justify-between text-night">
				<div>
					<p class="text-base">Issued on</p>
					<p class="text-lg font-bold">{pass.issuedOn}</p>
				</div>
				<div>
					<p class="text-base">Last day of validity</p>
					<p class="text-lg font-bold">{pass.lastDayOfValidity}</p>
				</div>
			</div>
		</div>
	</div>

	<button class="mt-4 w-full text-center text-lg font-medium text-night underline">
		View the Conditions of Use of the Pass
	</button>
</div>
