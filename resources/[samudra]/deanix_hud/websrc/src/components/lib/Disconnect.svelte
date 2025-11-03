<script lang="ts">
    import { ReceiveEvent, SendEvent } from '@utils/eventsHandlers';
    import { createEventDispatcher } from 'svelte';
    
    export let showDisconnectDialog: boolean;
      const dispatch = createEventDispatcher();
    
    function disconnectConfirmed() {
      SendEvent("disconnect", {});
    }
    
    function closeDisconnectDialog() {
      dispatch('close');
    }
  </script>
    
  {#if showDisconnectDialog}
    <div class="fixed inset-0 flex items-center justify-center bg-gray-900 bg-opacity-60 z-50">
      <div class="alert-color rounded-lg p-8">
        <h2 class="text-xl font-bold mb-4">Are you sure you want to disconnect?</h2>
        <div class="flex justify-center">
          <button class="bg-red-500 text-white font-semibold w-16 py-2 rounded hover:bg-red-600 mr-4" on:click={disconnectConfirmed}>Yes</button>
          <button class="bg-gray-300 text-gray-700 font-semibold w-16 py-2 rounded hover:bg-gray-400" on:click={closeDisconnectDialog}>No</button>
        </div>
      </div>
    </div>
  {/if}
    