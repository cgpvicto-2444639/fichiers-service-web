 const cle_api = "4321"

 async function ajoutBibliotheque() {
    let nom = document.getElementById("nom").value;
    let courriel = document.getElementById("courriel").value;
    let mdp = document.getElementById("mdp").value;

    try {
        let reponse = await fetch('https://projet-final-service-web.onrender.com/api/bibliotheque/ajout_bibli', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': cle_api
            },
            body: JSON.stringify({
                nom: nom,
                courriel: courriel,
                password: mdp
            })
        });

        let resultat = await reponse.json();
        console.log(resultat);
    } catch (error) {
        console.error("Erreur réseau ou CORS : Impossible de contacter le serveur.", error);
    }
 }
 document.getElementById("btn-creer").addEventListener("click", ajoutBibliotheque);


 
 async function recuperationCleApi(event) {
    event.preventDefault();

    const courriel = document.getElementById("courriel-recup").value;
    const mdp = document.getElementById("mdp-recup").value;
    const genererNouvelle = document.getElementById("generer-cle").checked;

    const urlCle = `https://projet-final-service-web.onrender.com/api/bibliotheque/cle_api?nouvelle=${genererNouvelle}`;

    try {
        const response = await fetch(urlCle, {
            method: 'POST', 
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                courriel: courriel,
                password: mdp
            })
        });

        if (!response.ok) {
            throw new Error(`Erreur HTTP: ${response.status}`);
        }

        const data = await response.json();
        console.log("Clé reçue :", data);

        if (data.cle_api) {
            document.getElementById("cle_api").textContent = data.cle_api;
        }

    } catch (error) {
        console.error('Erreur lors de la récupération :', error);
    }
}

document.getElementById("form-recuperation").addEventListener("submit", recuperationCleApi);