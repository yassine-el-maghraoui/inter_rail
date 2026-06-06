<script>
	let { children } = $props();
</script>

<div class="flex min-h-screen items-center justify-center bg-gray-200 p-0 sm:p-6">
	<div
		class="relative flex h-screen w-full flex-col overflow-hidden bg-white shadow-2xl sm:h-[820px] sm:w-[385px] sm:rounded-[48px]"
	>
		{@render children()}
	</div>
</div>
