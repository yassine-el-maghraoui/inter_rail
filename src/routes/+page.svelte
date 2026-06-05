<script>
	import PhoneFrame from '$lib/components/PhoneFrame.svelte';
	import BottomNav from '$lib/components/BottomNav.svelte';
	import PassScreen from '$lib/screens/PassScreen.svelte';
	import TicketScreen from '$lib/screens/TicketScreen.svelte';
	import DetailsScreen from '$lib/screens/DetailsScreen.svelte';

	// Navigation gérée par l'état Svelte.
	let screen = $state('pass'); // 'pass' | 'ticket' | 'details'

	function go(s) {
		screen = s;
	}
</script>

<PhoneFrame>
	{#if screen === 'pass'}
		<PassScreen onshowticket={() => go('ticket')} ondetails={() => go('details')} />
	{:else if screen === 'ticket'}
		<TicketScreen onback={() => go('pass')} />
	{:else if screen === 'details'}
		<DetailsScreen onback={() => go('pass')} />
	{/if}

	<BottomNav active="pass" onnav={() => go('pass')} />
</PhoneFrame>
