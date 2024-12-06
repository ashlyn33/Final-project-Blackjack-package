#' Function to create a shuffled shoe containing 4 standard decks
#'
#' This function creates a 4 deck shoe containing 208 cards to be used for game play.
#'
#'@details
#' A shoe is a collection of several card decks used for dealing a card game. In this case, the function will create a shoe containing four standard 52-card decks.
#' Calls the function `card.deck()` to create the shoe, and the resulting shoe will be wrapped into a user function to prepare a new shoe to start or restart a game.
#'
#' @return 208 card shoe comprised of four 52-card decks
#'
#'shuffled.shoe()
shuffled.shoe <- function() {
  one.deck <- card.deck()
  shoe <- one.deck[rep(seq(52), times = 4), ]
  shoe <- shoe[sample(nrow(shoe)), ]

  return(shoe)
}
