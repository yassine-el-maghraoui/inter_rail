<script>
	import { ChevronLeft, MoreHorizontal } from 'lucide-svelte';
	let { title, onback, showMenu = false } = $props();
</script>

<div class="flex items-center justify-between bg-night px-4 pb-4 text-white">
	<button
		onclick={onback}
		aria-label="Retour"
		class="flex h-10 w-10 items-center justify-center rounded-full transition hover:bg-white/10"
	>
		<ChevronLeft class="h-7 w-7" />
	</button>
	<h1 class="text-xl font-semibold">{title}</h1>
	{#if showMenu}
		<button
			aria-label="Menu"
			class="flex h-10 w-10 items-center justify-center rounded-full transition hover:bg-white/10"
		>
			<MoreHorizontal class="h-6 w-6" />
		</button>
	{:else}
		<div class="h-10 w-10"></div>
	{/if}
</div>
