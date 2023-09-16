// Select all iframes with src starting with "https://istats"
const iframes = document.querySelectorAll('iframe[src^="https://istats"]');

// Loop through each iframe and add the sandbox attribute
iframes.forEach(iframe => {
    // Add or modify the 'sandbox' attribute to prevent pop-ups
    iframe.setAttribute('sandbox', 'allow-same-origin allow-presentation');
});
