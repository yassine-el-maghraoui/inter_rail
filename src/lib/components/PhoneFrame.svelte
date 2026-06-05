<script>
	let { children } = $props();
</script>

<div class="flex min-h-screen items-center justify-center bg-gray-200 p-0 sm:p-6">
	<div
		class="relative flex h-screen w-full max-w-[420px] flex-col overflow-hidden bg-white shadow-2xl sm:h-[860px] sm:rounded-[2.5rem]"
	>
		{@render children()}
	</div>
</div>
