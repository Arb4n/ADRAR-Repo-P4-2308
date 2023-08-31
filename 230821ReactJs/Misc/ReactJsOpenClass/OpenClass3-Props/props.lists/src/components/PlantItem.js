

/** 
 * 
 * 
 * Vous allez pouvoir utiliser vos connaissances pour enrichir notre site de plantes 🌱. Le code pour débuter l'exercice se trouve sur P2C4-Begin.

Vous allez créer un composant PlantItem qui sera un composant enfant de ShoppingList.

PlantItem prend en props :

    name   pour le nom de la plante ;

    cover   pour l'image correspondante ;

    id   qui correspond à l'item de chaque élément ;

    light ;

    water.

Les props  name   et  cover   seront utilisées directement dans PlantItem.

light   et  water, que nous avons déjà créées ensemble, seront passées au composant  CareScale   dans  PlantItem.

Vous trouverez dans  styles/PlantItem.css   les classes CSS  lmj-plant-item-cover   et  lmj-plant-item   qui vous aideront à créer de beaux composants 🤩. Je vous propose également de remplacer nos emojis par les icônes 'sun' et 'water' que vous trouverez dans  /assets.

La solution se trouve sur la branche P2C4-Solution.
 * 
 * 
 */




function PlantItem ({name, cover, id, light, water}) {




    return <CareScale careType = 'light' scaleValue = {plant.light}/> 

}

