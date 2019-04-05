Papier (OD)

Limites connues : ([0] : cosmétique, [1] : pas d'incidence sur l'intelligibilité, [2] grave : perte de sens)
-----------------------------------
- [1] tables des matières : numérotation non arabe (lettre, romain) affichée à gauche (et non à droite)
- [0] widget de titre des sections pas inversé (numéro à droite)
- [0] les images de background seraient à intervertir
- [2] mauvaise gestion par OO du placement des frames volantes dans le cas texte | image
- [1] Gallerie d'image : toujours publiées de gauche à droite  (pour homogénéité avec le web; on pourrait faire autrement facilement)

Eléments modifiés
-------------------
0 Activer les éléments d'interface RTL dans les options LO
1 Général
    style du texte par défaut en RTL
    Miroir sur la page de garde
    Style des listing à laisser en LTR
    styles "indentContent" : mettre 1.5 à droite
    TOC : alignement à droite, pas d’inversion des éléments (car en RTL, cela s’inverse automatiquement)
    Template 'text'_content > resTitle : alignement à droite
    Template 'text'_content > titleSolEx : alignement à droite et décalage à droite non à gauche, miroir sur le fond
    Template 'text'_content > bibEntry : section décalée à droite et non à gauche
    Template 'text'_content > paraKeyword : alignement à droite et décalage à droite non à gauche
    Template 'text'_content > titleRes : alignement à droite
    odTemplateText_content > section : miroir de l’image de fond, page en page de gauche, inversion des marges.     
    ** Gérer : page suivante en page de droite
    titres de niveau 2 à 10 alignés à droite
    Question d'exercice > hintSec décalage à droite de la section et non à gauche 
    passer toutes les tailles de police "Police de script complexe" (dans le fenetre des styles) à la meme valeur que Police d etexte occidental)
   modifier les numérotations de sommaire type "a,b,c,..." en lettres arabes
   tableaux : Format du tableau > Orientation du texte : de droite vers gauche
2 BP
    ** Balises pédagogiques > pbDef (parts : Définition; ) : inversion du fond pour bordure à droite
    ** pour les balise warning et basics : inversion du dégradé
    Placer les frame «A droite » plutôt que « à 0cm de la gauche» 
3 Minitoc
    inversion du fond
    Tab en « alignement à droite » pour que le numéro de page s’aligne à gauche.
    alignement du titre à droite 
4 Contenu
    Activité d'auto-évaluation > quizTitle (parts : Exercice; ) : alignement à droite
    Exercice rédactionnel > descTitle (parts : Mise en contexte; ) : alignement à droite
    Exercice rédactionnel > questTitle (parts : Question;  : alignement à droite
    "odTemplateText > refSolution" : aligné à gauche
    Métadonnées > title : alignement à droite
    Entrée de glossaire (axe : content) > glosDef : décalage à droite de la section et non à gauche
    Métadonnées des contenus pédagogiques (axe : licences) > licence  : alignement à droite
    op_sPara_cpyR_ > paraTag_ : alignement à droite
    WHeaderSection > spaceAfter : alignement à gauche au lieu d’à droite.
    WHeaderSection > pageTitle : alignement à droite
    WHeaderSection > pageTitleNoTdm : alignement à droite
    WPbTitle > pbTitle : alignement à droite
    WQuest > answer : alignement à gauche au lieu d’à droite.
    WTypo > typDef : alignement à droite (les autres se sont alignés tous seuls par héritage de style) 
5 Remarques
 Attention pas d’italic tahoma supporté pour les caractères arabes.
7 Transformers
    ** modification de Ue.tyransf pour afficher le chiffre des titres de niveau 1 à droite (utilisé dans la tdm)
    QCU / QCM : case à cocher à placer à droite via la propriété direction=rtl