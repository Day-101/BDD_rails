a) Niveau facile

    Quel est le nombre total d'objets Album contenus dans la base (sans regarder les id bien sûr) ?
        347 ==> Album.count
    Qui est l'auteur de la chanson "White Room" ?
        Eric Clapton ==> Track.find_by(title: "White Room").artist
    Quelle chanson dure exactement 188133 milliseconds ?
        Perfect ==> Track.find_by(duration: 188133).title
    Quel groupe a sorti l'album "Use Your Illusion II" ?
        Guns and roses ==> Album.find_by(title: "Use Your Illusion II").artist

b) Niveau Moyen

    Combien y a t'il d'albums dont le titre contient "Great" ? (indice)
        13 ==> Album.where("title like ?", "%great%").count
    Supprime tous les albums dont le nom contient "music".
        ==> Album.where("title like ?", "%music%").destroy_all
    Combien y a t'il d'albums écrits par AC/DC ?
        2 ==> Album.where(artist: "AC/DC").count
    Combien de chanson durent exactement 158589 millisecondes ?
        0 ==> Track.where(duration: 158589).count

c) Niveau Difficile

Pour ces questions, tu vas devoir effectuer des boucles dans la console Rails. C'est peu commun mais c'est faisable, tout comme dans IRB.

    puts en console tous les titres de AC/DC.
        ==> Track.where(artist: "AC/DC").each {|i| puts i.title}
    puts en console tous les titres de l'album "Let There Be Rock".
        ==> Track.where(album: "Let There Be Rock").each {|i| puts i.title}
    Calcule le prix total de cet album ainsi que sa durée totale.
        ==> Track.where(album: "Let There Be Rock").reduce(0) {|i,e| i += e.price}.round(2)
        ==> Track.where(album: "Let There Be Rock").reduce(0) {|i,e| i += e.duration}
    Calcule le coût de l'intégralité de la discographie de "Deep Purple".
        ==> Track.where(artist: "Deep Purple").reduce(0) {|i,e| i += e.price}.round(2)
    Modifie (via une boucle) tous les titres de "Eric Clapton" afin qu'ils soient affichés avec "Britney Spears" en artist.
        Pour l'artiste ==> Track.where(artist: "Eric Clapton").update(artist: "Eric Claption, Britney Spears")
        Pour le titre ==>  Track.where(artist: "Eric Clapton").each do |i|
                            i.title = "#{i.title} ft. Britney Spears"
                            i.save
                           end
