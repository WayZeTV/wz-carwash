Config = {

    Blips = {
        position = {
        vector3(167.7510, -1715.665, 29.291),
        vector3(-699.6325, -932.7043, 19.0139),
        vector3(21.159, -1391.7813, 29.3272)
    }
    },

    Marker = {
		type = 21, -- Changer le type du marker (DOC : https://docs.fivem.net/docs/game-references/markers/)
		size = {x = 0.6, y = 0.6, z = 0.6}, -- Modifier la taille du marker
		color = {r = 0, g = 204, b = 255}, -- sur le principe des couleurs RGB (Voir Google "RGB Picker")
		turned = true, -- true = le markeur tourne sur lui même ||| false = le marker ne tourne pas
		jumped = true, -- true = le markeur saute sur lui même ||| false = le marker ne saute pas 
		
		drawdistance = 25 -- Définissez ici la distance d'activation du marker (0.05ms quand il s'active )
    }
}