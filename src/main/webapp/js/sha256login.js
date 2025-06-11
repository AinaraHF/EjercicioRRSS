// Función para calcular el SHA-256 del texto del input y ponerlo en el otro input
function calcularSha256() {
    const texto = document.getElementById('p_pass').value;
    
    if (texto === '') {
        document.getElementById('p_pass_enc').value = '';
        return;
    }

    // Convertir el texto en un ArrayBuffer
    const encoder = new TextEncoder();
    const data = encoder.encode(texto);

    // Calcular el hash SHA-256
    crypto.subtle.digest('SHA-256', data).then(hash => {
        // Convertir el ArrayBuffer a un string hexadecimal
        const hashArray = Array.from(new Uint8Array(hash));
        const hashHex = hashArray.map(byte => byte.toString(16).padStart(2, '0')).join('');
        
        // Asignar el hash calculado al segundo input
        document.getElementById('p_pass_enc').value = hashHex;
    });
}
	