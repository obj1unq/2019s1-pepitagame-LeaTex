import wollok.game.*

object manzana {
	var property position = game.at(5,1)
	method image() = "manzana.png"
	
	method energia() = 80
	method nombre() = "Manzana"
}

object alpiste {
	var property position = game.at(5,5)
	method image() = "alpiste.png"
	
	method energia() = 5
	method nombre() = "Alpiste"
}
