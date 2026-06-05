<script>
	import { Navigation, Plane } from 'lucide-svelte';
	let { time = '22:39' } = $props();
</script>

<div class="flex items-center justify-between bg-night px-6 pt-3 pb-1 text-white">
	<div class="flex items-center gap-2">
		<span class="text-lg font-semibold">{time}</span>
		<Navigation class="h-4 w-4 rotate-45 fill-white" />
	</div>
	<div class="flex items-center gap-2">
		<Plane class="h-4 w-4" />
		<span
			class="rounded-md bg-green-500 px-1.5 py-0.5 text-xs font-bold text-white">54⚡</span
		>
	</div>
</div>
