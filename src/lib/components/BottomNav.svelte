<script>
	import { Clock, Luggage, BookMarked, Menu } from 'lucide-svelte';

	let { active = 'pass', onnav } = $props();

	const items = [
		{ id: 'planner', label: 'Planner', icon: Clock },
		{ id: 'trip', label: 'My Trip', icon: Luggage },
		{ id: 'pass', label: 'My Pass', icon: BookMarked },
		{ id: 'more', label: 'More', icon: Menu }
	];
</script>

<nav class="border-t border-gray-100 bg-white px-2 pt-2 pb-6">
	<div class="flex items-stretch justify-around">
		{#each items as item (item.id)}
			{@const Icon = item.icon}
			<button
				onclick={() => onnav?.(item.id)}
				class="flex flex-1 flex-col items-center gap-1 rounded-xl py-1.5 transition {active ===
				item.id
					? 'bg-gray-100'
					: ''}"
			>
				{#if active === item.id}
					<span
						class="flex h-7 w-7 items-center justify-center rounded-md bg-night text-white"
					>
						<Icon class="h-4 w-4" />
					</span>
				{:else}
					<Icon class="h-6 w-6 text-night" />
				{/if}
				<span class="text-xs {active === item.id ? 'font-semibold text-night' : 'text-gray-500'}"
					>{item.label}</span
				>
			</button>
		{/each}
	</div>
</nav>
